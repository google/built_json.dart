// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_json/built_json.dart';

class BuiltSetSerializer implements BuiltJsonSerializer<BuiltSet> {
  final Type type = BuiltSet;
  final String typeName = 'Set';

  Object serialize(BuiltJsonSerializers builtJsonSerializers, BuiltSet object,
      {String expectedType}) {
    return object
        .map((item) =>
            builtJsonSerializers.serialize(item, expectedType: expectedType))
        .toList();
  }

  BuiltSet deserialize(BuiltJsonSerializers builtJsonSerializers, Object object,
      {String expectedType}) {
    return new BuiltSet<Object>((object as Iterable).map((item) =>
        builtJsonSerializers.deserialize(item, expectedType: expectedType)));
  }
}
