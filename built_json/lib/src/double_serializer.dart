// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_json/built_json.dart';

// TODO(davidmorgan): support special values.
class DoubleSerializer implements BuiltJsonSerializer<double> {
  final Type type = double;
  final String typeName = 'double';

  Object serialize(BuiltJsonSerializers builtJsonSerializers, double object,
      {String expectedType}) {
    return object.toString();
  }

  double deserialize(BuiltJsonSerializers builtJsonSerializers, Object object,
      {String expectedType}) {
    return double.parse(object as String);
  }
}
