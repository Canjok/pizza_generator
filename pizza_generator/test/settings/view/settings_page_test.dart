// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_generator/features/settings/settings.dart';

void main() {
  group('SettingsPage', () {
    group('route', () {
      test('is routable', () {
        expect(SettingsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders SettingsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsPage()));
      expect(find.byType(SettingsView), findsOneWidget);
    });
  });
}
