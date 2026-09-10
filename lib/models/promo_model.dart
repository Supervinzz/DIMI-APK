class PromoModel {
  final String id;
  final String name;
  final String? description;
  final double discount;

  const PromoModel({
    required this.id,
    required this.name,
    this.description,
    required this.discount,
  });

  factory PromoModel.fromMap(Map<String, dynamic> map) {
    return PromoModel(
      id: map['id'].toString(),
      name: map['name'] ?? '',
      description: map['description'],
      discount: (map['discount'] as num?)?.toDouble() ?? 0,
    );
  }
}
