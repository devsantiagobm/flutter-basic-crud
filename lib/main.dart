import 'package:database/pages/product_detail.page.dart';
import 'package:database/pages/products_list.page.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfiWeb;
    return MaterialApp(
      initialRoute: "home",
	  routes: {
		"home": (context)=> const ProductsListPage(),
		"details": (context) => const ProductDetailsPage()
	  },
    );
  }
}
