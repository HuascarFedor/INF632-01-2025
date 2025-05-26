import 'package:flutter/material.dart';
import 'package:planes_app/views/widgets/add_dialog.dart';
import '../models/plan.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final List<Plan> _plans = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manejo de Planes')),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddPlanDialog(),
        tooltip: 'Agregar Plan',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddPlanDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddDialog(
          title: "Agregar Nuevo Plan",
          decoration: "Nombre del plan",
          onAdd: (String text) {
            setState(() {
              _plans.add(Plan(name: text));
            });
          },
        );
      },
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: _plans.length,
      itemBuilder: (context, index) {
        final plan = _plans[index];
        return Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black26, width: 1.0),
            ),
          ),
          child: ListTile(
            title: Text(
              plan.name,
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
        );
      },
    );
  }
}
