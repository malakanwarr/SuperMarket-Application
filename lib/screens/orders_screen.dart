import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  // Mock past orders
  final List<Map<String, dynamic>> orders = [
    {
      'id': '#1001',
      'date': '2025-07-25',
      'total': 120.50,
      'items': 4,
    },
    {
      'id': '#1000',
      'date': '2025-07-22',
      'total': 85.75,
      'items': 2,
    },
    {
      'id': '#0999',
      'date': '2025-07-18',
      'total': 199.99,
      'items': 6,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
        backgroundColor: Colors.green[700],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(Icons.receipt_long, color: Colors.green[800]),
              title: Text("Order ${order['id']}"),
              subtitle: Text("Date: ${order['date']}\nItems: ${order['items']}"),
              isThreeLine: true,
              trailing: FittedBox(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "${order['total'].toStringAsFixed(2)} EGP",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 4),
      TextButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Order details not implemented")),
          );
        },
        child: Text("View"),
        style: TextButton.styleFrom(
          foregroundColor: Colors.green[700],
          padding: EdgeInsets.zero,
          minimumSize: Size(50, 20),
        ),
      ),


    ],
  ),
),

            ),
          );
        },
      ),
    );
  }
}