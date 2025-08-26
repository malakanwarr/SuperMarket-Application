import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supermarket_app/providers/cart_provider.dart';
import 'package:supermarket_app/screens/check_out_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 14, 68, 16),
      ),
      body: Column(
        children: [
          Expanded(
            child: cart.items.isEmpty
                ? Center(child: Text("Your cart is empty"))
                : ListView(
                    children: cart.items.entries.map((entry) {
                      final product = entry.value['product'];
                      final quantity = entry.value['quantity'];

                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: ListTile(
                          leading: Icon(Icons.shopping_bag),
                          title: Text(product.name),
                          subtitle: Text(
                              '${product.price.toStringAsFixed(2)} EGP x $quantity'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle_outline),
                                onPressed: () =>
                                    cart.decreaseQuantity(product.id),
                              ),
                              Text('$quantity'),
                              IconButton(
                                icon: Icon(Icons.add_circle_outline),
                                onPressed: () =>
                                    cart.increaseQuantity(product.id),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
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
                    Text("Total:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("${cart.total.toStringAsFixed(2)} EGP",
                        style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
  onPressed: () {
    if (cart.items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Your cart is empty")),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CheckoutScreen()),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 8, 60, 11),
    padding: EdgeInsets.symmetric(vertical: 14),
  ),
  child: Text("Proceed to Checkout",
      style: TextStyle(fontSize: 16, color: Colors.white)),
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
