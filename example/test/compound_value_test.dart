// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:example/compound_value.dart';
import 'package:example/serializers.dart';
import 'package:example/test_enum.dart';
import 'package:example/value.dart';
import 'package:test/test.dart';

void main() {
  group('CompoundValue', () {
    final data = new CompoundValue((b) => b
      ..aValue.anInt = 1
      ..aValue.aString = 'two'
      ..aValue.anObject = 3
      ..aHasInt = new Value((b) => b..anInt = 4..aString = 'five')
      ..aTestEnum = TestEnum.no);
    final serialized = [
      'CompoundValue',
      'aValue',
      [
        'anInt',
        1,
        'aString',
        'two',
        'listOfInt',
        [],
        'anObject',
        ['int', 3],
      ],
      'aHasInt',
      [
        'Value',
        'anInt',
        4,
        'aString',
        'five',
        'listOfInt',
        [],
      ],
      'aTestEnum',
      'no',
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });
}
