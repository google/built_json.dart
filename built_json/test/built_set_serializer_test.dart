// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_json/built_json.dart';
import 'package:test/test.dart';

void main() {
  final serializer = new BuiltJsonSerializers();

  group('BuiltSet', () {
    test('can be serialized', () {
      final list = new BuiltSet<int>([1, 2, 3]);
      expect(serializer.serialize(list), {
        'Set<int>': [1, 2, 3]
      });
    });

    test('can be deserialized', () {
      final list = new BuiltSet<int>([1, 2, 3]);
      expect(serializer.deserialize(serializer.serialize(list)), list);
    });

    test('can be serialized when nested', () {
      final list = new BuiltSet<BuiltSet<int>>([
        new BuiltSet<int>([1, 2, 3]),
        new BuiltSet<int>([2, 3, 4]),
        new BuiltSet<int>([3, 4, 5])
      ]);

      expect(serializer.serialize(list), {
        'Set<Set<int>>': [
          [1, 2, 3],
          [2, 3, 4],
          [3, 4, 5]
        ]
      });
    });

    test('can be deserialized when nested', () {
      final list = new BuiltSet<BuiltSet<int>>([
        new BuiltSet<int>([1, 2, 3]),
        new BuiltSet<int>([2, 3, 4]),
        new BuiltSet<int>([3, 4, 5])
      ]);

      expect(serializer.deserialize(serializer.serialize(list)), list);
    });
  });
}
