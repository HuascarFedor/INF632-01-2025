import 'package:flutter/material.dart';

class ScoreTable extends StatelessWidget {
  final List<String> categories;
  final List<Map<String, int?>> scoreSheet;

  const ScoreTable({
    required this.categories,
    required this.scoreSheet,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Categoría')),
        DataColumn(label: Text('Jugador 1')),
        DataColumn(label: Text('Jugador 2')),
      ],
      rows:
          categories.map((category) {
            return DataRow(
              cells: [
                DataCell(Text(category)),
                DataCell(Text(scoreSheet[0][category]?.toString() ?? '')),
                DataCell(Text(scoreSheet[1][category]?.toString() ?? '')),
              ],
            );
          }).toList(),
    );
  }
}
