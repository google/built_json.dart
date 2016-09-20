// GENERATED CODE - DO NOT MODIFY BY HAND

part of collections;

// **************************************************************************
// Generator: BuiltJsonGenerator
// Target: library collections
// **************************************************************************

Serializer<Collections> _$collectionsSerializer = new _$CollectionsSerializer();

class _$CollectionsSerializer implements StructuredSerializer<Collections> {
  final Iterable<Type> types =
      new BuiltList<Type>([Collections, _$Collections]);
  final String wireName = 'Collections';

  @override
  Iterable serialize(Serializers serializers, Collections object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
      'list',
      serializers.serialize(object.list,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'set',
      serializers.serialize(object.set,
          specifiedType: const FullType(BuiltSet, const [const FullType(int)])),
      'map',
      serializers.serialize(object.map,
          specifiedType: const FullType(
              BuiltMap, const [const FullType(String), const FullType(int)])),
    ];

    return result;
  }

  @override
  Collections deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new CollectionsBuilder();

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
          case 'list':
            result.list.replace(serializers.deserialize(value,
                specifiedType:
                    const FullType(BuiltList, const [const FullType(String)])));
            break;
          case 'set':
            result.set.replace(serializers.deserialize(value,
                specifiedType:
                    const FullType(BuiltSet, const [const FullType(int)])));
            break;
          case 'map':
            result.map.replace(serializers.deserialize(value,
                specifiedType: const FullType(BuiltMap,
                    const [const FullType(String), const FullType(int)])));
            break;
        }
      }
    }

    return result.build();
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Collections
// **************************************************************************

class _$Collections extends Collections {
  final BuiltList<String> list;
  final BuiltSet<int> set;
  final BuiltMap<String, int> map;

  _$Collections._({this.list, this.set, this.map}) : super._() {
    if (list == null) throw new ArgumentError('null list');
    if (set == null) throw new ArgumentError('null set');
    if (map == null) throw new ArgumentError('null map');
  }

  factory _$Collections([updates(CollectionsBuilder b)]) =>
      (new CollectionsBuilder()..update(updates)).build();

  Collections rebuild(updates(CollectionsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  _$CollectionsBuilder toBuilder() => new _$CollectionsBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! Collections) return false;
    return list == other.list && set == other.set && map == other.map;
  }

  int get hashCode {
    return hashObjects([list, set, map]);
  }

  String toString() {
    return 'Collections {'
        'list=${list.toString()},\n'
        'set=${set.toString()},\n'
        'map=${map.toString()},\n'
        '}';
  }
}

class _$CollectionsBuilder extends CollectionsBuilder {
  _$CollectionsBuilder() : super._();
  void replace(Collections other) {
    super.list = other.list?.toBuilder();
    super.set = other.set?.toBuilder();
    super.map = other.map?.toBuilder();
  }

  void update(updates(CollectionsBuilder b)) {
    if (updates != null) updates(this);
  }

  Collections build() {
    return new _$Collections._(
        list: list?.build(), set: set?.build(), map: map?.build());
  }
}
