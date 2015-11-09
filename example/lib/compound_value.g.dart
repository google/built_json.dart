// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-12-08T16:15:17.813Z

part of compound_value;

// **************************************************************************
// Generator: BuiltJsonGenerator
// Target: library compound_value
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
  ..add(TestEnum.serializer)
  ..add(CompoundValue.serializer)
  ..add(Value.serializer)).build();
Serializer<CompoundValue> _$compoundValueSerializer =
    new _$CompoundValueSerializer();

class _$CompoundValueSerializer implements Serializer<CompoundValue> {
  final bool structured = true;
  final Iterable<Type> types =
      new BuiltList<Type>([CompoundValue, _$CompoundValue]);
  final String wireName = 'CompoundValue';

  @override
  Object serialize(Serializers serializers, CompoundValue object,
      {GenericType genericType: const GenericType()}) {
    return [
      'aValue',
      serializers.serialize(object.aValue,
          genericType: const GenericType(Value)),
      'aTestEnum',
      serializers.serialize(object.aTestEnum,
          genericType: const GenericType(TestEnum)),
    ];
  }

  @override
  CompoundValue deserialize(Serializers serializers, Object object,
      {GenericType genericType: const GenericType()}) {
    final result = new CompoundValueBuilder();

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
          case 'aValue':
            result.aValue.replace(serializers.deserialize(value,
                genericType: const GenericType(Value)));
            break;
          case 'aTestEnum':
            result.aTestEnum = serializers.deserialize(value,
                genericType: const GenericType(TestEnum));
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
