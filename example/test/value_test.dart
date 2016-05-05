// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.

// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:example/serializers.dart';
import 'package:example/value.dart';
import 'package:test/test.dart';

void main() {
  group('Value', () {
    final data = new Value((b) => b
      ..anInt = 1
      ..aString = 'two'
      ..anObject = 3);
    final serialized = [
      'Value',
      'anInt',
      1,
      'aString',
      'two',
      'aDefaultInt',
      7,
      'listOfInt',
      [],
      'anObject',
      ['int', 3],
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });
}
