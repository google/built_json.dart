// GENERATED CODE - DO NOT MODIFY BY HAND
// 2016-05-05T12:13:14.578893Z

part of compound_value;

// **************************************************************************
// Generator: BuiltJsonGenerator
// Target: library compound_value
// **************************************************************************

Serializer<CompoundValue> _$compoundValueSerializer =
    new _$CompoundValueSerializer();

class _$CompoundValueSerializer implements StructuredSerializer<CompoundValue> {
  final Iterable<Type> types =
      new BuiltList<Type>([CompoundValue, _$CompoundValue]);
  final String wireName = 'CompoundValue';

  @override
  Iterable serialize(Serializers serializers, CompoundValue object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
      'aValue',
      serializers.serialize(object.aValue,
          specifiedType: const FullType(Value)),
      'aHasInt',
      serializers.serialize(object.aHasInt,
          specifiedType: const FullType(HasInt)),
      'aTestEnum',
      serializers.serialize(object.aTestEnum,
          specifiedType: const FullType(TestEnum)),
    ];

    return result;
  }

  @override
  CompoundValue deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new CompoundValueBuilder();

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
          case 'aValue':
            result.aValue.replace(serializers.deserialize(value,
                specifiedType: const FullType(Value)));
            break;
          case 'aHasInt':
            result.aHasInt = serializers.deserialize(value,
                specifiedType: const FullType(HasInt));
            break;
          case 'aTestEnum':
            result.aTestEnum = serializers.deserialize(value,
                specifiedType: const FullType(TestEnum));
            break;
        }
      }
    }

    return result.build();
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class CompoundValue
// **************************************************************************

class _$CompoundValue extends CompoundValue {
  final Value aValue;
  final HasInt aHasInt;
  final TestEnum aTestEnum;
  _$CompoundValue._({this.aValue, this.aHasInt, this.aTestEnum}) : super._() {
    if (aValue == null) throw new ArgumentError('null aValue');
    if (aHasInt == null) throw new ArgumentError('null aHasInt');
    if (aTestEnum == null) throw new ArgumentError('null aTestEnum');
  }
  factory _$CompoundValue([updates(CompoundValueBuilder b)]) =>
      (new CompoundValueBuilder()..update(updates)).build();
  CompoundValue rebuild(updates(CompoundValueBuilder b)) =>
      (toBuilder()..update(updates)).build();
  _$CompoundValueBuilder toBuilder() =>
      new _$CompoundValueBuilder()..replace(this);
  bool operator ==(other) {
    if (other is! CompoundValue) return false;
    return aValue == other.aValue &&
        aHasInt == other.aHasInt &&
        aTestEnum == other.aTestEnum;
  }

  int get hashCode {
    return hashObjects([aValue, aHasInt, aTestEnum]);
  }

  String toString() {
    return 'CompoundValue {'
        'aValue=${aValue.toString()}\n'
        'aHasInt=${aHasInt.toString()}\n'
        'aTestEnum=${aTestEnum.toString()}\n'
        '}';
  }
}

class _$CompoundValueBuilder extends CompoundValueBuilder {
  _$CompoundValueBuilder() : super._();
  void replace(CompoundValue other) {
    super.aValue = other.aValue?.toBuilder();
    super.aHasInt = other.aHasInt;
    super.aTestEnum = other.aTestEnum;
  }

  void update(updates(CompoundValueBuilder b)) {
    if (updates != null) updates(this);
  }

  CompoundValue build() {
    if (aValue == null) throw new ArgumentError('null aValue');
    if (aHasInt == null) throw new ArgumentError('null aHasInt');
    if (aTestEnum == null) throw new ArgumentError('null aTestEnum');
    return new _$CompoundValue._(
        aValue: aValue?.build(), aHasInt: aHasInt, aTestEnum: aTestEnum);
  }
}
