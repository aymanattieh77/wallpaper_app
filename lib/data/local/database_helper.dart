import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:wallpaper_app/app/constants/constants.dart';

import 'package:wallpaper_app/data/errors/failure.dart';

import 'package:wallpaper_app/data/models/models.dart';

import 'package:wallpaper_app/domain/entities/entities.dart';

const String tabelName = "photos";
const String databasePath = "photo_database.db";
const int version = 1;

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
      version: version,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    try {
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
    } catch (e) {
      throw LocalException(AppConstants.failedToCreateDatabase);
    }
  }

  Future<void> insertPhoto(PhotoModel photo) async {
    try {
      final db = await database;
      await db.insert(
        tabelName,
        photo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw LocalException(AppConstants.failedToInsertPhoto);
    }
  }

  Future<void> deletePhoto(int id) async {
    try {
      final db = await database;
      await db.delete(
        tabelName,
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw LocalException(AppConstants.failedToDeletePhoto);
    }
  }

  Future<List<Photo>> getPhotos() async {
    try {
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
    } catch (e) {
      throw LocalException(AppConstants.failedToGetPhotos);
    }
  }
}
