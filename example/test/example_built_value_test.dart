// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:example/value.dart';
import 'package:test/test.dart';

void main() {
  group('Value', () {
    test('can be serialized', () {
      final value = new Value((b) => b
        ..anInt = 1
        ..aString = 'two'
        ..anObject = 3);

      // TODO(davidmorgan): why is List<int> explicit here?
      expect(builtJsonSerializers.serialize(value), {
        'Value': {
          'anInt': 1,
          'aString': 'two',
          'anObject': {'int': 3},
          'aDefaultInt': 7,
          'listOfInt': {'List<int>': []},
        }
      });
    });

    test('can be deserialized', () {
      final value = new Value((b) => b
        ..anInt = 1
        ..aString = 'two'
        ..anObject = 3);

      expect(
          builtJsonSerializers
              .deserialize(builtJsonSerializers.serialize(value)),
          value);
    });
  });
}
