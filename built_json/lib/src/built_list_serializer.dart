// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_json/built_json.dart';

class BuiltListSerializer implements Serializer<BuiltList> {
  final bool structured = true;
  final Iterable<Type> types = new BuiltList<Type>([BuiltList]);
  final String wireName = 'list';

  @override
  Object serialize(Serializers serializers, BuiltList object,
      {GenericType genericType: const GenericType()}) {
    final valueGenericType = genericType.leaves.isEmpty
        ? const GenericType()
        : genericType.leaves[0];

    return object.map(
        (item) => serializers.serialize(item, genericType: valueGenericType));
  }

  @override
  BuiltList deserialize(Serializers serializers, Object object,
      {GenericType genericType: const GenericType()}) {
    final valueGenericType = genericType.leaves.isEmpty
        ? const GenericType()
        : genericType.leaves[0];

    final result = serializers.newBuilder(genericType) as ListBuilder ??
        new ListBuilder<Object>();
    result.addAll((object as Iterable).map((item) =>
        serializers.deserialize(item, genericType: valueGenericType)));
    return result.build();
  }
}
