// Copyright (c) 2016, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library collections;

import 'package:built_collection/built_collection.dart';
import 'package:built_json/built_json.dart';
import 'package:built_value/built_value.dart';

part 'collections.g.dart';

/// Example built_value type containing collections.
abstract class Collections
    implements Built<Collections, CollectionsBuilder> {
  /// Example of how to make a built_value type serializable.
  ///
  /// Declare a static final [Serializers] field called `serializer`.
  /// The built_json code generator will provide the implementation. You need to
  /// do this for every type you want to serialize.
  static final Serializer<Collections> serializer = _$collectionsSerializer;

  BuiltList<String> get list;
  BuiltSet<int> get set;
  BuiltMap<String, int> get map;

  Collections._();
  factory Collections([updates(CollectionsBuilder b)]) = _$Collections;
}

/// Builder class for [Collections].
abstract class CollectionsBuilder
    implements Builder<Collections, CollectionsBuilder> {
  ListBuilder<String> list = new ListBuilder<String>();
  SetBuilder<int> set = new SetBuilder<int>();
  MapBuilder<String, int> map = new MapBuilder<String, int>();

  CollectionsBuilder._();
  factory CollectionsBuilder() = _$CollectionsBuilder;
}
