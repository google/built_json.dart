// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_json/built_json.dart';

class BuiltSetSerializer implements Serializer<BuiltSet> {
  final bool structured = true;
  final Iterable<Type> types = new BuiltList<Type>([BuiltSet]);
  final String wireName = 'set';

  @override
  Object serialize(Serializers serializers, BuiltSet builtSet,
      {FullType specifiedType: const FullType()}) {
    final isUnderspecified =
        specifiedType.isObject || specifiedType.parameters.isEmpty;

    final valueGenericType = specifiedType.parameters.isEmpty
        ? const FullType()
        : specifiedType.parameters[0];

    if (!isUnderspecified && !serializers.hasBuilder(specifiedType)) {
      throw new StateError('No builder for $specifiedType, cannot serialize.');
    }

    return builtSet.map(
        (item) => serializers.serialize(item, specifiedType: valueGenericType));
  }

  @override
  BuiltSet deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: const FullType()}) {
    final isUnderspecified =
        specifiedType.isObject || specifiedType.parameters.isEmpty;

    final valueGenericType = specifiedType.parameters.isEmpty
        ? const FullType()
        : specifiedType.parameters[0];
    final result = isUnderspecified
        ? new SetBuilder<Object>()
        : serializers.newBuilder(specifiedType) as SetBuilder;
    if (result == null) {
      throw new StateError(
          'No builder for $specifiedType, cannot deserialize.');
    }
    result.addAll((serialized as Iterable).map((item) =>
        serializers.deserialize(item, specifiedType: valueGenericType)));
    return result.build();
  }
}
