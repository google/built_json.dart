// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_json/built_json.dart';

// TODO(davidmorgan): support special values.
class DoubleSerializer implements Serializer<double> {
  final bool structured = false;
  final Iterable<Type> types = new BuiltList<Type>([double]);
  final String wireName = 'double';

  @override
  Object serialize(Serializers serializers, double aDouble,
      {FullType specifiedType: const FullType()}) {
    return aDouble;
  }

  @override
  double deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: const FullType()}) {
    return (serialized as num).toDouble();
  }
}
