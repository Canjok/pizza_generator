// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_generator/features/pizza_generator/bloc/bloc.dart';

void main() {
  group('PizzaGeneratorState', () {
    test('supports value equality', () {
      expect(
        PizzaGeneratorState(),
        equals(
          const PizzaGeneratorState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const PizzaGeneratorState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const pizzaGeneratorState = PizzaGeneratorState(
            customProperty: 'My property',
          );
          expect(
            pizzaGeneratorState.copyWith(),
            equals(pizzaGeneratorState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const pizzaGeneratorState = PizzaGeneratorState(
            customProperty: 'My property',
          );
          final otherPizzaGeneratorState = PizzaGeneratorState(
            customProperty: 'My property 2',
          );
          expect(pizzaGeneratorState, isNot(equals(otherPizzaGeneratorState)));

          expect(
            pizzaGeneratorState.copyWith(
              customProperty: otherPizzaGeneratorState.customProperty,
            ),
            equals(otherPizzaGeneratorState),
          );
        },
      );
    });
  });
}
