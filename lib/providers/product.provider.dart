


import 'package:database/models/product.model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ProductProvider{

	static Database? _database;
	static final ProductProvider instance = ProductProvider._init();
	ProductProvider._init();


	Future<Database> get database async {
		if(_database != null) return _database!;
		_database = await _initDatabase();

		return _database!;
	}


	Future<Database> _initDatabase() async {
		final path = join(await getDatabasesPath(), "products.db");
		return await openDatabase(path, version: 1, onCreate: _onCreate);
	}

    Future<void> _onCreate(Database db, version) async {
        await db.execute(
            '''
                CREATE TABLE products(
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    nombre TEXT,
                    valor REAL,
                    estado INTEGER
                )
            '''
        );


        print("BASE DE DATOS CREADA🎉🎉🎉🎉");

    }


    Future<int> insert(ProductModel producto) async {
        final db = await database;
        final res = await db.insert("products", producto.toJson());
        
        print(res);
        return res;
    }


    Future<List<ProductModel>> query() async {
        final db = await database;
        final res = await db.query("products");
        return res.map((product) => ProductModel.fromJson(product)).toList();
    }


    Future<int> delete(int id) async {
        final db = await database;
        final res = db.delete("products", where: "id = ?", whereArgs: [id]);
        return res;
    }



}