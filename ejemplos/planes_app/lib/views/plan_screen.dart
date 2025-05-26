import 'package:flutter/material.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manejo de Planes')),
      body: _buildList(),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Agregar Plan',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildList() {
    return ListView(
      children: <Widget>[
        for (int i = 0; i < 5; i++) ...[
          Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black26, width: 1.0),
              ),
            ),
            child: ListTile(
              title: Text(
                'Plan ${i + 1}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                ),
              ),
              onTap: () {},
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete, color: Colors.redAccent),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
