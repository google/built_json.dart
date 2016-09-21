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
      'anInt',
      serializers.serialize(object.anInt, specifiedType: const FullType(int)),
      'aString',
      serializers.serialize(object.aString,
          specifiedType: const FullType(String)),
      'listOfInt',
      serializers.serialize(object.listOfInt,
          specifiedType:
              const FullType(BuiltList, const [const FullType(int)])),
    ];
    if (object.anotherString != null) {
      result.add('anotherString');
      result.add(serializers.serialize(object.anotherString,
          specifiedType: const FullType(String)));
    }
    if (object.anObject != null) {
      result.add('anObject');
      result.add(serializers.serialize(object.anObject,
          specifiedType: const FullType(Object)));
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
          case 'anInt':
            result.anInt = serializers.deserialize(value,
                specifiedType: const FullType(int));
            break;
          case 'aString':
            result.aString = serializers.deserialize(value,
                specifiedType: const FullType(String));
            break;
          case 'anotherString':
            result.anotherString = serializers.deserialize(value,
                specifiedType: const FullType(String));
            break;
          case 'anObject':
            result.anObject = serializers.deserialize(value,
                specifiedType: const FullType(Object));
            break;
          case 'listOfInt':
            result.listOfInt.replace(serializers.deserialize(value,
                specifiedType:
                    const FullType(BuiltList, const [const FullType(int)])));
            break;
        }
      }
    }

    return result.build();
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Value
// **************************************************************************

class _$Value extends Value {
  final int anInt;
  final String aString;
  final String anotherString;
  final Object anObject;
  final BuiltList<int> listOfInt;

  _$Value._(
      {this.anInt,
      this.aString,
      this.anotherString,
      this.anObject,
      this.listOfInt})
      : super._() {
    if (anInt == null) throw new ArgumentError('null anInt');
    if (aString == null) throw new ArgumentError('null aString');
    if (listOfInt == null) throw new ArgumentError('null listOfInt');
  }

  factory _$Value([updates(ValueBuilder b)]) =>
      (new ValueBuilder()..update(updates)).build();

  Value rebuild(updates(ValueBuilder b)) =>
      (toBuilder()..update(updates)).build();

  ValueBuilder toBuilder() => new ValueBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! Value) return false;
    return anInt == other.anInt &&
        aString == other.aString &&
        anotherString == other.anotherString &&
        anObject == other.anObject &&
        listOfInt == other.listOfInt;
  }

  int get hashCode {
    return hashObjects([anInt, aString, anotherString, anObject, listOfInt]);
  }

  String toString() {
    return 'Value {'
        'anInt=${anInt.toString()},\n'
        'aString=${aString.toString()},\n'
        'anotherString=${anotherString.toString()},\n'
        'anObject=${anObject.toString()},\n'
        'listOfInt=${listOfInt.toString()},\n'
        '}';
  }
}

class ValueBuilder implements Builder<Value, ValueBuilder> {
  ValueBuilder();
  int anInt;
  String aString;
  String anotherString;
  Object anObject;
  ListBuilder<int> listOfInt = new ListBuilder<int>();

  void replace(Value other) {
    this.anInt = other.anInt;
    this.aString = other.aString;
    this.anotherString = other.anotherString;
    this.anObject = other.anObject;
    this.listOfInt = other.listOfInt?.toBuilder();
  }

  void update(updates(ValueBuilder b)) {
    if (updates != null) updates(this);
  }

  Value build() {
    return new _$Value._(
        anInt: anInt,
        aString: aString,
        anotherString: anotherString,
        anObject: anObject,
        listOfInt: listOfInt?.build());
  }
}
