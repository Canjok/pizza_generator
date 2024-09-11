import 'package:flutter/material.dart';
import 'package:pizza_generator/features/pizza_generator/bloc/bloc.dart';
import 'package:pizza_generator/l10n/l10n.dart';

class AddIngredientItem extends StatefulWidget {
  const AddIngredientItem({
    super.key,
  });

  @override
  State<AddIngredientItem> createState() => _AddIngredientItemState();
}

class _AddIngredientItemState extends State<AddIngredientItem> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: context.l10n.newIngredient,
        suffixIcon: IconButton(
          onPressed: () {
            final name = _controller.text;
            _controller.clear();
            BlocProvider.of<PizzaGeneratorBloc>(context)
                .add(AddIngredientEvent(name: name));
          },
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
