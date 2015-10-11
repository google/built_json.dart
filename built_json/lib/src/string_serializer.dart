// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_json/built_json.dart';

class StringSerializer implements BuiltJsonSerializer<String> {
  final Type type = String;
  final String typeName = 'String';

  Object serialize(BuiltJsonSerializers builtJsonSerializers, String object,
      {String expectedType}) {
    return object;
  }

  String deserialize(BuiltJsonSerializers builtJsonSerializers, Object object,
      {String expectedType}) {
    return object as String;
  }
}
