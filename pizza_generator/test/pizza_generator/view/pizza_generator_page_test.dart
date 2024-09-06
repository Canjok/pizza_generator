// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_generator/features/pizza_generator/pizza_generator.dart';

void main() {
  group('PizzaGeneratorPage', () {
    group('route', () {
      test('is routable', () {
        expect(PizzaGeneratorPage.route(), isA<MaterialPageRoute<dynamic>>());
      });
    });

    testWidgets('renders PizzaGeneratorView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: PizzaGeneratorPage()));
      expect(find.byType(PizzaGeneratorView), findsOneWidget);
    });
  });
}
