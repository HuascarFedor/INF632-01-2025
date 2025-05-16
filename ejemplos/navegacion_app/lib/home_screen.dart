import 'package:flutter/material.dart';
import 'package:navegacion_app/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla Principal')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Esta es la pantalla principal'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final usuario = {
                  'nombre': 'Juan',
                  'edad': 25,
                  'email': 'juan@example.com',
                };
                final resultado = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => SecondScreen(
                          titulo: 'Detalles del Usuario',
                          usuario: usuario,
                        ),
                  ),
                );
                if (resultado != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(resultado['mensaje']),
                      duration: const Duration(seconds: 4),
                    ),
                  );
                }
              },
              child: const Text('Ir a Segunda Pantalla'),
            ),
          ],
        ),
      ),
    );
  }
}
