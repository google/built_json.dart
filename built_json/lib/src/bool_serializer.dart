// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_json/built_json.dart';

class BoolSerializer implements PrimitiveSerializer<bool> {
  final bool structured = false;
  final Iterable<Type> types = new BuiltList<Type>([bool]);
  final String wireName = 'bool';

  @override
  Object serialize(Serializers serializers, bool boolean,
      {FullType specifiedType: FullType.unspecified}) {
    return boolean;
  }

  @override
  bool deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: FullType.unspecified}) {
    return serialized as bool;
  }
}
