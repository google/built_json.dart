// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library compound_value;

import 'package:built_json/built_json.dart';
import 'package:built_value/built_value.dart';
import 'package:example/has_int.dart';
import 'package:example/test_enum.dart';
import 'package:example/value.dart';

part 'compound_value.g.dart';

/// Example built_value type.
abstract class CompoundValue
    implements Built<CompoundValue, CompoundValueBuilder> {
  /// Example of how to make a built_value type serializable.
  ///
  /// Declare a static final [Serializers] field called `serializer`.
  /// The built_json code generator will provide the implementation. You need to
  /// do this for every type you want to serialize.
  static final Serializer<CompoundValue> serializer = _$compoundValueSerializer;

  Value get aValue;
  HasInt get aHasInt;
  TestEnum get aTestEnum;

  CompoundValue._();
  factory CompoundValue([updates(CompoundValueBuilder b)]) = _$CompoundValue;
}
