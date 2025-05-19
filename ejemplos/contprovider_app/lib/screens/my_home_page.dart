import 'package:flutter/material.dart';

import '../widgets/counter_display.dart';
import '../widgets/increment_button.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejemplo de contador con Provider')),
      body: const Center(child: CounterDisplay()),
      floatingActionButton: IncrementButton(),
    );
  }
}
