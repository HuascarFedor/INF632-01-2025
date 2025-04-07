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
        appBar: AppBar(title: const Text('Ejemplo de GridView y ListView')),
        body: const Ejemplo7(),
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

class Ejemplo5 extends StatelessWidget {
  const Ejemplo5({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.map),
          title: Text('Mapa'),
          subtitle: Text('Abre el mapa'),
        );
      },
      separatorBuilder:
          (context, index) => Divider(color: Colors.grey, thickness: 1),
      itemCount: 10,
    );
  }
}

class Ejemplo6 extends StatelessWidget {
  const Ejemplo6({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 150,
            color: Colors.red,
            child: const Center(child: Text('Elemento 1')),
          ),
          Container(
            width: 150,
            color: Colors.green,
            child: const Center(child: Text('Elemento 2')),
          ),
          Container(
            width: 150,
            color: Colors.blue,
            child: const Center(child: Text('Elemento 3')),
          ),
          Container(
            width: 150,
            color: Colors.yellow,
            child: const Center(child: Text('Elemento 4')),
          ),
          Container(
            width: 150,
            color: Colors.purple,
            child: const Center(child: Text('Elemento 5')),
          ),
          Container(
            width: 150,
            color: Colors.orange,
            child: const Center(child: Text('Elemento 6')),
          ),
        ],
      ),
    );
  }
}

class Ejemplo7 extends StatelessWidget {
  const Ejemplo7({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExpansionTile(
          title: Text('Primera categoria'),
          children: [
            ListTile(
              title: Text('Elemento 1.1'),
              subtitle: Text('Subtitulo 1.1.1'),
            ),
            ListTile(
              title: Text('Elemento 1.2'),
              subtitle: Text('Subtitulo 1.2.1'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Segunda categoria'),
          children: [
            ListTile(
              title: Text('Elemento 2.1'),
              subtitle: Text('Subtitulo 2.1.1'),
            ),
            ListTile(
              title: Text('Elemento 2.2'),
              subtitle: Text('Subtitulo 2.2.1'),
            ),
          ],
        ),
      ],
    );
  }
}
