// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_json/built_json.dart';
import 'package:test/test.dart';

void main() {
  final serializer = new BuiltJsonSerializers();

  group('String', () {
    test('can be serialized', () {
      expect(serializer.serialize('hello'), {'String': 'hello'});
    });

    test('can be deserialized', () {
      expect(serializer.deserialize(serializer.serialize('hello')), 'hello');
    });
  });
}
