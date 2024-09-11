import 'package:flutter/material.dart';
import 'package:pizza_generator/app/app.dart';
import 'package:pizza_generator/bootstrap.dart';
import 'package:pizza_generator/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceLocator();
  await bootstrap(() => const App());
}
