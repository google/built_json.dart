// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_json_generator.source_class;

import 'package:analyzer/src/generated/element.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_json_generator/src/source_field.dart';
import 'package:built_value/built_value.dart';

part 'source_class.g.dart';

abstract class SourceClass implements Built<SourceClass, SourceClassBuilder> {
  String get name;
  bool get isBuiltValue;
  bool get isEnumClass;
  BuiltList<SourceField> get fields;

  factory SourceClass([updates(SourceClassBuilder b)]) = _$SourceClass;
  SourceClass._();

  static SourceClass fromClassElements(
      ClassElement classElement, ClassElement builderClassElement) {
    final result = new SourceClassBuilder();

    result.name = classElement.name;

    // TODO(davidmorgan): better check.
    result.isBuiltValue = classElement.allSupertypes
            .map((type) => type.name)
            .any((name) => name.startsWith('Built')) &&
        !classElement.name.startsWith(r'_$') &&
        classElement.fields.any((field) => field.name == 'serializer');

    // TODO(davidmorgan): better check.
    result.isEnumClass = classElement.allSupertypes
            .map((type) => type.name)
            .any((name) => name == 'EnumClass') &&
        !classElement.name.startsWith(r'_$') &&
        classElement.fields.any((field) => field.name == 'serializer');

    for (final fieldElement in classElement.fields) {
      final builderFieldElement =
          builderClassElement?.getField(fieldElement.displayName);
      final sourceField =
          SourceField.fromFieldElements(fieldElement, builderFieldElement);
      if (sourceField.isSerializable) {
        result.fields.add(sourceField);
      }
    }

    return result.build();
  }

  bool get needsBuiltJson => isBuiltValue || isEnumClass;

  String generateTransitiveSerializerAdder() {
    return '..add(${name}.serializer)';
  }

  String generateSerializerDeclaration() {
    final camelCaseName = _toCamelCase(name);
    return 'Serializer<$name> '
        '_\$${camelCaseName}Serializer = '
        'new _\$${name}Serializer();';
  }

  String generateSerializer() {
    if (isBuiltValue) {
      return '''
class _\$${name}Serializer implements Serializer<$name> {
  final bool structured = true;
  final Iterable<Type> types = new BuiltList<Type>([$name, _\$$name]);
  final String wireName = '$name';

  @override
  Object serialize(Serializers serializers, $name object,
      {GenericType genericType: const GenericType()}) {
    return [${_generateFieldSerializers()}];
  }

  @override
  $name deserialize(Serializers serializers, Object object,
      {GenericType genericType: const GenericType()}) {
    final result = new ${name}Builder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in object as List) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          ${_generateFieldDeserializers()}
        }
      }
    }

    return result.build();
  }
}
''';
    } else if (isEnumClass) {
      return '''
class _\$${name}Serializer implements Serializer<$name> {
  final bool structured = false;
  final Iterable<Type> types = new BuiltList<Type>([$name]);
  final String wireName = '$name';

  @override
  Object serialize(Serializers serializers, $name object,
      {GenericType genericType: const GenericType()}) {
    return object.name;
  }

  @override
  $name deserialize(Serializers serializers, Object object,
      {GenericType genericType: const GenericType()}) {
    return ${name}.valueOf(object);
  }
}
''';
    } else {
      throw new UnsupportedError('not serializable');
    }
  }

  String _generateFieldSerializers() {
    return fields
        .map((field) => "'${field.name}', "
            "serializers.serialize(object.${field.name}, "
            "genericType: ${field.generateGenericType()}),")
        .join('');
  }

  String _generateFieldDeserializers() {
    return fields.map((field) {
      if (field.builderFieldUsesNestedBuilder) {
        return '''
case '${field.name}':
  result.${field.name}.replace(serializers.deserialize(
      value, genericType: ${field.generateGenericType()}));
  break;
''';
      } else {
        return '''
case '${field.name}':
  result.${field.name} = serializers.deserialize(
      value, genericType: ${field.generateGenericType()});
  break;
''';
      }
    }).join('');
  }

  static String _toCamelCase(String name) {
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
}

abstract class SourceClassBuilder
    implements Builder<SourceClass, SourceClassBuilder> {
  String name;
  bool isBuiltValue;
  bool isEnumClass;
  ListBuilder<SourceField> fields = new ListBuilder<SourceField>();

  factory SourceClassBuilder() = _$SourceClassBuilder;
  SourceClassBuilder._();
}
