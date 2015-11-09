// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-12-08T16:15:17.773Z

part of value;

// **************************************************************************
// Generator: BuiltJsonGenerator
// Target: library value
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
  ..add(TestEnum.serializer)
  ..add(CompoundValue.serializer)
  ..add(Value.serializer)).build();
Serializer<Value> _$valueSerializer = new _$ValueSerializer();

class _$ValueSerializer implements Serializer<Value> {
  final bool structured = true;
  final Iterable<Type> types = new BuiltList<Type>([Value, _$Value]);
  final String wireName = 'Value';

  @override
  Object serialize(Serializers serializers, Value object,
      {GenericType genericType: const GenericType()}) {
    return [
      'anInt',
      serializers.serialize(object.anInt, genericType: const GenericType(int)),
      'aString',
      serializers.serialize(object.aString,
          genericType: const GenericType(String)),
      'anObject',
      serializers.serialize(object.anObject,
          genericType: const GenericType(Object)),
      'aDefaultInt',
      serializers.serialize(object.aDefaultInt,
          genericType: const GenericType(int)),
      'listOfInt',
      serializers.serialize(object.listOfInt,
          genericType:
              const GenericType(BuiltList, const [const GenericType(int)])),
    ];
  }

  @override
  Value deserialize(Serializers serializers, Object object,
      {GenericType genericType: const GenericType()}) {
    final result = new ValueBuilder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in object as List) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          case 'anInt':
            result.anInt = serializers.deserialize(value,
                genericType: const GenericType(int));
            break;
          case 'aString':
            result.aString = serializers.deserialize(value,
                genericType: const GenericType(String));
            break;
          case 'anObject':
            result.anObject = serializers.deserialize(value,
                genericType: const GenericType(Object));
            break;
          case 'aDefaultInt':
            result.aDefaultInt = serializers.deserialize(value,
                genericType: const GenericType(int));
            break;
          case 'listOfInt':
            result.listOfInt.replace(serializers.deserialize(value,
                genericType: const GenericType(
                    BuiltList, const [const GenericType(int)])));
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
  final Object anObject;
  final int aDefaultInt;
  final BuiltList<int> listOfInt;
  _$Value._(
      {this.anInt,
      this.aString,
      this.anObject,
      this.aDefaultInt,
      this.listOfInt})
      : super._() {
    if (anInt == null) throw new ArgumentError('null anInt');
    if (aString == null) throw new ArgumentError('null aString');
    if (aDefaultInt == null) throw new ArgumentError('null aDefaultInt');
    if (listOfInt == null) throw new ArgumentError('null listOfInt');
  }
  factory _$Value([updates(ValueBuilder b)]) =>
      (new ValueBuilder()..update(updates)).build();
  Value rebuild(updates(ValueBuilder b)) =>
      (toBuilder()..update(updates)).build();
  _$ValueBuilder toBuilder() => new _$ValueBuilder()..replace(this);
  bool operator ==(other) {
    if (other is! Value) return false;
    return anInt == other.anInt &&
        aString == other.aString &&
        anObject == other.anObject &&
        aDefaultInt == other.aDefaultInt &&
        listOfInt == other.listOfInt;
  }

  int get hashCode {
    return hashObjects([anInt, aString, anObject, aDefaultInt, listOfInt]);
  }

  String toString() {
    return 'Value {'
        'anInt=${anInt.toString()}\n'
        'aString=${aString.toString()}\n'
        'anObject=${anObject.toString()}\n'
        'aDefaultInt=${aDefaultInt.toString()}\n'
        'listOfInt=${listOfInt.toString()}\n'
        '}';
  }
}

class _$ValueBuilder extends ValueBuilder {
  _$ValueBuilder() : super._();
  int get anInt => super.anInt;
  void set anInt(int anInt) {
    if (anInt == null) throw new ArgumentError('null anInt');
    super.anInt = anInt;
  }

  String get aString => super.aString;
  void set aString(String aString) {
    if (aString == null) throw new ArgumentError('null aString');
    super.aString = aString;
  }

  Object get anObject => super.anObject;
  void set anObject(Object anObject) {
    super.anObject = anObject;
  }

  int get aDefaultInt => super.aDefaultInt;
  void set aDefaultInt(int aDefaultInt) {
    if (aDefaultInt == null) throw new ArgumentError('null aDefaultInt');
    super.aDefaultInt = aDefaultInt;
  }

  ListBuilder<int> get listOfInt => super.listOfInt;
  void set listOfInt(ListBuilder<int> listOfInt) {
    if (listOfInt == null) throw new ArgumentError('null listOfInt');
    super.listOfInt = listOfInt;
  }

  void replace(Value other) {
    super.anInt = other.anInt;
    super.aString = other.aString;
    super.anObject = other.anObject;
    super.aDefaultInt = other.aDefaultInt;
    super.listOfInt = other.listOfInt?.toBuilder();
  }

  void update(updates(ValueBuilder b)) {
    if (updates != null) updates(this);
  }

  Value build() => new _$Value._(
      anInt: anInt,
      aString: aString,
      anObject: anObject,
      aDefaultInt: aDefaultInt,
      listOfInt: listOfInt?.build());
}
