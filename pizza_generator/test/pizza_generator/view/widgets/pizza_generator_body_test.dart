// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pizza_generator/features/pizza_generator/pizza_generator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PizzaGeneratorBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => PizzaGeneratorBloc(),
          child: MaterialApp(home: PizzaGeneratorBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
