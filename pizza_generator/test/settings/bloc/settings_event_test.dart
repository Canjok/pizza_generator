// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_generator/features/settings/bloc/bloc.dart';

void main() {
  group('SettingsEvent', () { 
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomSettingsEvent(),
          isNotNull
        );
      });
    });
  });
}
