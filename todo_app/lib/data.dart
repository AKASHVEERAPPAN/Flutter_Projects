import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'orders.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < newVersion) {
          await db.execute('DROP TABLE IF EXISTS orders');
          await _onCreate(db, newVersion);
        }
      },
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE orders (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        DoSomething TEXT,
        Info TEXT,
        Requirement TEXT,
        Period TEXT
      )
    ''');
  }

  Future<int> insertOrder(Map<String, String> order) async {
    Database db = await database;
    try {
      return await db.insert('orders', order);
    } catch (e) {
      print('Error inserting order: $e');
      return -1;
    }
  }

  Future<List<Map<String, dynamic>>> getOrders() async {
    Database db = await database;
    return await db.query('orders');
  }

  Future<void> updateOrder(int id, Map<String, String> order) async {
    final db = await database;
    await db.update(
      'orders',
      order,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteOrder(int id) async {
    Database db = await database;
    return await db.delete('orders', where: 'id = ?', whereArgs: [id]);
  }
}
