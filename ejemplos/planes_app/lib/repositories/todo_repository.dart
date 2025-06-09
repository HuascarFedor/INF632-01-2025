import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:logger/logger.dart';

import '../models/plan.dart';

class Log {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // Muestra 2 niveles de llamadas en la pila
      errorMethodCount: 5, // Muestra 5 niveles para errores
      lineLength: 120, // Longitud máxima de línea
      colors: true, // Salida coloreada
      printEmojis: true, // Emojis en mensajes
      //printTime: true, // Imprimir timestamps
    ),
  );

  static void debug(dynamic message) => _logger.d(message);
  static void info(dynamic message) => _logger.i(message);
  static void warning(dynamic message) => _logger.w(message);
  static void error(dynamic message) => _logger.e(message);
  //static void verbose(dynamic message) => _logger.v(message);
}

class TodoRepository {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'plan.db');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
      'CREATE TABLE Plans(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)',
    );
  }

  Future<List<Plan>> getAllPlans() async {
    final dbPath = await getDatabasesPath();
    Log.info("Archivo de base de datos: $dbPath");

    final db = await database;
    final List<Map<String, dynamic>> planMaps = await db.query('Plans');
    return planMaps.map((planMap) => Plan.fromMap(planMap)).toList();
  }

  Future<int> insertPlan(Plan plan) async {
    final db = await database;
    int id = await db.insert('Plans', plan.toMap());
    return id;
  }

  Future<void> deletePlan(Plan plan) async {
    final db = await database;
    await db.delete('Plans', where: 'id = ?', whereArgs: [plan.id]);
  }
}
