// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_json/built_json.dart';

class BoolSerializer implements BuiltJsonSerializer<bool> {
  final Type type = bool;
  final String typeName = 'bool';

  Object serialize(BuiltJsonSerializers builtJsonSerializers, bool object,
      {String expectedType}) {
    return object;
  }

  bool deserialize(BuiltJsonSerializers builtJsonSerializers, Object object,
      {String expectedType}) {
    return object as bool;
  }
}
