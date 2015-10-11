// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_json;

import 'src/bool_serializer.dart';
import 'src/built_list_serializer.dart';
import 'src/built_map_serializer.dart';
import 'src/built_set_serializer.dart';
import 'src/double_serializer.dart';
import 'src/int_serializer.dart';
import 'src/string_serializer.dart';

/// Serializes a single class.
///
/// See <https://github.com/google/built_json.dart/tree/master/example>
abstract class BuiltJsonSerializer<T> {
  Type get type;
  String get typeName;

  Object serialize(BuiltJsonSerializers builtJsonSerializers, T object,
      {String expectedType});
  T deserialize(BuiltJsonSerializers builtJsonSerializers, Object object,
      {String expectedType});
}

/// Serializes all transitive dependencies of a class.
///
/// See <https://github.com/google/built_json.dart/tree/master/example>
// TODO(davidmorgan): make immutable.
class BuiltJsonSerializers {
  Map<String, String> _deobfuscatedNames = <String, String>{};
  Map<String, BuiltJsonSerializer> _serializersByName =
      <String, BuiltJsonSerializer>{};

  BuiltJsonSerializers() {
    add(new BoolSerializer());
    add(new DoubleSerializer());
    add(new IntSerializer());
    add(new StringSerializer());

    add(new BuiltListSerializer());
    add(new BuiltMapSerializer());
    add(new BuiltSetSerializer());
  }

  void addAll(BuiltJsonSerializers builtJsonSerializers) {
    for (final serializer in builtJsonSerializers._serializersByName.values) {
      add(serializer);
    }
  }

  void add(BuiltJsonSerializer builtJsonSerializer) {
    _deobfuscatedNames[_getName(builtJsonSerializer.type)] =
        builtJsonSerializer.typeName;
    _serializersByName[builtJsonSerializer.typeName] = builtJsonSerializer;
  }

  Object serialize(Object object, {String expectedType}) {
    final rawName = _deobfuscatedNames[_getName(object.runtimeType)];
    if (rawName == null) throw new StateError(
        "No serializer for '${object.runtimeType}'.");

    var genericType = _getGenericName(object.runtimeType);

    // TODO(davidmorgan): handle this generically.
    if (genericType == 'BuiltList<int>') {
      genericType = 'List<int>';
    }
    if (genericType == 'BuiltSet<int>') {
      genericType = 'Set<int>';
    }

    final genericName =
        genericType == null ? rawName : '$rawName<$genericType>';

    if (genericName == expectedType) {
      return _serializersByName[rawName]
          .serialize(this, object, expectedType: genericType);
    } else {
      return <String, Object>{
        genericName: _serializersByName[rawName]
            .serialize(this, object, expectedType: genericType)
      };
    }
  }

  Object deserialize(Object object, {String expectedType}) {
    if (object is Map) {
      if (object.keys.length > 1) {
        // Must be expectedType.
        // TODO(davidmorgan): distinguish in the one field case.
        if (expectedType == null) {
          throw new StateError('Need an expected type here.');
        }
        final typeName = _makeRaw(expectedType);
        final genericName = _getGeneric(expectedType);
        return _serializersByName[typeName]
            .deserialize(this, object, expectedType: genericName);
      } else {
        final typeName = _makeRaw(object.keys.single);
        final genericName = _getGeneric(object.keys.single);
        return _serializersByName[typeName]
            .deserialize(this, object.values.single, expectedType: genericName);
      }
    } else {
      final serializer = _serializersByName[_makeRaw(expectedType)];
      if (serializer == null) {
        throw new StateError('No serializer for $expectedType');
      }
      return serializer.deserialize(this, object,
          expectedType: _getGeneric(expectedType));
    }
  }

  String _getName(Type type) => _makeRaw(type.toString());

  String _makeRaw(String name) {
    final genericsStart = name.indexOf('<');
    return genericsStart == -1 ? name : name.substring(0, genericsStart);
  }

  String _getGenericName(Type type) => _getGeneric(type.toString());

  String _getGeneric(String name) {
    final genericsStart = name.indexOf('<');
    return genericsStart == -1
        ? null
        : name.substring(genericsStart + 1, name.length - 1);
  }
}
