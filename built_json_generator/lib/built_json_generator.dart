// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_json_generator;

import 'dart:async';

import 'package:analyzer/src/generated/element.dart';
import 'package:source_gen/source_gen.dart';

/// Generator for Built JSON.
///
/// See <https://github.com/google/built_json.dart/tree/master/example>
class BuiltJsonGenerator extends Generator {
  Future<String> generate(Element element) async {
    if (element is! LibraryElement) return null;

    final libraryElement = element as LibraryElement;

    final serializableClasses = <ClassElement>[];
    final classElementVisitor = new _ClassExtractorVisitor();
    libraryElement.visitChildren(classElementVisitor);

    for (final classElement in classElementVisitor.classElements) {
      if (isEnumClass(classElement) || isBuiltValue(classElement)) {
        serializableClasses.add(classElement);
      }
    }

    // TODO(davidmorgan): better way of checking for top level declaration.
    final needsBuiltJsonSerializers = libraryElement.exportNamespace
            ?.definedNames?.containsKey('builtJsonSerializers') ??
        false;

    if (serializableClasses.isEmpty && !needsBuiltJsonSerializers) {
      return null;
    }

    // Try to also find field types that need to be serialized.
    // TODO(davidmorgan): go deeper. Or, insist on generated serializers?
    final dependencyClasses = <ClassElement>[];
    for (final classElement in serializableClasses) {
      for (final field in classElement.fields) {
        if (!field.isStatic &&
            field.getter != null &&
            field.getter.isAbstract) {
          if (field.getter.returnType.element is ClassElement) {
            final nestedClassElement = field.getter.returnType.element;
            if (isEnumClass(nestedClassElement) ||
                isBuiltValue(nestedClassElement)) {
              dependencyClasses.add(nestedClassElement);
            }
          }
        }
      }
    }

    return (needsBuiltJsonSerializers
            ? 'BuiltJsonSerializers _\$builtJsonSerializers = new BuiltJsonSerializers()' +
                serializableClasses.map(generateSerializerAdder).join('') +
                dependencyClasses
                    .map(generateTransitiveSerializerAdder)
                    .join('') +
                ';'
            : '') +
        serializableClasses.map(generateSerializerDeclaration).join('') +
        serializableClasses.map(generateSerializer).join('');
  }

  static String generateSerializerAdder(ClassElement classElement) {
    return '..add(new _\$${classElement.displayName}Serializer())';
  }

  static String generateTransitiveSerializerAdder(ClassElement classElement) {
    return '..add(${classElement.displayName}.serializer)';
  }

  static String toCamelCase(String name) {
    var result = '';
    var upperCase = false;
    var firstCharacter = true;
    for (final char in name.split('')) {
      if (char == '_') {
        upperCase = true;
      } else {
        result += firstCharacter
            ? char.toLowerCase()
            : (upperCase ? char.toUpperCase() : char);
        upperCase = false;
        firstCharacter = false;
      }
    }
    return result;
  }

  static bool isEnumClass(ClassElement classElement) {
    // TODO(davidmorgan): better test for serializer field.
    return classElement.allSupertypes
            .map((type) => type.displayName)
            .any((displayName) => displayName == 'EnumClass') &&
        !classElement.displayName.startsWith(r'_$') &&
        classElement.fields.any((field) => field.displayName == 'serializer');
  }

  static bool isBuiltValue(ClassElement classElement) {
    // TODO(davidmorgan): better test for serializer field.
    return classElement.allSupertypes
            .map((type) => type.displayName)
            .any((displayName) => displayName.startsWith('Built')) &&
        !classElement.displayName.startsWith(r'_$') &&
        classElement.fields.any((field) => field.displayName == 'serializer');
  }

  static String generateSerializerDeclaration(ClassElement classElement) {
    final camelCaseName = toCamelCase(classElement.displayName);
    return 'BuiltJsonSerializer<${classElement.displayName}> '
        '_\$${camelCaseName}Serializer = '
        'new _\$${classElement.displayName}Serializer();';
  }

  static String generateSerializer(ClassElement classElement) {
    final className = classElement.displayName;

    if (isBuiltValue(classElement)) {
      return 'class _\$${className}Serializer implements BuiltJsonSerializer<$className> {'
          'final Type type = _\$$className;'
          "final String typeName = '$className';"
          'Object serialize(BuiltJsonSerializers builtJsonSerializers, '
          '$className object,'
          '{String expectedType}) {'
          'return {' +
          generateFieldSerializers(classElement) +
          '};'
          '}'
          '$className deserialize(BuiltJsonSerializers builtJsonSerializers,'
          'Object object,'
          '{String expectedType}) {'
          'return new $className((b) => b' +
          generateFieldDeserializers(classElement) +
          ');' +
          '}'
          '}';
    } else if (isEnumClass(classElement)) {
      return 'class _\$${className}Serializer implements BuiltJsonSerializer<$className> {'
          'final Type type = $className;'
          "final String typeName = '$className';"
          'Object serialize(BuiltJsonSerializers builtJsonSerializers, '
          '$className object,'
          '{String expectedType}) {'
          "return object.name;"
          '}'
          '$className deserialize(BuiltJsonSerializers builtJsonSerializers,'
          'Object object,'
          '{String expectedType}) {'
          'return ${className}.valueOf(object);'
          '}'
          '}';
    } else {
      throw new UnsupportedError('');
    }
  }

  static String generateFieldSerializers(ClassElement classElement) {
    return classElement.fields
        .where((field) =>
            field.getter != null && field.getter.isAbstract && !field.isStatic)
        .map((field) => "'${field.displayName}': "
            "builtJsonSerializers.serialize(object.${field.displayName}, "
            "expectedType: '${field.getter.returnType.displayName}'),")
        .join('');
  }

  static String generateFieldDeserializers(ClassElement classElement) {
    return classElement.fields
        .where((field) =>
            field.getter != null && field.getter.isAbstract && !field.isStatic)
        .map((field) {
      final builderClassElement =
          classElement.library.getType(classElement.displayName + 'Builder');
      // TODO(davidmorgan): need a better way to detect if field uses a builder.
      final usesBuilder = builderClassElement?.fields
          .where(
              (builderField) => builderField.displayName == field.displayName)
          .firstWhere((_) => true, orElse: null)
          ?.getter
          ?.returnType
          .displayName
          .contains('Builder');

      if (usesBuilder) {
        return '..${field.displayName}.replace('
            "builtJsonSerializers.deserialize(object['${field.displayName}'], "
            "expectedType: '${field.getter.returnType.displayName}'))";
      } else {
        return '..${field.displayName} = '
            "builtJsonSerializers.deserialize(object['${field.displayName}'], "
            "expectedType: '${field.getter.returnType.displayName}')";
      }
    }).join('');
  }
}

class _ClassExtractorVisitor extends SimpleElementVisitor {
  final List<ClassElement> classElements = new List<ClassElement>();

  @override
  visitClassElement(ClassElement element) {
    classElements.add(element);
  }

  @override
  visitCompilationUnitElement(CompilationUnitElement element) {
    element.visitChildren(this);
  }
}
