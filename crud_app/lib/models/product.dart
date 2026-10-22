// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final int? id;
  final String name;
  final String imageUrl;
  final double price;
  final String description;

  Product({
    this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });

  

  Product copyWith({
    int? id,
    String? name,
    String? imageUrl,
    double? price,
    String? description,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      description: description ?? this.description,
    );
  }
}
