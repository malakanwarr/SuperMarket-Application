import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> order;

  const OrderDetailsScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order #${order['id']}")),
      body: ListView(
        children: [
          ListTile(
            title: Text("Date"),
            subtitle: Text(order['date']),
          ),
          ListTile(
            title: Text("Status"),
            subtitle: Text(order['status']),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Items",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ...order['items'].map<Widget>((item) {
            return ListTile(
              title: Text("${item['name']} x${item['quantity']}"),
              trailing: Text("${item['price']} EGP"),
            );
          }).toList(),
        ],
      ),
    );
  }
}
