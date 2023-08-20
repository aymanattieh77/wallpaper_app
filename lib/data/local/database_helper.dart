import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wallpaper_app/data/models/models.dart';
import 'package:wallpaper_app/domain/entities/entities.dart';

const String tabelName = "photos";
const String databasePath = "photo_database.db";

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, databasePath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tabelName (
        id INTEGER PRIMARY KEY,
        width INTEGER,
        height INTEGER,    
        alt TEXT,
        url TEXT,
        photographer TEXT,
        src_original TEXT,
        src_large TEXT,
        src_medium TEXT
      )
    ''');
  }

  Future<void> insertPhoto(PhotoModel photo) async {
    final db = await database;
    await db.insert(
      tabelName,
      photo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  // Future<void> updatePhoto(PhotoModel photo) async {
  //   final db = await database;
  //   await db.update(
  //     tabelName,
  //     photo.toMap(),
  //     where: 'id = ?',
  //     whereArgs: [photo.id],
  //   );
  // }

  Future<void> deletePhoto(int id) async {
    final db = await database;
    await db.delete(
      tabelName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Photo>> getPhotos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tabelName);
    return List.generate(
      maps.length,
      (i) {
        return Photo(
          width: maps[i]['width'],
          height: maps[i]['height'],
          id: maps[i]['id'],
          alt: maps[i]['alt'],
          url: maps[i]['url'],
          src: Src(
            original: maps[i]['src_original'],
            large: maps[i]['src_large'],
            medium: maps[i]['src_medium'],
          ),
          photographer: maps[i]['photographer'],
        );
      },
    );
  }
}
