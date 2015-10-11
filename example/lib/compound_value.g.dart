// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-11-08T12:38:01.349Z

part of compound_value;

// **************************************************************************
// Generator: BuiltJsonGenerator
// Target: library compound_value
// **************************************************************************

BuiltJsonSerializers _$builtJsonSerializers = new BuiltJsonSerializers()
  ..add(new _$CompoundValueSerializer())
  ..add(Value.serializer)
  ..add(TestEnum.serializer);
BuiltJsonSerializer<CompoundValue> _$compoundValueSerializer =
    new _$CompoundValueSerializer();

class _$CompoundValueSerializer implements BuiltJsonSerializer<CompoundValue> {
  final Type type = _$CompoundValue;
  final String typeName = 'CompoundValue';
  Object serialize(
      BuiltJsonSerializers builtJsonSerializers, CompoundValue object,
      {String expectedType}) {
    return {
      'aValue':
          builtJsonSerializers.serialize(object.aValue, expectedType: 'Value'),
      'aTestEnum': builtJsonSerializers.serialize(object.aTestEnum,
          expectedType: 'TestEnum'),
    };
  }

  CompoundValue deserialize(
      BuiltJsonSerializers builtJsonSerializers, Object object,
      {String expectedType}) {
    return new CompoundValue((b) => b
      ..aValue.replace(builtJsonSerializers.deserialize(object['aValue'],
          expectedType: 'Value'))
      ..aTestEnum = builtJsonSerializers.deserialize(object['aTestEnum'],
          expectedType: 'TestEnum'));
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class CompoundValue
// **************************************************************************

class _$CompoundValue extends CompoundValue {
  final Value aValue;
  final TestEnum aTestEnum;
  _$CompoundValue._({this.aValue, this.aTestEnum}) : super._() {
    if (aValue == null) throw new ArgumentError('null aValue');
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
    return aValue == other.aValue && aTestEnum == other.aTestEnum;
  }

  int get hashCode {
    return hashObjects([aValue, aTestEnum]);
  }

  String toString() {
    return 'CompoundValue {'
        'aValue=${aValue.toString()}\n'
        'aTestEnum=${aTestEnum.toString()}\n'
        '}';
  }
}

class _$CompoundValueBuilder extends CompoundValueBuilder {
  _$CompoundValueBuilder() : super._();
  ValueBuilder get aValue => super.aValue;
  void set aValue(ValueBuilder aValue) {
    if (aValue == null) throw new ArgumentError('null aValue');
    super.aValue = aValue;
  }

  TestEnum get aTestEnum => super.aTestEnum;
  void set aTestEnum(TestEnum aTestEnum) {
    if (aTestEnum == null) throw new ArgumentError('null aTestEnum');
    super.aTestEnum = aTestEnum;
  }

  void replace(CompoundValue other) {
    super.aValue = other.aValue?.toBuilder();
    super.aTestEnum = other.aTestEnum;
  }

  void update(updates(CompoundValueBuilder b)) {
    if (updates != null) updates(this);
  }

  CompoundValue build() =>
      new _$CompoundValue._(aValue: aValue?.build(), aTestEnum: aTestEnum);
}
