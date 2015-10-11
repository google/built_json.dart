// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:built_json_generator/built_json_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

void main() {
  group('generator', () {
    test('works', () async {
      // TODO(davidmorgan): unit tests. For now, see end to end tests under
      // `example` and unit tests under `built_json`.
    });
  });
}

// Test setup.

Future<String> generate(String source) async {
  final tempDir =
      Directory.systemTemp.createTempSync('built_json_generator.dart.');
  final packageDir = new Directory(tempDir.path + '/packages')..createSync();
  final builtJsonDir = new Directory(packageDir.path + '/built_json')
    ..createSync();
  final builtJsonFile = new File(builtJsonDir.path + '/built_json.dart')
    ..createSync();
  builtJsonFile.writeAsStringSync(builtValueSource);

  final libDir = new Directory(tempDir.path + '/lib')..createSync();
  final sourceFile = new File(libDir.path + '/value.dart');
  sourceFile.writeAsStringSync(source);

  await build([], [new BuiltJsonGenerator()],
      projectPath: tempDir.path, librarySearchPaths: <String>['lib']);
  final outputFile = new File(libDir.path + '/value.g.dart');
  return outputFile.existsSync() ? outputFile.readAsStringSync() : '';
}

const String builtValueSource = r'''
''';
