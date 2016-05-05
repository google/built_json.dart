// GENERATED CODE - DO NOT MODIFY BY HAND
// 2016-05-05T07:17:56.196051Z

part of built_json_generator.source_field;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class SourceField
// **************************************************************************

class _$SourceField extends SourceField {
  final bool isSerializable;
  final bool isNullable;
  final String name;
  final String type;
  final bool builderFieldUsesNestedBuilder;
  _$SourceField._(
      {this.isSerializable,
      this.isNullable,
      this.name,
      this.type,
      this.builderFieldUsesNestedBuilder})
      : super._() {
    if (isSerializable == null) throw new ArgumentError('null isSerializable');
    if (isNullable == null) throw new ArgumentError('null isNullable');
    if (name == null) throw new ArgumentError('null name');
    if (type == null) throw new ArgumentError('null type');
    if (builderFieldUsesNestedBuilder == null)
      throw new ArgumentError('null builderFieldUsesNestedBuilder');
  }
  factory _$SourceField([updates(SourceFieldBuilder b)]) =>
      (new SourceFieldBuilder()..update(updates)).build();
  SourceField rebuild(updates(SourceFieldBuilder b)) =>
      (toBuilder()..update(updates)).build();
  _$SourceFieldBuilder toBuilder() => new _$SourceFieldBuilder()..replace(this);
  bool operator ==(other) {
    if (other is! SourceField) return false;
    return isSerializable == other.isSerializable &&
        isNullable == other.isNullable &&
        name == other.name &&
        type == other.type &&
        builderFieldUsesNestedBuilder == other.builderFieldUsesNestedBuilder;
  }

  int get hashCode {
    return hashObjects([
      isSerializable,
      isNullable,
      name,
      type,
      builderFieldUsesNestedBuilder
    ]);
  }

  String toString() {
    return 'SourceField {'
        'isSerializable=${isSerializable.toString()}\n'
        'isNullable=${isNullable.toString()}\n'
        'name=${name.toString()}\n'
        'type=${type.toString()}\n'
        'builderFieldUsesNestedBuilder=${builderFieldUsesNestedBuilder.toString()}\n'
        '}';
  }
}

class _$SourceFieldBuilder extends SourceFieldBuilder {
  _$SourceFieldBuilder() : super._();
  void replace(SourceField other) {
    super.isSerializable = other.isSerializable;
    super.isNullable = other.isNullable;
    super.name = other.name;
    super.type = other.type;
    super.builderFieldUsesNestedBuilder = other.builderFieldUsesNestedBuilder;
  }

  void update(updates(SourceFieldBuilder b)) {
    if (updates != null) updates(this);
  }

  SourceField build() {
    if (isSerializable == null) throw new ArgumentError('null isSerializable');
    if (isNullable == null) throw new ArgumentError('null isNullable');
    if (name == null) throw new ArgumentError('null name');
    if (type == null) throw new ArgumentError('null type');
    if (builderFieldUsesNestedBuilder == null)
      throw new ArgumentError('null builderFieldUsesNestedBuilder');
    return new _$SourceField._(
        isSerializable: isSerializable,
        isNullable: isNullable,
        name: name,
        type: type,
        builderFieldUsesNestedBuilder: builderFieldUsesNestedBuilder);
  }
}
