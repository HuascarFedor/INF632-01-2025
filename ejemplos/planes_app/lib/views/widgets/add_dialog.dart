import 'package:flutter/material.dart';

class AddDialog extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  final String title;
  final String decoration;
  final Function(String) onAdd;

  AddDialog({
    super.key,
    required this.title,
    required this.decoration,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: TextField(
        controller: _textController,
        decoration: InputDecoration(hintText: decoration),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancelar"),
        ),
        TextButton(
          onPressed: () {
            if (_textController.text.isNotEmpty) {
              onAdd(_textController.text);
              _textController.clear();
              Navigator.of(context).pop();
            }
          },
          child: const Text("Agregar"),
        ),
      ],
    );
  }
}
