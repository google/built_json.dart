// GENERATED CODE - DO NOT MODIFY BY HAND
// 2016-01-26T16:57:24.653Z

part of serializers;

// **************************************************************************
// Generator: BuiltJsonGenerator
// Target: library serializers
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(TestEnum.serializer)
      ..add(Value.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..add(CompoundValue.serializer))
    .build();
