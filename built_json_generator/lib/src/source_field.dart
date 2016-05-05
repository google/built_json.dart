// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_json_generator.source_field;

import 'package:analyzer/src/generated/element.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'source_field.g.dart';

abstract class SourceField implements Built<SourceField, SourceFieldBuilder> {
  static final BuiltMap<String, String> typesWithBuilder =
      new BuiltMap<String, String>({
    'BuiltList': 'ListBuilder',
    'BuiltMap': 'MapBuiler',
    'BuiltSet': 'SetBuilder',
  });

  bool get isSerializable;
  bool get isNullable;
  String get name;
  String get type;
  bool get builderFieldUsesNestedBuilder;

  factory SourceField([updates(SourceFieldBuilder b)]) = _$SourceField;
  SourceField._();

  String get rawType => _getBareType(type);

  static SourceField fromFieldElements(
      FieldElement fieldElement, FieldElement builderFieldElement) {
    final result = new SourceFieldBuilder();
    final isSerializable = fieldElement.getter != null &&
        fieldElement.getter.isAbstract &&
        !fieldElement.isStatic;

    result.isSerializable = isSerializable;

    if (isSerializable) {
      result.isNullable =
          fieldElement.getter.metadata.any((metadata) => metadata.constantValue
              .toStringValue() == 'nullable');
      result.name = fieldElement.displayName;
      result.type = fieldElement.getter.returnType.displayName;
      result.builderFieldUsesNestedBuilder = builderFieldElement != null &&
          fieldElement.getter.returnType.displayName !=
              builderFieldElement.getter.returnType.displayName;
    }

    return result.build();
  }

  String generateFullType() {
    return _generateFullType(type);
  }

  bool get needsBuilder => typesWithBuilder.containsKey(_getBareType(type));

  String generateBuilder() {
    return 'new ${typesWithBuilder[_getBareType(type)]}<${_getGenerics(type)}>()';
  }

  static String _generateFullType(String type) {
    // TODO(davidmorgan): support more than one level of nesting.
    final bareType = _getBareType(type);
    final generics = _getGenerics(type);
    final genericItems = generics.split(', ');

    if (generics.isEmpty) {
      return 'const FullType($bareType)';
    } else {
      return 'const FullType($bareType, const [${genericItems.map(_generateFullType).join(', ')}])';
    }
  }

  static String _getBareType(String name) {
    final genericsStart = name.indexOf('<');
    return genericsStart == -1 ? name : name.substring(0, genericsStart);
  }

  static String _getGenerics(String name) {
    final genericsStart = name.indexOf('<');
    return genericsStart == -1
        ? ''
        : name
            .substring(genericsStart + 1)
            .substring(0, name.length - genericsStart - 2);
  }
}

abstract class SourceFieldBuilder
    implements Builder<SourceField, SourceFieldBuilder> {
  bool isSerializable;
  bool isNullable = false;
  String name = '';
  String type = '';
  bool builderFieldUsesNestedBuilder = false;

  factory SourceFieldBuilder() = _$SourceFieldBuilder;
  SourceFieldBuilder._();
}
