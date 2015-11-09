// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_json/built_json.dart';
import 'package:test/test.dart';

void main() {
  final serializers = new Serializers();

  group('BuiltList with known genericType', () {
    final data = new BuiltList<int>([1, 2, 3]);
    final genericType =
        const GenericType(BuiltList, const [const GenericType(int)]);
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
          'BuiltList<Object>');
    });

    test('keeps generic type with builder', () {
      final genericSerializer = (serializers.toBuilder()
        ..addBuilderFactory(genericType, () => new ListBuilder<int>())).build();

      expect(
          genericSerializer
              .deserialize(serialized, genericType: genericType)
              .runtimeType
              .toString(),
          'BuiltList<int>');
    });
  });

  group('BuiltList nested with known genericType', () {
    final data = new BuiltList<BuiltList<int>>([
      new BuiltList<int>([1, 2, 3]),
      new BuiltList<int>([4, 5, 6]),
      new BuiltList<int>([7, 8, 9])
    ]);
    final genericType = const GenericType(BuiltList, const [
      const GenericType(BuiltList, const [const GenericType(int)])
    ]);
    final serialized = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data, genericType: genericType), serialized);
    });

    test('can be deserialized', () {
      expect(
          serializers.deserialize(serialized, genericType: genericType), data);
    });
  });

  group('BuiltList with unknown genericType', () {
    final data = new BuiltList<int>([1, 2, 3]);
    final genericType = const GenericType();
    final serialized = [
      'list',
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
