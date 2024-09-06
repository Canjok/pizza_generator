// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_generator/features/pizza_generator/bloc/bloc.dart';

void main() {
  group('PizzaGeneratorBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          PizzaGeneratorBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final pizzaGeneratorBloc = PizzaGeneratorBloc();
      expect(pizzaGeneratorBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<PizzaGeneratorBloc, PizzaGeneratorState>(
      'CustomPizzaGeneratorEvent emits nothing',
      build: PizzaGeneratorBloc.new,
      act: (bloc) => bloc.add(const CustomPizzaGeneratorEvent()),
      expect: () => <PizzaGeneratorState>[],
    );
  });
}
