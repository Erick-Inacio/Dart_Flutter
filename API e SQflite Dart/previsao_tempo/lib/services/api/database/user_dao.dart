
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class UserDao{
  static final UserDao _instance = UserDao.internal();
  factory UserDao() => _instance;

  UserDao.internal();

  Database _database;

  Future<Database> get db async{
    if(_database != null){
      return _database;
    }else{
      _database = await initDb();
      return _database;
    }
  }

  Future<Database> initDb() async{
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'database.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate,);
}