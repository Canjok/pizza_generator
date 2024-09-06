// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_generator/features/pizza_generator/bloc/bloc.dart';

void main() {
  group('PizzaGeneratorEvent', () {
    group('CustomPizzaGeneratorEvent', () {
      test('supports value equality', () {
        expect(
          CustomPizzaGeneratorEvent(),
          equals(const CustomPizzaGeneratorEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(const CustomPizzaGeneratorEvent(), isNotNull);
      });
    });
  });
}
