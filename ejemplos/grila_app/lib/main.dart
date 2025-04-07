import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Ejemplo de GridView')),
        body: const Ejemplo2(),
      ),
    );
  }
}

class Ejemplo1 extends StatelessWidget {
  const Ejemplo1({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Numero de columnas en la cuadricula
      crossAxisCount: 3,
      // Espacio entre los elementos verticalmenete
      crossAxisSpacing: 10,
      // Espacio entre los elementos horizontalmente
      mainAxisSpacing: 10,
      // Espacio entre los bordes de la pantalla y el grid
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
      // Tamaño de los elementos
      childAspectRatio: 1.0,
      // Lista de widgets que se mostraran en el grid
      children: List.generate(10, (index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blue[100 * (index % 9 + 1)],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              'Item $index',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        );
      }),
    );
  }
}

class Ejemplo2 extends StatelessWidget {
  const Ejemplo2({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Numero de columnas en la cuadricula
      crossAxisCount: 2,
      // Espacio entre los elementos verticalmenete
      crossAxisSpacing: 10,
      // Espacio entre los elementos horizontalmente
      mainAxisSpacing: 10,
      // Espacio entre los bordes de la pantalla y el grid
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
      // Tamaño de los elementos
      childAspectRatio: 1.0,
      // Lista de widgets que se mostraran en el grid
      children: [
        Image.network('https://picsum.photos/200/200?random=1'),
        Image.network('https://picsum.photos/200/200?random=2'),
        Image.network('https://picsum.photos/200/200?random=3'),
        Image.network('https://picsum.photos/200/200?random=4'),
        Image.network('https://picsum.photos/200/200?random=5'),
        Image.network('https://picsum.photos/200/200?random=6'),
      ],
    );
  }
}
