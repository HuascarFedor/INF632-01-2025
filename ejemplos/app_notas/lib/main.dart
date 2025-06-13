import 'package:flutter/material.dart';

import './services/api_service.dart';
import './models/nota.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notas App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const NotasPage(),
    );
  }
}

class NotasPage extends StatefulWidget {
  const NotasPage({super.key});

  @override
  State<NotasPage> createState() => _NotasPageState();
}

class _NotasPageState extends State<NotasPage> {
  final ApiService apiService = ApiService();

  late Future<List<Nota>> _notas;

  @override
  void initState() {
    super.initState();
    _notas = apiService.obtenerNotas();
  }

  void _refrescar() {
    setState(() {
      _notas = apiService.obtenerNotas();
    });
  }

  void _crearNota() async {
    final nueva = Nota(id: 0, title: 'Nueva nota', content: 'Contenido ...');
    await apiService.crearNota(nueva);
    _refrescar();
  }

  void _eliminarNota(int id) async {
    await apiService.eliminarNota(id);
    _refrescar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notas'),
        actions: [
          IconButton(onPressed: _refrescar, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: FutureBuilder<List<Nota>>(
        future: _notas,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final notas = snapshot.data!;
            return ListView.builder(
              itemCount: notas.length,
              itemBuilder: (context, index) {
                final nota = notas[index];
                return ListTile(
                  title: Text(nota.title),
                  subtitle: Text(nota.content),
                  trailing: IconButton(
                    onPressed: () => _eliminarNota(nota.id),
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _crearNota,
        child: const Icon(Icons.add),
      ),
    );
  }
}
