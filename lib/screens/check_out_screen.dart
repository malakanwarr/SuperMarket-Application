import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supermarket_app/providers/cart_provider.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        backgroundColor: const Color.fromARGB(255, 14, 68, 16),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: cart.items.entries.map((entry) {
                  final product = entry.value['product'];
                  final quantity = entry.value['quantity'];
                  return ListTile(
                    title: Text(product.name),
                    trailing: Text(
                        "${quantity} x ${product.price.toStringAsFixed(2)} EGP"),
                  );
                }).toList(),
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total:",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Text("${cart.total.toStringAsFixed(2)} EGP",
                    style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Mock order confirmation
                  cart.clearCart();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Order confirmed!")),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 8, 60, 11),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  "Confirm Order",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
