// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library test_enum;

import 'package:built_json/built_json.dart';
import 'package:enum_class/enum_class.dart';
import 'package:example/compound_value.dart';
import 'package:example/value.dart';

part 'test_enum.g.dart';

/// Example [EnumClass].
class TestEnum extends EnumClass {
  /// Example of how to make an [EnumClass] serializable.
  ///
  /// Declare a static final [Serializers] field called `serializer`.
  /// The built_json code generator will provide the implementation. You need to
  /// do this for every type you want to serialize.
  static final Serializer<TestEnum> serializer = _$testEnumSerializer;

  static const TestEnum yes = _$yes;
  static const TestEnum no = _$no;
  static const TestEnum maybe = _$maybe;

  const TestEnum._(String name) : super(name);

  static BuiltSet<TestEnum> get values => _$values;
  static TestEnum valueOf(String name) => _$valueOf(name);
}
