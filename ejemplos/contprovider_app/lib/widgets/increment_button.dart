import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../models/counter_model.dart';

class IncrementButton extends StatelessWidget {
  const IncrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context, listen: false);
    return Column(
      children: [
        IconButton(
          onPressed: counterModel.increment,
          icon: const Icon(Icons.add),
        ),
        IconButton(
          onPressed: counterModel.decrement,
          icon: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
