// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_json/built_json.dart';
import 'package:test/test.dart';

void main() {
  final serializers = new Serializers();

  group('double with known specifiedType', () {
    final data = 3.141592653589793;
    final serialized = data;
    final specifiedType = const FullType(double);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType), serialized);
    });

    test('can be deserialized', () {
      expect(
          serializers.deserialize(serialized, specifiedType: specifiedType), data);
    });
  });

  group('double with unknown specifiedType', () {
    final data = 3.141592653589793;
    final serialized = ['double', data];
    final specifiedType = const FullType();

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType), serialized);
    });

    test('can be deserialized', () {
      expect(
          serializers.deserialize(serialized, specifiedType: specifiedType), data);
    });
  });
}
