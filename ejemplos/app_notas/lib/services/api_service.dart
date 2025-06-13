import 'dart:convert';

import '../models/nota.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://localhost:3001';

  Future<List<Nota>> obtenerNotas() async {
    final response = await http.get(Uri.parse('$baseUrl/notas'));
    if (response.statusCode == 200) {
      final List datos = json.decode(response.body);
      return datos.map((json) => Nota.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los datos');
    }
  }

  Future<Nota> crearNota(Nota nota) async {
    final response = await http.post(
      Uri.parse('$baseUrl/notas'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(nota.toJson()),
    );
    if (response.statusCode == 201) {
      return Nota.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al crear nota');
    }
  }

  Future<void> eliminarNota(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/notas/$id'));
    if (response.statusCode != 200) {
      throw Exception('Error al eliminar la nota');
    }
  }
}
