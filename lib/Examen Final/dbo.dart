//import 'package:formulariologin/models/product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDB {
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
                        price int not null, 
                        imagen varchar(255) not null
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
/*
class DB {
  static Future<Database> _openDB() async{
    return openDatabase(join(await getDatabasesPath(), 'product.db'),
    onCreate: (db, version){
      return db.execute(
        "CREATE TABLE product (id INTEGRER PRIMARY KEY, nombre TEXT, precio NUMBER, imagen "
      );
    }, version: 1);
  }
  static Future<int> insert(Productos productos) async {
    Database database = await _openDB();
    return database.insert("product", productos.toMap());
  }
  static Future<int> delete(Productos produc) async{
    Database database = await _openDB();
    return database.delete("product", where: "id ?", whereArgs: [produc.id]);
  }
  static Future<int> update(Productos productos) async {
    Database database = await _openDB();
    return database.update("product", productos.toMap(),where: "id = ?",whereArgs: [productos.id]);
  }
  static Future<List<Productos>> productos() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> productosMap = await database.query("product");
    return List.generate(productosMap.length, (index) => Productos(
      available: productosMap[index][''],
      id: productosMap[index]['id'],
      name: productosMap[index]['nombrbe'],
      price: productosMap[index]['precio'],
      picture: productosMap[index]['imagen']
    ));
  }
  //Senetencia
  static Future<void> insert2(Productos productos) async {
    Database database = await _openDB();
    var resultado = await database.rawInsert("INSERT INTO product (,id, nombre, precio,imagen"
        "VALUES (${productos.id}, ${productos.name}, ${productos.price}, ${productos.picture})");
  }
}
*/