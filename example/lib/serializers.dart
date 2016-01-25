// Copyright (c) 2015, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_json/built_json.dart';
import 'package:example/test_enum.dart';
import 'package:example/value.dart';
import 'package:example/compound_value.dart';

part 'serializers.g.dart';

/// Example of how to use built_json.
///
/// Declare a top level [Serializers] field called
/// serializers. The built_json code generator will provide the
/// implementation. You usually only need to do this once per project.
Serializers serializers = _$serializers;
