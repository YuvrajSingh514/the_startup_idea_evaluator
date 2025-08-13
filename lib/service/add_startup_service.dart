import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:the_startup_idea_evaluator/service/add_startup_model.dart';

class AddStartupService {
  static final AddStartupService instance = AddStartupService._init();
  static Database? _database;
  AddStartupService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('startups.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE startups (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        tagline TEXT NOT NULL,
        description TEXT NOT NULL,
        rating INTEGER
      )
    ''');
  }

  Future<int?> insertStartup(AddStartupModel idea) async {
    try {
      final db = await instance.database;
      return await db.insert('startups', idea.toMap());
    } catch (e) {
      print(e);
      return 0;
    }
  }

  Future<List<AddStartupModel>> fetchStartups() async {
    try {
      final db = await instance.database;
      final result = await db.query('startups');
      return result.map((json) => AddStartupModel.fromMap(json)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
