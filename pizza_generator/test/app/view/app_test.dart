import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_generator/app/app.dart';
import 'package:pizza_generator/features/pizza_generator/view/pizza_generator_page.dart';

void main() {
  group('App', () {
    testWidgets('renders Pizza Generator page', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(PizzaGeneratorPage), findsOneWidget);
    });
  });
}
