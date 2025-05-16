import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String titulo;
  final Map<String, dynamic> usuario;
  const SecondScreen({super.key, required this.titulo, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre: ${usuario['nombre']}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              'Edad: ${usuario['edad']}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: ${usuario['email']}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'mensaje': 'Datos recibidos correctamente',
                });
              },
              child: const Text('Regresar'),
            ),
          ],
        ),
      ),
    );
  }
}
