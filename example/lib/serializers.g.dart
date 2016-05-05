// GENERATED CODE - DO NOT MODIFY BY HAND
// 2016-05-05T12:11:34.525489Z

part of serializers;

// **************************************************************************
// Generator: BuiltJsonGenerator
// Target: library serializers
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(TestEnum.serializer)
      ..add(ValueWithInt.serializer)
      ..add(EnumWithInt.serializer)
      ..add(Value.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..add(CompoundValue.serializer))
    .build();
