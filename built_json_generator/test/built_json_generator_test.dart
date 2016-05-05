// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:built_json_generator/built_json_generator.dart';
import 'package:source_gen/source_gen.dart' as source_gen;
import 'package:test/test.dart';

void main() {
  group('generator', () {
    test('ignores empty library', () async {
      expect(await generate('library value;'), isEmpty);
    });

    test('ignores normal class', () async {
      expect(await generate(r'''
library value;

class EmptyClass {}
'''), isEmpty);
    });

    test('ignores built_value class without serializer', () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

abstract class Value implements Built<Value, ValueBuilder> {}
'''), isEmpty);
    });

    test('generates for built_value class with serializer', () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

abstract class Value implements Built<Value, ValueBuilder> {
  static final Serializer<Value> serializer = _$serializer;
}
'''), isNotEmpty);
    });

    test('ignores EnumClass without serializer', () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

class Enum extends EnumClass {}
'''), isEmpty);
    });

    test('generates for EnumClass with serializer', () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

class Enum extends EnumClass {
  static final Serializer<Enum> serializer = _$serializer;
}
'''), isNotEmpty);
    });

    test('generates for serializers', () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

final Serializers serializers = _$serializers;
'''), isNotEmpty);
    });

    test('generates correct serializer for built_value with primitives',
        () async {
      expect(
          await generate(r'''
library value;

import 'package:test_support/test_support.dart';

abstract class Value implements Built<Value, ValueBuilder> {
  static final Serializer<Value> serializer = _$serializer;
  bool get aBool;
  double get aDouble;
  int get anInt;
  String get aString;
}

abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  bool aBool;
  double aDouble;
  int anInt;
  String aString;
}
'''),
          r'''// GENERATED CODE - DO NOT MODIFY BY HAND

part of value;

// **************************************************************************
// Generator: BuiltJsonGenerator
// Target: library value
// **************************************************************************

Serializer<Value> _$valueSerializer = new _$ValueSerializer();

class _$ValueSerializer implements StructuredSerializer<Value> {
  final Iterable<Type> types = new BuiltList<Type>([Value, _$Value]);
  final String wireName = 'Value';

  @override
  Iterable serialize(Serializers serializers, Value object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
      'aBool',
      serializers.serialize(object.aBool, specifiedType: const FullType(bool)),
      'aDouble',
      serializers.serialize(object.aDouble,
          specifiedType: const FullType(double)),
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
      'aString',
      serializers.serialize(object.aString,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Value deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ValueBuilder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in serialized) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          case 'aBool':
            result.aBool = serializers.deserialize(value,
                specifiedType: const FullType(bool));
            break;
          case 'aDouble':
            result.aDouble = serializers.deserialize(value,
                specifiedType: const FullType(double));
            break;
          case 'anInt':
            result.anInt = serializers.deserialize(value,
                specifiedType: const FullType(int));
            break;
          case 'aString':
            result.aString = serializers.deserialize(value,
                specifiedType: const FullType(String));
            break;
        }
      }
    }

    return result.build();
  }
}
''');
    });

    test('generates correct serializer for built_value with nullables',
        () async {
      expect(
          await generate(r'''
library value;

import 'package:test_support/test_support.dart';

abstract class Value implements Built<Value, ValueBuilder> {
  static final Serializer<Value> serializer = _$serializer;
  bool get aBool;
  @nullable double get aDouble;
}

abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  bool aBool;
  @nullable double aDouble;
}
'''),
          r'''// GENERATED CODE - DO NOT MODIFY BY HAND

part of value;

// **************************************************************************
// Generator: BuiltJsonGenerator
// Target: library value
// **************************************************************************

Serializer<Value> _$valueSerializer = new _$ValueSerializer();

class _$ValueSerializer implements StructuredSerializer<Value> {
  final Iterable<Type> types = new BuiltList<Type>([Value, _$Value]);
  final String wireName = 'Value';

  @override
  Iterable serialize(Serializers serializers, Value object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
      'aBool',
      serializers.serialize(object.aBool, specifiedType: const FullType(bool)),
    ];
    if (object.aDouble != null) {
      result.add('aDouble');
      result.add(serializers.serialize(object.aDouble,
          specifiedType: const FullType(double)));
    }

    return result;
  }

  @override
  Value deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ValueBuilder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in serialized) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          case 'aBool':
            result.aBool = serializers.deserialize(value,
                specifiedType: const FullType(bool));
            break;
          case 'aDouble':
            result.aDouble = serializers.deserialize(value,
                specifiedType: const FullType(double));
            break;
        }
      }
    }

    return result.build();
  }
}
''');
    });

    test('generates correct serializer for built_value with collections',
        () async {
      expect(
          await generate(r'''
library value;

import 'package:test_support/test_support.dart';

abstract class Value implements Built<Value, ValueBuilder> {
  static final Serializer<Value> serializer = _$serializer;
  BuiltList<String> get aList;
  BuiltMap<String, int> get aMap;
}

abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ListBuilder<String> aList;
  MapBuilder<String, int> aMap;
}
'''),
          r'''
// GENERATED CODE - DO NOT MODIFY BY HAND

part of value;

// **************************************************************************
// Generator: BuiltJsonGenerator
// Target: library value
// **************************************************************************

Serializer<Value> _$valueSerializer = new _$ValueSerializer();

class _$ValueSerializer implements StructuredSerializer<Value> {
  final Iterable<Type> types = new BuiltList<Type>([Value, _$Value]);
  final String wireName = 'Value';

  @override
  Iterable serialize(Serializers serializers, Value object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
      'aList',
      serializers.serialize(object.aList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'aMap',
      serializers.serialize(object.aMap,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(int)])),
    ];

    return result;
  }

  @override
  Value deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ValueBuilder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in serialized) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          case 'aList':
            result.aList.replace(serializers.deserialize(value,
                specifiedType:
                    const FullType(BuiltList, const [const FullType(String)])));
            break;
          case 'aMap':
            result.aMap.replace(serializers.deserialize(value,
                specifiedType: const FullType(BuiltMap,
                    const [const FullType(String), const FullType(int)])));
            break;
        }
      }
    }

    return result.build();
  }
}
''');
    });

    test('generates correct serializer for nested built_value', () async {
      expect(
          await generate(r'''
library value;

import 'package:test_support/test_support.dart';

abstract class Value implements Built<Value, ValueBuilder> {
  static final Serializer<Value> serializer = _$serializer;
  Value get value;
}

abstract class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder value;
}
'''),
          r'''
// GENERATED CODE - DO NOT MODIFY BY HAND

part of value;

// **************************************************************************
// Generator: BuiltJsonGenerator
// Target: library value
// **************************************************************************

Serializer<Value> _$valueSerializer = new _$ValueSerializer();

class _$ValueSerializer implements StructuredSerializer<Value> {
  final Iterable<Type> types = new BuiltList<Type>([Value, _$Value]);
  final String wireName = 'Value';

  @override
  Iterable serialize(Serializers serializers, Value object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(Value)),
    ];

    return result;
  }

  @override
  Value deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ValueBuilder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in serialized) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          case 'value':
            result.value.replace(serializers.deserialize(value,
                specifiedType: const FullType(Value)));
            break;
        }
      }
    }

    return result.build();
  }
}
''');
    });

    test('generates correct serializer for EnumClass', () async {
      expect(await generate(r'''
library value;

import 'package:test_support/test_support.dart';

abstract class TestEnum extends EnumClass {
  static final Serializer<TestEnum> serializer = _$serializer;

  static const TestEnum yes = _$yes;
  static const TestEnum no = _$no;
  static const TestEnum maybe = _$maybe;
}
'''), r'''
// GENERATED CODE - DO NOT MODIFY BY HAND

part of value;

// **************************************************************************
// Generator: BuiltJsonGenerator
// Target: library value
// **************************************************************************

Serializer<TestEnum> _$testEnumSerializer = new _$TestEnumSerializer();

class _$TestEnumSerializer implements PrimitiveSerializer<TestEnum> {
  final Iterable<Type> types = new BuiltList<Type>([TestEnum]);
  final String wireName = 'TestEnum';

  @override
  Object serialize(Serializers serializers, TestEnum object,
      {FullType specifiedType: FullType.unspecified}) {
    return object.name;
  }

  @override
  TestEnum deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: FullType.unspecified}) {
    return TestEnum.valueOf(serialized);
  }
}
''');
    });
  });
}

// Test setup.

Future<String> generate(String source) async {
  final tempDir =
      Directory.systemTemp.createTempSync('built_json_generator.dart.');
  final packageDir = new Directory(tempDir.path + '/packages')..createSync();
  final builtJsonDir = new Directory(packageDir.path + '/test_support')
    ..createSync();
  final builtJsonFile = new File(builtJsonDir.path + '/test_support.dart')
    ..createSync();
  builtJsonFile.writeAsStringSync(testSupportSource);

  final libDir = new Directory(tempDir.path + '/lib')..createSync();
  final sourceFile = new File(libDir.path + '/value.dart');
  sourceFile.writeAsStringSync(source);

  await source_gen.generate(tempDir.path, [new BuiltJsonGenerator()],
      librarySearchPaths: <String>['lib'], omitGenerateTimestamp: true);
  final outputFile = new File(libDir.path + '/value.g.dart');
  return outputFile.existsSync() ? outputFile.readAsStringSync() : '';
}

// Classes mentioned in the test input need to exist, but we don't need the
// real versions. So just use minimal ones.
const String testSupportSource = r'''
const String nullable = 'nullable';

class Built<V, B> {}

class BuiltList<E> {}

class BuiltMap<K, V> {}

class EnumClass {}

class Serializer<T> {}

class Serializers {}
''';
