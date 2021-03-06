import 'package:idb_shim/idb.dart';
import 'package:idb_shim/idb_browser.dart';

class DB {
  //abrindo o banco de dados local
  static const _storeName = "data";

  static Future<Database> open() async {
    IdbFactory? idbFactory = getIdbFactory();
    Database database = await idbFactory!.open("db", version: 1,
        onUpgradeNeeded: (VersionChangeEvent event) async {
      Database db = event.database;

      db.createObjectStore(_storeName, autoIncrement: true);
    });
    return database;
  }

  static Future<void> save(String jsonData, String key) async {
    var db = await open();
    var transaction = db.transaction(_storeName, idbModeReadWrite);
    var store = transaction.objectStore(_storeName);
    var object = await store.put({key: jsonData});

    await transaction.completed;
    db.close();
  }

  static Future<dynamic>? getByKey(String key) async {
    var db = await open();

    var txn = db.transaction(_storeName, idbModeReadOnly);
    var store = txn.objectStore(_storeName);
    var value = await store.getObject(key);
    await txn.completed;

    return value;
  }

  static Future<void> delete(String key) async {
    final db = await open();
    var txn = db.transaction(_storeName, idbModeReadOnly);
    var store = txn.objectStore(_storeName);
    await store.delete(key);

    db.close();
  }

  static Future<void> deleteAllData() async {
    final db = await open();
    db.deleteObjectStore(_storeName);
    db.factory.deleteDatabase("myhero.db");
    db.close();
  }

  /* static Future<void> deleteLike(String key) async {
    final Database db = await open();
    await db.delete('Configuration',
        where: "configName LIKE ?", whereArgs: ['%${key.toLowerCase()}']);
  } */

  /* static Future<void> deleteAll() async {
    final Database db = await open();
    await db.delete('Configuration');
  } */
}



/* import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'base.db');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("DROP TABLE IF EXISTS Configuration");
      // When creating the db, create the table
      await db.execute(
        "CREATE TABLE Configuration (id INTEGER PRIMARY KEY, configName TEXT, configValue TEXT)",
      );
    });

    return database;
  }

  static Future<void> save(String stringJsonValue, String key) async {
    var db = await open();
    await db.delete('Configuration',
        where: 'configName =?', whereArgs: [key.toLowerCase()]);

    await db.insert(
      'Configuration',
      {'configName': key.toLowerCase(), 'configValue': stringJsonValue},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<dynamic> getByKey(String key) async {
    var db = await open();
    var list = await db.rawQuery(
        'SELECT configValue FROM Configuration WHERE configName = ?',
        [key.toLowerCase()]);

    return list.isEmpty ? null : list.first.values.last;
  }

  static Future<void> delete(String key) async {
    final Database db = await open();
    await db.delete('Configuration',
        where: 'configName =?', whereArgs: [key.toLowerCase()]);
    return true;
  }

  static Future<void> deleteLike(String key) async {
    final Database db = await open();
    await db.delete('Configuration',
        where: "configName LIKE ?", whereArgs: ['%${key.toLowerCase()}']);
    return true;
  }

  static Future<void> deleteAll() async {
    final Database db = await open();
    await db.delete('Configuration');
    return true;
  }

  static Future<void> hasCacheExpired() async {
    var cacheTime = await getByKey('cache');
    DateTime currentTime = DateTime.now().add(Duration(hours: -1));

    if (cacheTime != null) {
      DateTime currentCacheTime = DateTime.parse(cacheTime);
      if (currentTime.isBefore(currentCacheTime)) {
        await deleteLike('classifications');
        await deleteLike('matches');
        await deleteLike('red');
        await deleteLike('yellow');
        await deleteLike('topscorers');

        await save(currentTime.toIso8601String(), 'cache');
      }
    } else {
      await save(currentTime.toIso8601String(), 'cache');
    }
  }
} */

