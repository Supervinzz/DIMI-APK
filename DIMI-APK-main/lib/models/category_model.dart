class CategoryModel {
  final String id;
  final String name;
  final String? imageUrl;

  const CategoryModel({
    required this.id,
    required this.name,
    this.imageUrl,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'].toString(),
      name: map['name'] ?? '',
      imageUrl: map['image_url'],
    );
  }
}
