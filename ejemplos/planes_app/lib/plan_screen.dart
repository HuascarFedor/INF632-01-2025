import 'package:flutter/material.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manejo de Planes')),
      // body: ,
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Agregar Plan',
        child: Icon(Icons.add),
      ),
    );
  }
}
