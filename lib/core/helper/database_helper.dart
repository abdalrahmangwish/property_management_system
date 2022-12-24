import 'dart:async';

import 'package:path/path.dart';
import 'package:property_management_system/core/helper/database_model/identity_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper.internal();

  static Database? _db;

  int _versionDb = 1;

  int get versionDb => _versionDb;

  //short setter for my variable
  set versionDb(int? value) => _versionDb = value!;

  Future<Database?> createDb() async {
    if (_db != null) {
      return _db;
    }
    String path =
        join(await getDatabasesPath(), "property_managment_system.db");
    var appDb = await openDatabase(path,
        version: versionDb,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
        onConfigure: _onConfigure);
    return appDb;
  }

  deleteMyDatabase() async {
    await deleteDatabase(
        join(await getDatabasesPath(), "property_managment_system.db"));
  }

  FutureOr<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {
    // If you need to add a column
    if (newVersion > oldVersion) {
      db.execute("ALTER TABLE foo ADD COLUMN new_column INTEGER DEFAULT 0");
    }
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "create table myIdentity(id integer primary key autoincrement,token TEXT,name TEXT,email TEXT,user_role integer,imageUrl TEXT,phoneNumber TEXT,serverId integer)");
  }

  /////////////// Identity
  getMyIdentity() async {
    Database? db = await createDb();
    List<MyIdentity>? identity;

    var res = await db!.query("myIdentity");
    identity = res.isNotEmpty
        ? res.map((chat) => MyIdentity.fromMap(chat)).toList()
        : [];
    return identity;
  }

  getTokenFromMyIdentity() async {
    Database? db = await createDb();
    List<MyIdentity>? identity;

    var res = await db!.query("myIdentity");
    identity = res.isNotEmpty
        ? res.map((chat) => MyIdentity.fromMap(chat)).toList()
        : [];
    return identity.first.token;
  }

  getServerIdFromMyIdentity() async {
    Database? db = await createDb();
    List<MyIdentity>? identity;

    var res = await db!.query("myIdentity");
    identity = res.isNotEmpty
        ? res.map((chat) => MyIdentity.fromMap(chat)).toList()
        : [];
    return identity.first.serverId;
  }

  insertMyIdentity(MyIdentity identity) async {
    Database? db = await createDb();
    await db!.insert('myIdentity', identity.toMap());
  }

  updateMyIdentity(MyIdentity identity) async {
    Database? db = await createDb();
    List<MyIdentity> myIdentity = [];
    myIdentity = await getMyIdentity();
    if (myIdentity.isNotEmpty) {
      await db!.update(
          'myIdentity',
          myIdentity.first
              .copyWith(
                  serverId: identity.serverId,
                  email: identity.email,
                  name: identity.name,
                  token: identity.token,
                  imageUrl: identity.imageUrl,
                  phoneNumber: identity.phoneNumber,
                  uesr_role: identity.user_role)
              .toMap(),
          where: "id=?",
          whereArgs: [myIdentity.first.id]);
    } else {
      await insertMyIdentity(identity);
    }
  }
}
