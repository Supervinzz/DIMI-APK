class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String? categoryId;
  final String? imageUrl;
  final int stock;
  final bool isAvailable;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.categoryId,
    this.imageUrl,
    required this.stock,
    required this.isAvailable,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'].toString(),
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] as num?)?.toDouble() ?? 0,
      categoryId: map['category_id']?.toString(),
      imageUrl: map['image_url'],
      stock: (map['stock'] as num?)?.toInt() ?? 0,
      isAvailable: map['is_available'] ?? true,
    );
  }
}
