// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_json/built_json.dart';
import 'package:test/test.dart';

void main() {
  final serializers = new Serializers();

  group('bool with known genericType', () {
    final data = true;
    final serialized = true;
    final genericType = const GenericType(bool);

    test('can be serialized', () {
      expect(serializers.serialize(data, genericType: genericType), serialized);
    });

    test('can be deserialized', () {
      expect(
          serializers.deserialize(serialized, genericType: genericType), data);
    });
  });

  group('bool with unknown genericType', () {
    final data = true;
    final serialized = ['bool', true];
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
