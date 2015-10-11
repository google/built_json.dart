// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-11-08T11:58:53.606Z

part of test_enum;

// **************************************************************************
// Generator: BuiltJsonGenerator
// Target: library test_enum
// **************************************************************************

BuiltJsonSerializers _$builtJsonSerializers = new BuiltJsonSerializers()
  ..add(new _$TestEnumSerializer());
BuiltJsonSerializer<TestEnum> _$testEnumSerializer = new _$TestEnumSerializer();

class _$TestEnumSerializer implements BuiltJsonSerializer<TestEnum> {
  final Type type = TestEnum;
  final String typeName = 'TestEnum';
  Object serialize(BuiltJsonSerializers builtJsonSerializers, TestEnum object,
      {String expectedType}) {
    return object.name;
  }

  TestEnum deserialize(BuiltJsonSerializers builtJsonSerializers, Object object,
      {String expectedType}) {
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
