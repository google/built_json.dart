// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_json/built_json.dart';
import 'package:test/test.dart';

void main() {
  final serializers = new Serializers();

  group('BuiltSet with known genericType', () {
    final data = new BuiltSet<int>([1, 2, 3]);
    final genericType =
        const GenericType(BuiltSet, const [const GenericType(int)]);
    final serialized = [1, 2, 3];

    test('can be serialized', () {
      expect(serializers.serialize(data, genericType: genericType), serialized);
    });

    test('can be deserialized', () {
      expect(
          serializers.deserialize(serialized, genericType: genericType), data);
    });

    test('loses generic type without builder', () {
      expect(
          serializers
              .deserialize(serialized, genericType: genericType)
              .runtimeType
              .toString(),
          'BuiltSet<Object>');
    });

    test('keeps generic type with builder', () {
      final genericSerializer = (serializers.toBuilder()
        ..addBuilderFactory(genericType, () => new SetBuilder<int>())).build();

      expect(
          genericSerializer
              .deserialize(serialized, genericType: genericType)
              .runtimeType
              .toString(),
          'BuiltSet<int>');
    });
  });

  group('BuiltSet with unknown genericType', () {
    final data = new BuiltSet<int>([1, 2, 3]);
    final genericType = const GenericType();
    final serialized = [
      'set',
      ['int', 1],
      ['int', 2],
      ['int', 3]
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data, genericType: genericType), serialized);
    });

    test('can be deserialized', () {
      expect(
          serializers.deserialize(serialized, genericType: genericType), data);
    });
  });
}
