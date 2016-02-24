// GENERATED CODE - DO NOT MODIFY BY HAND
// 2016-02-24T12:15:37.800Z

part of test_enum;

// **************************************************************************
// Generator: BuiltJsonGenerator
// Target: library test_enum
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
  TestEnum deserialize(Serializers serializers, Object object,
      {FullType specifiedType: FullType.unspecified}) {
    return TestEnum.valueOf(object);
  }
}

// **************************************************************************
// Generator: EnumClassGenerator
// Target: class TestEnum
// **************************************************************************

const TestEnum _$yes = const TestEnum._('yes');
const TestEnum _$no = const TestEnum._('no');
const TestEnum _$maybe = const TestEnum._('maybe');

TestEnum _$valueOf(String name) {
  switch (name) {
    case 'yes':
      return _$yes;
    case 'no':
      return _$no;
    case 'maybe':
      return _$maybe;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<TestEnum> _$values =
    new BuiltSet<TestEnum>(const [_$yes, _$no, _$maybe,]);
