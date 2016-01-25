// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_json/built_json.dart';

class BuiltMapSerializer implements Serializer<BuiltMap> {
  final bool structured = true;
  final Iterable<Type> types = new BuiltList<Type>([BuiltMap]);
  final String wireName = 'map';

  @override
  Object serialize(Serializers serializers, BuiltMap builtMap,
      {FullType specifiedType: const FullType()}) {
    final isUnderspecified =
        specifiedType.isObject || specifiedType.parameters.isEmpty;

    final keyTypes = specifiedType.parameters.isEmpty
        ? const FullType()
        : specifiedType.parameters[0];
    final valueTypes = specifiedType.parameters.isEmpty
        ? const FullType()
        : specifiedType.parameters[1];

    if (!isUnderspecified && !serializers.hasBuilder(specifiedType)) {
      throw new StateError('No builder for $specifiedType, cannot serialize.');
    }

    final result = <Object>[];
    for (final key in builtMap.keys) {
      result.add(serializers.serialize(key, specifiedType: keyTypes));
      final value = builtMap[key];
      result.add(serializers.serialize(value, specifiedType: valueTypes));
    }
    return result;
  }

  @override
  BuiltMap deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: const FullType()}) {
    final isUnderspecified =
        specifiedType.isObject || specifiedType.parameters.isEmpty;

    final keyTypes = specifiedType.parameters.isEmpty
        ? const FullType()
        : specifiedType.parameters[0];
    final valueTypes = specifiedType.parameters.isEmpty
        ? const FullType()
        : specifiedType.parameters[1];

    final result = isUnderspecified
        ? new MapBuilder<Object, Object>()
        : serializers.newBuilder(specifiedType) as MapBuilder;
    if (result == null) {
      throw new StateError(
          'No builder for $specifiedType, cannot deserialize.');
    }
    final list = serialized as List<Object>;

    if (list.length & 1 == 1) {
      throw new ArgumentError('odd length');
    }

    for (int i = 0; i != list.length; i += 2) {
      final key = serializers.deserialize(list[i], specifiedType: keyTypes);
      final value =
          serializers.deserialize(list[i + 1], specifiedType: valueTypes);
      result[key] = value;
    }

    return result.build();
  }
}
