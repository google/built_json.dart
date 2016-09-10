// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// Generator: BuiltJsonGenerator
// Target: library serializers
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(Chat.serializer)
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(String)]),
          () => new SetBuilder<String>())
      ..add(Login.serializer)
      ..add(Status.serializer)
      ..add(StatusType.serializer)
      ..add(ListUsers.serializer)
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(StatusType)]),
          () => new SetBuilder<StatusType>())
      ..add(LoginResponse.serializer)
      ..add(ShowChat.serializer)
      ..add(ListUsersResponse.serializer)
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(Status)]),
          () => new MapBuilder<String, Status>()))
    .build();
