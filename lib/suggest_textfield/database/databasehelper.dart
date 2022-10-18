part of suggestion_textfield;

///
/// using [DatabaseHelper] create the local database and store the all dictionary data.
/// using [db] get the database if exit the return else create new [db].
/// using [getDB] reade the database with internal path.
/// using [getAllEntries] get all data.
/// using [getDataWithQuery] get the all data related to search [query].
///
class DatabaseHelper {

  // static const NEW_DB_VERSION = 6;
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  Database? _db;

  ///
  /// Get the database
  ///
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await getDB();
      return _db;
    }
  }

  ///
  /// Used to annotate a declaration which should only be used from
  /// within the package in which it is declared, and which
  /// should not be exposed from said package's public API.
  ///
  DatabaseHelper.internal();

  ///
  /// get the dictionary data using [DatabaseHelper] class.
  ///
  Future<Database> getDB() async {
    var databasesPath = await getDatabasesPath();
    var path = local_storage.join(databasesPath, 'dictionary_database.db');
    var exists = await databaseExists(path);
    if (!exists) {
      debugPrint("Creating new copy from asset");
      try {
        await Directory(local_storage.dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(local_storage.join('assets/database', 'dictionary.db'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }
    var bomDataTable = await openDatabase(path, readOnly: true);
    return bomDataTable;
  }


  Future<List<Dictionary>> getAllEntries() async {
    List<Dictionary> user = [];
    var dbClient = await db;
    List<Map> maps = await dbClient!.query('entries',
        // columns: ['word']);
        columns: ['id', 'word', 'wordtype', 'definition']);
    if (maps.isNotEmpty) {
      for (var f in maps) {
        user.add(Dictionary.fromMap(f));
        debugPrint('getAllUser : ${Dictionary.fromMap(f).toString()}');
      }
    }
    return user;
  }


  ///
  /// get the dictionary data based on related to word limit upto [50].
  /// example, if type A then get the result
  /// aa,aah,aahs,aahed,aahing,abacist,aardvark,aardvarks,aardwolves,abandonable,abandonments,abashednesses
  ///
  // Future<List<Dictionary>> getDataWithQuery(String findValue) async {
  Future getDataWithQuery(String findValue) async {
    // List<Dictionary> dictionary = [];
    var dbClient = await db;
    // List<Map> maps = await dbClient!.query('entries',
    //     columns: ['word'],where: 'word',whereArgs: ['a%']);
    List<Map> maps = await dbClient!.rawQuery("SELECT rowid,word,wordtype,definition FROM entries WHERE word like '$findValue%' LIMIT 50");
    // columns: ['id', 'word', 'wordtype', 'definition']);
    // if (maps.isNotEmpty) {
    //   for (var f in maps) {
    //     dictionary.add(Dictionary.fromMap(f));
    //     // debugPrint('getDataWithQuery : ${Dictionary.fromMap(f).toString()}');
    //   }
    // }
    return maps;
  }
}