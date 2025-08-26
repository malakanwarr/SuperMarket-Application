import 'package:flutter/material.dart';
import 'package:supermarket_app/models/order.dart';
import 'order_details_screen.dart'; // ✅ import details screen

class OrdersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {
      "id": "ORD123",
      "date": "2025-08-20",
      "status": "Delivered",
      "items": [
        {"name": "Milk", "quantity": 2, "price": 30},
        {"name": "Bread", "quantity": 1, "price": 15},
      ],
    },
    {
      "id": "ORD124",
      "date": "2025-08-22",
      "status": "Pending",
      "items": [
        {"name": "Apples", "quantity": 5, "price": 50},
        {"name": "Eggs", "quantity": 1, "price": 40},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Orders")),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            color: const Color.fromRGBO(229, 251, 230, 1),
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text("Order #${order['id']}"),
              subtitle: Text(
                  "Date: ${order['date']}\nStatus: ${order['status']}"),
              onTap: () {
                // ✅ Navigate to order details
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OrderDetailsScreen(order: order),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
