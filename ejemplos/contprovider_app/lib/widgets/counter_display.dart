import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/counter_model.dart';

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);
    return Text('Contador: ${counterModel.count}');
  }
}
