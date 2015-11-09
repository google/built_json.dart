// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-12-04T12:55:13.981Z

part of built_json_generator.source_field;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class SourceField
// **************************************************************************

class _$SourceField extends SourceField {
  final bool isSerializable;
  final String name;
  final String type;
  final bool builderFieldUsesNestedBuilder;
  _$SourceField._(
      {this.isSerializable,
      this.name,
      this.type,
      this.builderFieldUsesNestedBuilder})
      : super._() {
    if (isSerializable == null) throw new ArgumentError('null isSerializable');
    if (name == null) throw new ArgumentError('null name');
    if (type == null) throw new ArgumentError('null type');
    if (builderFieldUsesNestedBuilder ==
        null) throw new ArgumentError('null builderFieldUsesNestedBuilder');
  }
  factory _$SourceField([updates(SourceFieldBuilder b)]) =>
      (new SourceFieldBuilder()..update(updates)).build();
  SourceField rebuild(updates(SourceFieldBuilder b)) =>
      (toBuilder()..update(updates)).build();
  _$SourceFieldBuilder toBuilder() => new _$SourceFieldBuilder()..replace(this);
  bool operator ==(other) {
    if (other is! SourceField) return false;
    return isSerializable == other.isSerializable &&
        name == other.name &&
        type == other.type &&
        builderFieldUsesNestedBuilder == other.builderFieldUsesNestedBuilder;
  }

  int get hashCode {
    return hashObjects(
        [isSerializable, name, type, builderFieldUsesNestedBuilder]);
  }

  String toString() {
    return 'SourceField {'
        'isSerializable=${isSerializable.toString()}\n'
        'name=${name.toString()}\n'
        'type=${type.toString()}\n'
        'builderFieldUsesNestedBuilder=${builderFieldUsesNestedBuilder.toString()}\n'
        '}';
  }
}

class _$SourceFieldBuilder extends SourceFieldBuilder {
  _$SourceFieldBuilder() : super._();
  bool get isSerializable => super.isSerializable;
  void set isSerializable(bool isSerializable) {
    if (isSerializable == null) throw new ArgumentError('null isSerializable');
    super.isSerializable = isSerializable;
  }

  String get name => super.name;
  void set name(String name) {
    if (name == null) throw new ArgumentError('null name');
    super.name = name;
  }

  String get type => super.type;
  void set type(String type) {
    if (type == null) throw new ArgumentError('null type');
    super.type = type;
  }

  bool get builderFieldUsesNestedBuilder => super.builderFieldUsesNestedBuilder;
  void set builderFieldUsesNestedBuilder(bool builderFieldUsesNestedBuilder) {
    if (builderFieldUsesNestedBuilder ==
        null) throw new ArgumentError('null builderFieldUsesNestedBuilder');
    super.builderFieldUsesNestedBuilder = builderFieldUsesNestedBuilder;
  }

  void replace(SourceField other) {
    super.isSerializable = other.isSerializable;
    super.name = other.name;
    super.type = other.type;
    super.builderFieldUsesNestedBuilder = other.builderFieldUsesNestedBuilder;
  }

  void update(updates(SourceFieldBuilder b)) {
    if (updates != null) updates(this);
  }

  SourceField build() => new _$SourceField._(
      isSerializable: isSerializable,
      name: name,
      type: type,
      builderFieldUsesNestedBuilder: builderFieldUsesNestedBuilder);
}
