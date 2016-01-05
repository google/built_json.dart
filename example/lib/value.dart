// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library value;

import 'package:built_collection/built_collection.dart';
import 'package:built_json/built_json.dart';
import 'package:built_value/built_value.dart';
import 'package:example/compound_value.dart';
import 'package:example/test_enum.dart';

part 'value.g.dart';

/// Example built_value type.
abstract class Value implements Built<Value, ValueBuilder> {
  /// Example of how to make a built_value type serializable.
  ///
  /// Declare a static final [Serializer] field called `serializer`.
  /// The built_json code generator will provide the implementation. You need to
  /// do this for every type you want to serialize.
  static final Serializer<Value> serializer = _$valueSerializer;
  static final int youCanHaveStaticFields = 3;

  int get anInt;
  String get aString;
  @nullable Object get anObject;
  int get aDefaultInt;
  BuiltList<int> get listOfInt;

  int get youCanWriteDerivedGetters => anInt + aDefaultInt;

  Value._();
  factory Value([updates(ValueBuilder b)]) = _$Value;
}

/// Builder class for [Value].
abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  int anInt;
  String aString;
  @nullable Object anObject;
  int aDefaultInt = 7;
  ListBuilder<int> listOfInt = new ListBuilder<int>();

  ValueBuilder._();
  factory ValueBuilder() = _$ValueBuilder;

  set youCanWriteExtraSetters(int value) {
    anInt = value;
    aDefaultInt = value;
  }
}

