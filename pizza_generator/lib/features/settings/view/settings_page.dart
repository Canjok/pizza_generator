import 'package:flutter/material.dart';
import 'package:pizza_generator/features/common/widget_constants.dart';
import 'package:pizza_generator/features/settings/bloc/bloc.dart';
import 'package:pizza_generator/features/settings/widgets/settings_body.dart';
import 'package:pizza_generator/injection_container.dart';
import 'package:pizza_generator/l10n/l10n.dart';

/// {@template settings_page}
/// A description for SettingsPage
/// {@endtemplate}
class SettingsPage extends StatelessWidget {
  /// {@macro settings_page}
  const SettingsPage({super.key});

  /// The static route for SettingsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const SettingsPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(
        saveIngredientGenerationCountUsecase: sl(),
        loadIngredientGenerationCountUsecase: sl(),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(context.l10n.settings),
        ),
        body: Padding(
          padding: EdgeInsets.all(WidgetConstants.pagePadding),
          child: const SettingsView(),
        ),
      ),
    );
  }
}

/// {@template settings_view}
/// Displays the Body of SettingsView
/// {@endtemplate}
class SettingsView extends StatelessWidget {
  /// {@macro settings_view}
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsBody();
  }
}
