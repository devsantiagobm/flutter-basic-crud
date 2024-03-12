import 'package:database/models/product.model.dart';
import 'package:database/providers/product.provider.dart';
import 'package:flutter/material.dart';

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({super.key});

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
  List<ProductModel> productos = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cargarProductos();
  }

  Future<void> _cargarProductos() async {
    List<ProductModel> productosCargados =
        await ProductProvider.instance.query();

    setState(() {
      productos = productosCargados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await ProductProvider.instance.insert(
            ProductModel(nombre: "Nuevo producto", valor: 100, estado: 1),
          );

          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, "home");
        },
      ),
      appBar: AppBar(title: const Text("a"), automaticallyImplyLeading: false),
      body: ListView.builder(
          itemCount: productos.length,
          itemBuilder: (context, i) {
            final product = productos[i];
            return ListTile(
                title: Text(product.nombre ?? "No tiene nombre"),
                subtitle: Text(product.valor.toString()),
                trailing: Text(product.estado == 1 ? "Activo" : "Inactivo"),
                onTap: () {
                  Navigator.pushNamed(context, "details",
                      arguments: {"producto": product});
                });
          }),
    );
  }
}
