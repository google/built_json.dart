// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_json/built_json.dart';

class IntSerializer implements PrimitiveSerializer<int> {
  final bool structured = false;
  final Iterable<Type> types = new BuiltList<Type>([int]);
  final String wireName = 'int';

  @override
  Object serialize(Serializers serializers, int integer,
      {FullType specifiedType: FullType.unspecified}) {
    return integer;
  }

  @override
  int deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: FullType.unspecified}) {
    return serialized as int;
  }
}
