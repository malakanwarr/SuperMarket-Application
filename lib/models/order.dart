class Order {
  final String id;
  final String date;
  final List<OrderItem> items;
  final String status;

  Order({
    required this.id,
    required this.date,
    required this.items,
    required this.status,
  });
}

class OrderItem {
  final String productName;
  final int quantity;
  final double price;

  OrderItem({
    required this.productName,
    required this.quantity,
    required this.price,
  });
}
