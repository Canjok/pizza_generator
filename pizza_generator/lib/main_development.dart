import 'package:pizza_generator/app/app.dart';
import 'package:pizza_generator/bootstrap.dart';
import 'package:pizza_generator/injection_container.dart';

void main() {
  initServiceLocator();
  bootstrap(() => const App());
}
