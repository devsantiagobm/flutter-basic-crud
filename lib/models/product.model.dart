class ProductModel {
  ProductModel({
    this.id,
    this.nombre,
    this.valor,
	this.estado
  });

  int? id;
  String? nombre;
  int? valor;
  int? estado;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        nombre: json["nombre"],
        valor: json["valor"],
		estado: json["estado"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "valor": valor,
		"estado": estado
      };
}
