// GENERATED CODE - DO NOT MODIFY BY HAND
// 2016-05-05T12:12:11.877877Z

part of has_int;

// **************************************************************************
// Generator: BuiltJsonGenerator
// Target: library has_int
// **************************************************************************

Serializer<ValueWithInt> _$valueWithIntSerializer =
    new _$ValueWithIntSerializer();
Serializer<EnumWithInt> _$enumWithIntSerializer = new _$EnumWithIntSerializer();

class _$ValueWithIntSerializer implements StructuredSerializer<ValueWithInt> {
  final Iterable<Type> types =
      new BuiltList<Type>([ValueWithInt, _$ValueWithInt]);
  final String wireName = 'ValueWithInt';

  @override
  Iterable serialize(Serializers serializers, ValueWithInt object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
      'note',
      serializers.serialize(object.note, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ValueWithInt deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ValueWithIntBuilder();

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
          case 'anInt':
            result.anInt = serializers.deserialize(value,
                specifiedType: const FullType(int));
            break;
          case 'note':
            result.note = serializers.deserialize(value,
                specifiedType: const FullType(String));
            break;
        }
      }
    }

    return result.build();
  }
}

class _$EnumWithIntSerializer implements PrimitiveSerializer<EnumWithInt> {
  final Iterable<Type> types = new BuiltList<Type>([EnumWithInt]);
  final String wireName = 'EnumWithInt';

  @override
  Object serialize(Serializers serializers, EnumWithInt object,
      {FullType specifiedType: FullType.unspecified}) {
    return object.name;
  }

  @override
  EnumWithInt deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: FullType.unspecified}) {
    return EnumWithInt.valueOf(serialized);
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ValueWithInt
// **************************************************************************

class _$ValueWithInt extends ValueWithInt {
  final int anInt;
  final String note;
  _$ValueWithInt._({this.anInt, this.note}) : super._() {
    if (anInt == null) throw new ArgumentError('null anInt');
    if (note == null) throw new ArgumentError('null note');
  }
  factory _$ValueWithInt([updates(ValueWithIntBuilder b)]) =>
      (new ValueWithIntBuilder()..update(updates)).build();
  ValueWithInt rebuild(updates(ValueWithIntBuilder b)) =>
      (toBuilder()..update(updates)).build();
  _$ValueWithIntBuilder toBuilder() =>
      new _$ValueWithIntBuilder()..replace(this);
  bool operator ==(other) {
    if (other is! ValueWithInt) return false;
    return anInt == other.anInt && note == other.note;
  }

  int get hashCode {
    return hashObjects([anInt, note]);
  }

  String toString() {
    return 'ValueWithInt {'
        'anInt=${anInt.toString()}\n'
        'note=${note.toString()}\n'
        '}';
  }
}

class _$ValueWithIntBuilder extends ValueWithIntBuilder {
  _$ValueWithIntBuilder() : super._();
  void replace(ValueWithInt other) {
    super.anInt = other.anInt;
    super.note = other.note;
  }

  void update(updates(ValueWithIntBuilder b)) {
    if (updates != null) updates(this);
  }

  ValueWithInt build() {
    if (anInt == null) throw new ArgumentError('null anInt');
    if (note == null) throw new ArgumentError('null note');
    return new _$ValueWithInt._(anInt: anInt, note: note);
  }
}

// **************************************************************************
// Generator: EnumClassGenerator
// Target: class EnumWithInt
// **************************************************************************

const EnumWithInt _$one = const EnumWithInt._('one');
const EnumWithInt _$two = const EnumWithInt._('two');
const EnumWithInt _$three = const EnumWithInt._('three');

EnumWithInt _$valueOf(String name) {
  switch (name) {
    case 'one':
      return _$one;
    case 'two':
      return _$two;
    case 'three':
      return _$three;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<EnumWithInt> _$values =
    new BuiltSet<EnumWithInt>(const [_$one, _$two, _$three,]);
