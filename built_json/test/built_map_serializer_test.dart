// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_json/built_json.dart';
import 'package:test/test.dart';

void main() {
  final serializers = new Serializers();

  group('BuiltMap with known genericType', () {
    final data = new BuiltMap<int, String>({1: 'one', 2: 'two', 3: 'three'});
    final genericType = const GenericType(
        BuiltMap, const [const GenericType(int), const GenericType(String)]);
    final serialized = [1, 'one', 2, 'two', 3, 'three'];

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
          'BuiltMap<Object, Object>');
    });

    test('keeps generic type with builder', () {
      final genericSerializer = (serializers.toBuilder()
        ..addBuilderFactory(
            genericType, () => new MapBuilder<int, String>())).build();

      expect(
          genericSerializer
              .deserialize(serialized, genericType: genericType)
              .runtimeType
              .toString(),
          'BuiltMap<int, String>');
    });
  });

  group('BuiltMap nested left with known genericType', () {
    final data = new BuiltMap<BuiltMap<int, String>, String>({
      new BuiltMap<int, String>({1: 'one'}): 'one!',
      new BuiltMap<int, String>({2: 'two'}): 'two!'
    });
    final genericType = const GenericType(BuiltMap, const [
      const GenericType(
          BuiltMap, const [const GenericType(int), const GenericType(String)]),
      const GenericType(String)
    ]);
    final serialized = [
      [1, 'one'],
      'one!',
      [2, 'two'],
      'two!'
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data, genericType: genericType), serialized);
    });

    test('can be deserialized', () {
      expect(
          serializers.deserialize(serialized, genericType: genericType), data);
    });
  });

  group('BuiltMap nested right with known genericType', () {
    final data = new BuiltMap<int, BuiltMap<String, String>>({
      1: new BuiltMap<String, String>({'one': 'one!'}),
      2: new BuiltMap<String, String>({'two': 'two!'})
    });
    final genericType = const GenericType(BuiltMap, const [
      const GenericType(int),
      const GenericType(BuiltMap,
          const [const GenericType(String), const GenericType(String)])
    ]);
    final serialized = [
      1,
      ['one', 'one!'],
      2,
      ['two', 'two!']
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data, genericType: genericType), serialized);
    });

    test('can be deserialized', () {
      expect(
          serializers.deserialize(serialized, genericType: genericType), data);
    });
  });

  group('BuiltMap nested both with known genericType', () {
    final data = new BuiltMap<BuiltMap<int, int>, BuiltMap<String, String>>({
      new BuiltMap<int, int>({1: 1}):
          new BuiltMap<String, String>({'one': 'one!'}),
      new BuiltMap<int, int>({2: 2}):
          new BuiltMap<String, String>({'two': 'two!'})
    });
    const builtMapOfIntIntGenericType = const GenericType(
        BuiltMap, const [const GenericType(int), const GenericType(int)]);
    const builtMapOfStringStringGenericType = const GenericType(
        BuiltMap, const [const GenericType(String), const GenericType(String)]);
    final genericType = const GenericType(BuiltMap,
        const [builtMapOfIntIntGenericType, builtMapOfStringStringGenericType]);
    final serialized = [
      [1, 1],
      ['one', 'one!'],
      [2, 2],
      ['two', 'two!']
    ];

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
          'BuiltMap<Object, Object>');
    });

    test('keeps generic type with builder', () {
      final genericSerializer = (serializers.toBuilder()
        ..addBuilderFactory(
            genericType,
            () =>
                new MapBuilder<BuiltMap<int, int>, BuiltMap<String, String>>())
        ..addBuilderFactory(
            builtMapOfIntIntGenericType, () => new MapBuilder<int, int>())
        ..addBuilderFactory(builtMapOfStringStringGenericType,
            () => new MapBuilder<String, String>())).build();

      expect(
          genericSerializer
              .deserialize(serialized, genericType: genericType)
              .runtimeType
              .toString(),
          'BuiltMap<BuiltMap<int, int>, BuiltMap<String, String>>');
    });
  });

  group('BuiltMap with Object values', () {
    final data = new BuiltMap<int, Object>({1: 'one', 2: 2, 3: 'three'});
    final genericType = const GenericType(
        BuiltMap, const [const GenericType(int), const GenericType()]);
    final serialized = [
      1,
      ['String', 'one'],
      2,
      ['int', 2],
      3,
      ['String', 'three']
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data, genericType: genericType), serialized);
    });

    test('can be deserialized', () {
      expect(
          serializers.deserialize(serialized, genericType: genericType), data);
    });
  });

  group('BuiltMap with Object keys', () {
    final data =
        new BuiltMap<Object, String>({1: 'one', 'two': 'two', 3: 'three'});
    final genericType = const GenericType(
        BuiltMap, const [const GenericType(), const GenericType(String)]);
    final serialized = [
      ['int', 1],
      'one',
      ['String', 'two'],
      'two',
      ['int', 3],
      'three'
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data, genericType: genericType), serialized);
    });

    test('can be deserialized', () {
      expect(
          serializers.deserialize(serialized, genericType: genericType), data);
    });
  });

  group('BuiltMap with Object keys and values', () {
    final data = new BuiltMap<Object, Object>({1: 'one', 'two': 2, 3: 'three'});
    final genericType = const GenericType(BuiltMap);
    final serialized = [
      ['int', 1],
      ['String', 'one'],
      ['String', 'two'],
      ['int', 2],
      ['int', 3],
      ['String', 'three']
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data, genericType: genericType), serialized);
    });

    test('can be deserialized', () {
      expect(
          serializers.deserialize(serialized, genericType: genericType), data);
    });
  });

  group('BuiltMap with unknown genericType', () {
    final data = new BuiltMap<Object, Object>({1: 'one', 'two': 2, 3: 'three'});
    final genericType = const GenericType();
    final serialized = [
      'map',
      ['int', 1],
      ['String', 'one'],
      ['String', 'two'],
      ['int', 2],
      ['int', 3],
      ['String', 'three']
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
