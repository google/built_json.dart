library built_json_generator.source_library;

import 'package:analyzer/src/generated/element.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_json_generator/src/library_elements.dart';
import 'package:built_json_generator/src/source_class.dart';
import 'package:built_value/built_value.dart';

part 'source_library.g.dart';

abstract class SourceLibrary
    implements Built<SourceLibrary, SourceLibraryBuilder> {
  bool get hasSerializers;
  BuiltSet<SourceClass> get sourceClasses;
  BuiltSet<SourceClass> get transitiveSourceClasses;

  factory SourceLibrary([updates(SourceLibraryBuilder b)]) = _$SourceLibrary;
  SourceLibrary._();

  static SourceLibrary fromLibraryElement(LibraryElement libraryElement) {
    final result = new SourceLibraryBuilder();

    // TODO(davidmorgan): better way of checking for top level declaration.
    result.hasSerializers = libraryElement.definingCompilationUnit.accessors
        .any((element) => element.displayName == 'serializers');

    final classElements = LibraryElements.getClassElements(libraryElement);
    for (final classElement in classElements) {
      final builderClassElement =
          libraryElement.getType(classElement.displayName + 'Builder');
      final sourceClass =
          SourceClass.fromClassElements(classElement, builderClassElement);
      if (sourceClass.needsBuiltJson) {
        result.sourceClasses.add(sourceClass);
      }
    }

    final transitiveClassElements =
        LibraryElements.getTransitiveClassElements(libraryElement);
    for (final classElement in transitiveClassElements) {
      final sourceClass = SourceClass.fromClassElements(classElement, null);
      if (sourceClass.needsBuiltJson) {
        result.transitiveSourceClasses.add(sourceClass);
      }
    }

    return result.build();
  }

  bool get needsBuiltJson => sourceClasses.isNotEmpty;

  /// Generates serializer source for this library.
  String generate() {
    return (hasSerializers
            ? 'Serializers _\$serializers = (new Serializers().toBuilder()' +
                transitiveSourceClasses
                    .map((sourceClass) =>
                        sourceClass.generateTransitiveSerializerAdder())
                    .join('\n') +
                ').build();'
            : '') +
        sourceClasses
            .map((sourceClass) => sourceClass.generateSerializerDeclaration())
            .join('\n') +
        sourceClasses
            .map((sourceClass) => sourceClass.generateSerializer())
            .join('\n');
  }
}

abstract class SourceLibraryBuilder
    implements Builder<SourceLibrary, SourceLibraryBuilder> {
  bool hasSerializers = false;
  SetBuilder<SourceClass> sourceClasses = new SetBuilder<SourceClass>();
  SetBuilder<SourceClass> transitiveSourceClasses =
      new SetBuilder<SourceClass>();

  factory SourceLibraryBuilder() = _$SourceLibraryBuilder;
  SourceLibraryBuilder._();
}
