class UserModel {
  final String id;
  final String name;
  final String? phone;
  final String role;

  const UserModel({
    required this.id,
    required this.name,
    this.phone,
    required this.role,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'].toString(),
      name: map['name'] ?? '',
      phone: map['phone'],
      role: map['role'] ?? 'customer',
    );
  }
}
