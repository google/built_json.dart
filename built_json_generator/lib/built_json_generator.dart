// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library built_json_generator;

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:built_json_generator/src/source_library.dart';
import 'package:source_gen/source_gen.dart';

/// Generator for Built JSON.
///
/// See: https://github.com/google/built_json.dart/tree/master/example
class BuiltJsonGenerator extends Generator {
  @override
  Future<String> generate(Element element, BuildStep buildStep) async {
    if (element is! LibraryElement) return null;

    final sourceLibrary = SourceLibrary.fromLibraryElement(element as LibraryElement);
    if (!sourceLibrary.needsBuiltJson && !sourceLibrary.hasSerializers) return null;

    return sourceLibrary.generate();
  }
}
