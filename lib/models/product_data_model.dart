class ProductDataModel {
  final int id;
  final String title;
  final String model;
  final String color;
  final double price;
  final String imageUrl;
  final List<int> sizes;
  final bool isFavourite;
  final bool isNewArrival;
  final String description;

  ProductDataModel({
    required this.id,
    required this.title,
    required this.model,
    required this.color,
    required this.price,
    required this.imageUrl,
    required this.sizes,
    required this.isFavourite,
    required this.description,
    required this.isNewArrival,
  });
}
