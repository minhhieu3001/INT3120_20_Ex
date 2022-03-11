import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'Product.dart';

class SQLiteDbProvider {
  SQLiteDbProvider._();

  static final SQLiteDbProvider db = SQLiteDbProvider._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }
  initDB() async {
    Directory documentsDirectory = await
    getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "ProductDB.db");
    return await openDatabase(
        path, version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE Product ("
                  "id INTEGER PRIMARY KEY,"
                  "name TEXT,"
                  "image TEXT"")"
          );
          await db.execute(
              "INSERT INTO Product ('id', 'name', 'image') values (?, ?, ?)",
          [1, "The Boss Baby", "https://m.media-amazon.com/images/M/MV5BMTg5MzUxNzgxNV5BMl5BanBnXkFtZTgwMTM2NzQ3MjI@.jpg"]
          );
          await db.execute(
          "INSERT INTO Product ('id', 'name', 'image') values (?, ?, ?)",
          [2, "Frozen", "https://upload.wikimedia.org/wikipedia/vi/thumb/0/05/Frozen_%282013_film%29_poster.jpg/220px-Frozen_%282013_film%29_poster.jpg"]
          );
          // await db.execute(
          // "INSERT INTO Product ('id', 'name', 'description', 'price', 'image')
          // values (?, ?, ?, ?, ?)",
          // [3, "Laptop", "Laptop is most productive development tool", 2000, "laptop.png"]
          // );
          // await db.execute(
          // "INSERT INTO Product ('id', 'name', 'description', 'price', 'image')
          // values (?, ?, ?, ?, ?)",
          // [4, "Tablet", "Laptop is most productive development tool", 1500, "tablet.png"]
          // );
          // await db.execute(
          // "INSERT INTO Product ('id', 'name', 'description', 'price', 'image')
          // values (?, ?, ?, ?, ?)",
          // [5, "Pendrive", "Pendrive is useful storage medium", 100, "pendrive.png"]
          // );
          // await db.execute(
          // "INSERT INTO Product ('id', 'name', 'description', 'price', 'image')
          // values (?, ?, ?, ?, ?)",
          // [6, "Floppy Drive", "Floppy drive is useful rescue storage medium", 20, "floppy.png"]
          // );
        }
    );
  }
  Future<List<Product>> getAllProducts() async {
    final db = await database;
    List<Map> results = await db!.query(
        "Product", columns: Product.columns, orderBy: "id ASC"
    );
    List<Product> products = [];
    for (var result in results) {
      Product product = Product.fromMap(result as Map<String, dynamic>);
      products.add(product);
    }
    return products;
  }
  Future<Product> getProductById(int id) async {
    final db = await database;
    var result = await db!.query("Product", where: "id = ", whereArgs: [id]);
    return Product.fromMap(result.first);
  }
  insert(Product product) async {
    final db = await database;
    var maxIdResult = await db?.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM Product");
    var id = maxIdResult?.first["last_inserted_id"];
    var result = await db?.rawInsert(
        "INSERT Into Product (id, name, image) VALUES (?, ?, ?)",
        [id, product.name, product.image]
    );
    return result;
  }
  update(Product product) async {
    final db = await database;
    var result = await db?.update(
        "Product", product.toMap(), where: "id = ?", whereArgs: [product.id]
    );
    return result;
  }
  delete(int id) async {
    final db = await database;
    db?.delete("Product", where: "id = ?", whereArgs: [id]);
  }
}