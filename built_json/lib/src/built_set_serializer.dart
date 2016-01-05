// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_json/built_json.dart';

class BuiltSetSerializer implements Serializer<BuiltSet> {
  final bool structured = true;
  final Iterable<Type> types = new BuiltList<Type>([BuiltSet]);
  final String wireName = 'set';

  @override
  Object serialize(Serializers serializers, BuiltSet object,
      {GenericType genericType: const GenericType()}) {
    final valueGenericType = genericType.parameters.isEmpty
        ? const GenericType()
        : genericType.parameters[0];

    return object.map(
        (item) => serializers.serialize(item, genericType: valueGenericType));
  }

  @override
  BuiltSet deserialize(Serializers serializers, Object object,
      {GenericType genericType: const GenericType()}) {
    final valueGenericType = genericType.parameters.isEmpty
        ? const GenericType()
        : genericType.parameters[0];

    final result = serializers.newBuilder(genericType) as SetBuilder ??
        new SetBuilder<Object>();
    result.addAll((object as Iterable).map((item) =>
        serializers.deserialize(item, genericType: valueGenericType)));
    return result.build();
  }
}
