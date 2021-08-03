import 'package:path/path.dart' as Path;
import 'package:sqflite/sqflite.dart';
import 'package:applify/Version 0.2/models/userModel.dart';

class UserDBProvider {
  // Create a singleton
  UserDBProvider();

  static final UserDBProvider db = UserDBProvider();
  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      print('A database already exists and will be returned');
      return _database;
    }
    _database = await openDb();
    print('get database and OpenDb have been called');
    return _database;
  }

  Future openDb() async {
    // Get the location of our apps directory. This is where files for our app, and only our app, are stored.
    // Files in this directory are deleted when the app is deleted.
    return await openDatabase(Path.join(await getDatabasesPath(), "my.db"), version: 5, onOpen: (db) async {
    }, onCreate: (Database db, int version) async {
      final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
      final textType = 'TEXT';
      final numericType = 'REAL';
      // Create the user table
      await db.execute(
        "CREATE TABLE UserModel (_id INTEGER PRIMARY KEY AUTOINCREMENT, search_impression_share REAL, search_exact_match_impression_share REAL, search_rank_lost_impression_share REAL, search_budget_lost_top_impression_share REAL, search_budget_lost_absolute_top_impression_share REAL, all_conversions_from_int_rate REAL, datepulled TEXT, customername TEXT)"

        /*
        '''
        CREATE TABLE $userModel (
        ${userModelFields.id} $idType,
        ${userModelFields.search_impression_share} $numericType,
        ${userModelFields.search_exact_match_impression_share} $numericType,
        ${userModelFields.search_rank_lost_impression_share} $numericType,
        ${userModelFields.search_budget_lost_top_impression_share} $numericType,
        ${userModelFields.search_budget_lost_absolute_top_impression_share} $numericType,
        ${userModelFields.all_conversions_from_int_rate} $numericType,
        ${userModelFields.datepulled} $textType,
        ${userModelFields.customername} $textType
        )
        '''
         */
      );
    });
  }

  Future<List<UserModel>> readAllCards() async {
    final db = await database;

    final orderBy = '${userModelFields.id} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(userModel, orderBy: orderBy);

    return result.map((json) => UserModel.fromMap(json)).toList();
  }

  Future insertUserData(UserModel model) async {
    final db = await database;
    return db.insert('user', model.toMap());
  }

  Future<List<UserModel>> getUser() async {
    final db = await database;

    final List<Map<String, dynamic>> maps  = await db.query('user');
    List<UserModel> list = maps.isNotEmpty ? maps.map((note) => UserModel.fromMap(note)).toList() : [];

    return list;
  }

  queryfid() async {
    final db = await database;

    List<String> columnsToSelect = [
      userModelFields.id
    ];
    String whereString = '${userModelFields.id} = ?';
    List<dynamic> whereArguments = [0,1,2,3,4,5];
    List<Map> result = await db.query(
      userModel,
      columns: columnsToSelect,
      where: whereString,
      whereArgs: whereArguments
    );
    result.forEach((row) => print(row));
    print('query is complete');
  }

  Future<UserModel> createNewCopy(UserModel userModel) async {
    print('createNewCopy has been called');
    final db = await database;

/*
    final json = userModel.toMap();
    final columns = '${userModelFields.customername}';
    final values = '${json[userModelFields.customername]}';
    final id = await db.rawInsert('INSERT INTO $userModel ($columns) VALUES ($values)');
*/
    print(database);
    print('createNewCopy will now call the insert function');
    final id = await db.insert('UserModel', userModel.toMap());
    return userModel.copy(id: id);
  }
/*
  Future<UserModel> read1(String search_impression_share) async {
    final db = await database;

    final maps = await db.query(
      userModel,
      columns: userModelFields.values,
      where: '${userModelFields.search_impression_share} = ?',
      whereArgs: [search_impression_share],
    );

    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    } else {
      throw Exception('Error u fool');
    }
  }


 */

  Future<UserModel> read1() async {
    final db = await database;

    final maps = await db.query(
      userModel,
      columns: userModelFields.values,
      where: '${userModelFields.search_impression_share} = ?',
    );

    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    } else {
      throw Exception('Error u fool');
    }
  }

  Future<UserModel> read2() async {
    final db = await database;

    final maps = await db.query(
      userModel,
      columns: userModelFields.values,
      where: '${userModelFields.search_exact_match_impression_share} = ?',
    );

    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    } else {
      throw Exception('Error u fool');
    }
  }

  Future<UserModel> read3() async {
    final db = await database;

    final maps = await db.query(
      userModel,
      columns: userModelFields.values,
      where: '${userModelFields.search_rank_lost_impression_share} = ?',
    );

    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    } else {
      throw Exception('U fool');
    }
  }

  Future<UserModel> read4() async {
    final db = await database;

    final maps = await db.query(
      userModel,
      columns: userModelFields.values,
      where: '${userModelFields.search_budget_lost_top_impression_share} = ?',
    );

    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    } else {
      throw Exception('idk u fool');
    }
  }

  Future<UserModel> read5() async {
    final db = await database;

    final maps = await db.query(
      userModel,
      columns: userModelFields.values,
      where: '${userModelFields.search_budget_lost_absolute_top_impression_share} = ?',
    );

    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    } else {
      throw Exception('u bigger fool');
    }
  }

  Future<UserModel> read6() async {
    final db = await database;

    final maps = await db.query(
      userModel,
      columns: userModelFields.values,
      where: '${userModelFields.all_conversions_from_int_rate} = ?',
    );

    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    } else {
      throw Exception('y did ur mum hv u');
    }
  }

  Future<List> readAll() async {
    List johnnytay;

    johnnytay.add(read1());
    johnnytay.add(read2());
    johnnytay.add(read3());
    johnnytay.add(read4());
    johnnytay.add(read5());
    johnnytay.add(read6());

    return johnnytay;
  }

  Future<int> update(UserModel userModel) async {
    final db = await database;

    return db.update(
      '$userModel',
      userModel.toMap(),
      where: '${userModelFields.id} = ?',
    );
  }

  Future<int> delete(UserModel userModel) async {
    final db = await database;

    return db.delete(
      '$userModel',
      where: '${userModelFields.id} = ?',
      whereArgs: [userModel.id],
    );
  }

  Future close() async {
    final db = await database;

    db.close();
  }
}