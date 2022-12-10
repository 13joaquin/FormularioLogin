import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DB {
  late Database db;
  Future open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    print(path);

    Database db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''

                  CREATE TABLE IF NOT EXISTS product( 
                        id primary key,
                        name varchar(255) not null,
                        available int not null,
                        price double not null, 
                        available boolen not null
                    );

                    //create more table here
                
                ''');
          //table students will be created if there is no table 'students'
          print("Table Created");
        });
  }
  Future<Map<dynamic, dynamic>?> getStudent(int rollno) async {
    List<Map> maps = await db.query('product',
        where: 'available = ?',
        whereArgs: [rollno]);
    //getting student data with roll no.
    if (maps.length > 0) {
      return maps.first;
    }
    return null;
  }
}
