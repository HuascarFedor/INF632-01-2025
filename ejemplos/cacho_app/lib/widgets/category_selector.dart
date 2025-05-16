import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final List<String> categories;
  final Map<String, int?> scoreSheet;
  final Function(String) onSelectCategory;

  const CategorySelector({
    required this.categories,
    required this.scoreSheet,
    required this.onSelectCategory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children:
          categories.where((cat) => scoreSheet[cat] == null).map((category) {
            return ElevatedButton(
              onPressed: () => onSelectCategory(category),
              child: Text(category),
            );
          }).toList(),
    );
  }
}
