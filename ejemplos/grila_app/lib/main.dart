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
        body: const Ejemplo4(),
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

class Ejemplo3 extends StatelessWidget {
  const Ejemplo3({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.green[100 * (index % 9 + 1)],
          child: Center(
            child: Text(
              'Item $index',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        );
      },
    );
  }
}

class Ejemplo4 extends StatelessWidget {
  const Ejemplo4({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Mapa'),
          subtitle: Text('Abre el mapa'),
        ),
        ListTile(
          leading: Icon(Icons.photo),
          title: Text('Albun'),
          subtitle: Text('Tus fotos'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Telefono'),
          subtitle: Text('Llamadas recientes'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Configuracion'),
          subtitle: Text('Ajustes de la aplicacion'),
        ),
      ],
    );
  }
}
