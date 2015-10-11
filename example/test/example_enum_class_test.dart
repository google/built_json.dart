// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:example/test_enum.dart';
import 'package:test/test.dart';

void main() {
  group('TestEnum', () {
    test('can be serialized', () {
      expect(builtJsonSerializers.serialize(TestEnum.yes), {'TestEnum': 'yes'});
    });

    test('can be deserialized', () {
      expect(
          builtJsonSerializers
              .deserialize(builtJsonSerializers.serialize(TestEnum.maybe)),
          TestEnum.maybe);
    });
  });
}
