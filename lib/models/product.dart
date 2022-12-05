class Product {
  final String? id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson(String id) {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  Product.fromJson(Map<String, dynamic> map)
      : name = map['name'] ?? "",
        id = map['id'] ?? "",
        description = map['description'] ?? "",
        price = map['price'] ?? 0.0,
        imageUrl = map['imageUrl'] ?? "";
}
