class OrderModel {
  final String id;
  final String userId;
  final double totalPrice;
  final String status;
  final String? paymentMethod;
  final String? deliveryMethod;

  const OrderModel({
    required this.id,
    required this.userId,
    required this.totalPrice,
    required this.status,
    this.paymentMethod,
    this.deliveryMethod,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'].toString(),
      userId: map['user_id'].toString(),
      totalPrice: (map['total_price'] as num?)?.toDouble() ?? 0,
      status: map['status'] ?? 'pending',
      paymentMethod: map['payment_method'],
      deliveryMethod: map['delivery_method'],
    );
  }
}
