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
  Object serialize(Serializers serializers, BuiltMap object,
      {GenericType genericType: const GenericType()}) {
    final keyTypes = genericType.parameters.isEmpty
        ? const GenericType()
        : genericType.parameters[0];
    final valueTypes = genericType.parameters.isEmpty
        ? const GenericType()
        : genericType.parameters[1];

    final result = <Object>[];
    for (final key in object.keys) {
      result.add(serializers.serialize(key, genericType: keyTypes));
      final value = object[key];
      result.add(serializers.serialize(value, genericType: valueTypes));
    }
    return result;
  }

  @override
  BuiltMap deserialize(Serializers serializers, Object object,
      {GenericType genericType: const GenericType()}) {
    final keyTypes = genericType.parameters.isEmpty
        ? const GenericType()
        : genericType.parameters[0];
    final valueTypes = genericType.parameters.isEmpty
        ? const GenericType()
        : genericType.parameters[1];

    final result = serializers.newBuilder(genericType) as MapBuilder ??
        new MapBuilder<Object, Object>();
    final list = object as List<Object>;

    if (list.length & 1 == 1) {
      throw new ArgumentError('odd length');
    }

    for (int i = 0; i != list.length; i += 2) {
      final key = serializers.deserialize(list[i], genericType: keyTypes);
      final value =
          serializers.deserialize(list[i + 1], genericType: valueTypes);
      result[key] = value;
    }

    return result.build();
  }
}
