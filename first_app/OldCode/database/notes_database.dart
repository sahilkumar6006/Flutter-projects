import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  NotesDatabase._init();

  static sqflite.Database? _database;

  Future<sqflite.Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<sqflite.Database> _initDB(String filePath) async {
    final dbPath = await sqflite.getDatabasesPath();
    final path = join(dbPath, filePath);

    return await sqflite.openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(sqflite.Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        date TEXT NOT NULL,
        color TEXT NOT NULL
      )
    ''');
  }

  // 🟢 Create
  Future<int> addNote(
    String title,
    String description,
    String date,
    String color,
  ) async {
    final db = await instance.database;

    return await db.insert('notes', {
      'title': title,
      'description': description,
      'date': date,
      'color': color,
    });
  }

  // 🔵 Read all notes
  Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await instance.database;
    return await db.query('notes', orderBy: 'date DESC');
  }

  // 🟣 Read single note by id
  Future<Map<String, dynamic>?> getNoteById(int id) async {
    final db = await instance.database;
    final result = await db.query('notes', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? result.first : null;
  }

  // 🟡 Update
  Future<int> updateNote(
    int id,
    String title,
    String description,
    String date,
    String color,
  ) async {
    final db = await instance.database;

    return await db.update(
      'notes',
      {
        'title': title,
        'description': description,
        'date': date,
        'color': color,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // 🔴 Delete
  Future<int> deleteNote(int id) async {
    final db = await instance.database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  // ⚫ Close database
  Future close() async {
    final db = await _database;
    if (db != null) {
      await db.close();
    }
  }
}
