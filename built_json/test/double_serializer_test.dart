// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_json/built_json.dart';
import 'package:test/test.dart';

void main() {
  final serializers = new Serializers();

  group('double with known genericType', () {
    final data = 3.141592653589793;
    final serialized = '3.141592653589793';
    final genericType = const GenericType(double);

    test('can be serialized', () {
      expect(serializers.serialize(data, genericType: genericType), serialized);
    });

    test('can be deserialized', () {
      expect(
          serializers.deserialize(serialized, genericType: genericType), data);
    });
  });

  group('double with unknown genericType', () {
    final data = 3.141592653589793;
    final serialized = ['double', '3.141592653589793'];
    final genericType = const GenericType();

    test('can be serialized', () {
      expect(serializers.serialize(data, genericType: genericType), serialized);
    });

    test('can be deserialized', () {
      expect(
          serializers.deserialize(serialized, genericType: genericType), data);
    });
  });
}
