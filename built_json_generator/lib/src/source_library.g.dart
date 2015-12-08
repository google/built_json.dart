// GENERATED CODE - DO NOT MODIFY BY HAND
// 2015-12-04T15:56:21.652Z

part of built_json_generator.source_library;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class SourceLibrary
// **************************************************************************

class _$SourceLibrary extends SourceLibrary {
  final bool hasSerializers;
  final BuiltSet<SourceClass> sourceClasses;
  final BuiltSet<SourceClass> transitiveSourceClasses;
  _$SourceLibrary._(
      {this.hasSerializers, this.sourceClasses, this.transitiveSourceClasses})
      : super._() {
    if (hasSerializers == null) throw new ArgumentError('null hasSerializers');
    if (sourceClasses == null) throw new ArgumentError('null sourceClasses');
    if (transitiveSourceClasses ==
        null) throw new ArgumentError('null transitiveSourceClasses');
  }
  factory _$SourceLibrary([updates(SourceLibraryBuilder b)]) =>
      (new SourceLibraryBuilder()..update(updates)).build();
  SourceLibrary rebuild(updates(SourceLibraryBuilder b)) =>
      (toBuilder()..update(updates)).build();
  _$SourceLibraryBuilder toBuilder() =>
      new _$SourceLibraryBuilder()..replace(this);
  bool operator ==(other) {
    if (other is! SourceLibrary) return false;
    return hasSerializers == other.hasSerializers &&
        sourceClasses == other.sourceClasses &&
        transitiveSourceClasses == other.transitiveSourceClasses;
  }

  int get hashCode {
    return hashObjects(
        [hasSerializers, sourceClasses, transitiveSourceClasses]);
  }

  String toString() {
    return 'SourceLibrary {'
        'hasSerializers=${hasSerializers.toString()}\n'
        'sourceClasses=${sourceClasses.toString()}\n'
        'transitiveSourceClasses=${transitiveSourceClasses.toString()}\n'
        '}';
  }
}

class _$SourceLibraryBuilder extends SourceLibraryBuilder {
  _$SourceLibraryBuilder() : super._();
  bool get hasSerializers => super.hasSerializers;
  void set hasSerializers(bool hasSerializers) {
    if (hasSerializers == null) throw new ArgumentError('null hasSerializers');
    super.hasSerializers = hasSerializers;
  }

  SetBuilder<SourceClass> get sourceClasses => super.sourceClasses;
  void set sourceClasses(SetBuilder<SourceClass> sourceClasses) {
    if (sourceClasses == null) throw new ArgumentError('null sourceClasses');
    super.sourceClasses = sourceClasses;
  }

  SetBuilder<SourceClass> get transitiveSourceClasses =>
      super.transitiveSourceClasses;
  void set transitiveSourceClasses(
      SetBuilder<SourceClass> transitiveSourceClasses) {
    if (transitiveSourceClasses ==
        null) throw new ArgumentError('null transitiveSourceClasses');
    super.transitiveSourceClasses = transitiveSourceClasses;
  }

  void replace(SourceLibrary other) {
    super.hasSerializers = other.hasSerializers;
    super.sourceClasses = other.sourceClasses?.toBuilder();
    super.transitiveSourceClasses = other.transitiveSourceClasses?.toBuilder();
  }

  void update(updates(SourceLibraryBuilder b)) {
    if (updates != null) updates(this);
  }

  SourceLibrary build() => new _$SourceLibrary._(
      hasSerializers: hasSerializers,
      sourceClasses: sourceClasses?.build(),
      transitiveSourceClasses: transitiveSourceClasses?.build());
}
