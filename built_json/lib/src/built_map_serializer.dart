// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_json/built_json.dart';

class BuiltMapSerializer implements BuiltJsonSerializer<BuiltMap> {
  final Type type = BuiltMap;
  final String typeName = 'Map';

  Object serialize(BuiltJsonSerializers builtJsonSerializers, BuiltMap object,
      {String expectedType}) {
    final expectedKeyType =
        expectedType.substring(0, expectedType.indexOf(', '));
    final expectedValueType =
        expectedType.substring(expectedType.indexOf(', ') + 2);

    final result = <Object>[];
    for (final key in object.keys) {
      result.add(
          builtJsonSerializers.serialize(key, expectedType: expectedKeyType));
      final value = object[key];
      result.add(builtJsonSerializers.serialize(value,
          expectedType: expectedValueType));
    }
    return result;
  }

  BuiltMap deserialize(BuiltJsonSerializers builtJsonSerializers, Object object,
      {String expectedType}) {
    final expectedKeyType =
        expectedType.substring(0, expectedType.indexOf(', '));
    final expectedValueType =
        expectedType.substring(expectedType.indexOf(', ') + 2);

    final result = new MapBuilder<Object, Object>();
    final list = object as List<Object>;

    if (list.length & 1 == 1) {
      throw new ArgumentError('odd length');
    }

    for (int i = 0; i != list.length; i += 2) {
      final key = builtJsonSerializers.deserialize(list[i],
          expectedType: expectedKeyType);
      final value = builtJsonSerializers.deserialize(list[i + 1],
          expectedType: expectedValueType);
      result[key] = value;
    }

    return result.build();
  }
}
