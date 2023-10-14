class ProductModel {
  final String productSerial;
  final int stock;
  final num cost;
  final num price;
  final num maxDiscounted;
  final String description;
  final String category;

  ProductModel(
      {required this.productSerial,
      required this.stock,
      required this.cost,
      required this.price,
      required this.maxDiscounted,
      required this.description,
      required this.category});
}
