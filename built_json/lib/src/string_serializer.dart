// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_json/built_json.dart';

class StringSerializer implements Serializer<String> {
  final bool structured = false;
  final Iterable<Type> types = new BuiltList<Type>([String]);
  final String wireName = 'String';

  @override
  Object serialize(Serializers serializers, String string,
      {FullType specifiedType: const FullType()}) {
    return string;
  }

  @override
  String deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: const FullType()}) {
    return serialized as String;
  }
}
