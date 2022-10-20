part of suggestion_textfield;

///
/// using [DatabaseHelper] create the local database and store the all dictionary data.
/// using [db] get the database if exit the return else create new [db].
/// using [getDB] reade the database with internal path.
/// using [getAllEntries] get all data.
/// using [getDataWithQuery] get the all data related to search [query].
///
class DatabaseHelper {

  DatabaseHelper._() {
   _initDB();
  }

  static DatabaseHelper get instance => DatabaseHelper._();

  late final Database _db;

  ///
  /// Get the database
  ///
  Database get db => _db;

  Future<void> _initDB() async {
    var databasesPath = await getDatabasesPath();
    var path = local_storage.join(databasesPath, 'dictionary_database.db');
    var exists = await databaseExists(path);
    if (!exists) {
      debugPrint("Creating new copy from asset");
      try {
        await Directory(local_storage.dirname(path)).create(recursive: true);
      } catch (_) {
        rethrow;
      }

      final ByteData data = await rootBundle.load(local_storage.join('assets/database', 'dictionary.db'));
      final List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
    _db = await openDatabase(path, readOnly: true);
    return;
  }




  ///
  /// get the dictionary data based on related to word limit upto [50].
  /// example, if type A then get the result
  /// aa,aah,aahs,aahed,aahing,abacist,aardvark,aardvarks,aardwolves,abandonable,abandonments,abashednesses
  ///
  Future<List<Map<dynamic, dynamic>>> query(String findValue) {
    return db.rawQuery("SELECT rowid,word,wordtype,definition FROM entries WHERE word like '$findValue%' LIMIT 50");
  }
}