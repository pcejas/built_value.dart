// Copyright (c) 2017, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:end_to_end_test/polymorphism.dart';
import 'package:end_to_end_test/serializers.dart';
import 'package:test/test.dart';

void main() {
  group('Cat', () {
    final data = new Cat((b) => b
      ..legs = 4
      ..tail = true);
    final serialized = [
      'Cat',
      'tail',
      true,
      'legs',
      4,
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });

  group('HasField', () {
    final data = new BuiltList<HasField<dynamic>>([
      new HasString((b) => b..field = 'hello'),
      new HasDouble((b) => b..field = 3.14)
    ]);
    final serialized = [
      'list',
      ['HasString', 'field', 'hello'],
      ['HasDouble', 'field', 3.14]
    ];

    test('can be serialized', () {
      expect(serializers.serialize(data), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized), data);
    });
  });
}
