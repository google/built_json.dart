// GENERATED CODE - DO NOT MODIFY BY HAND
// 2016-05-05T07:18:44.745421Z

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
