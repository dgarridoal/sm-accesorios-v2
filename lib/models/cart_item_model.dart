class CartItemModel {
  String id;
  String nombre;
  int precio;
  int stock;
  int quantity;
  String imagen;

  CartItemModel({
    required this.id,
    required this.nombre,
    required this.precio,
    this.quantity = 1,
    required this.stock,
    required this.imagen,
  });
}
