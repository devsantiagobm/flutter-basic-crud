import 'package:database/models/product.model.dart';
import 'package:database/providers/product.provider.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final ProductModel producto = args['producto'];

    return Scaffold(
      appBar: AppBar(title: const Text("Detalles del Producto")),
      body: Center(child: Text(producto.id.toString())),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () async {
          await ProductProvider.instance.delete(producto.id!);
      
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, "home");
        },
      ),
    );
  }
}
