// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_json_generator.source_field;

import 'package:analyzer/src/generated/element.dart';
import 'package:built_value/built_value.dart';

part 'source_field.g.dart';

abstract class SourceField implements Built<SourceField, SourceFieldBuilder> {
  bool get isSerializable;
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
      result.name = fieldElement.displayName;
      result.type = fieldElement.getter.returnType.displayName;
      result.builderFieldUsesNestedBuilder = builderFieldElement != null &&
          fieldElement.getter.returnType.displayName !=
              builderFieldElement.getter.returnType.displayName;
    }

    return result.build();
  }

  String generateGenericType() {
    return _generateGenericType(type);
  }

  static String _generateGenericType(String type) {
    // TODO(davidmorgan): support more than one level of nesting.
    final bareType = _getBareType(type);
    final generics = _getGenerics(type);
    final genericItems = generics.split(', ');

    if (generics.isEmpty) {
      return 'const GenericType($bareType)';
    } else {
      return 'const GenericType($bareType, const [${genericItems.map(_generateGenericType).join(', ')}])';
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
  String name = '';
  String type = '';
  bool builderFieldUsesNestedBuilder = false;

  factory SourceFieldBuilder() = _$SourceFieldBuilder;
  SourceFieldBuilder._();
}
