import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  // Mock cart data
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Bananas',
      'price': 10.0,
      'quantity': 2,
    },
    {
      'name': 'Milk',
      'price': 25.5,
      'quantity': 1,
    },
    {
      'name': 'Bread',
      'price': 15.0,
      'quantity': 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    double total = cartItems.fold(
      0,
      (sum, item) => sum + item['price'] * item['quantity'],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Cart",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 14, 68, 16),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: Icon(Icons.shopping_bag),
                    title: Text(item['name']),
                    subtitle: Text(
                        '${item['price'].toStringAsFixed(2)} EGP x ${item['quantity']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            // TODO: Decrease quantity
                          },
                        ),
                        Text('${item['quantity']}'),
                        IconButton(
                          icon: Icon(Icons.add_circle_outline),
                          onPressed: () {
                            // TODO: Increase quantity
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border(top: BorderSide(color: Colors.grey)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${total.toStringAsFixed(2)} EGP",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Checkout logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Checkout not implemented yet")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 8, 60, 11),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text("Proceed to Checkout", 
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
