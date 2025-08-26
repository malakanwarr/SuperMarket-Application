import 'package:flutter/material.dart';
import 'package:supermarket_app/models/product.dart';

class CartProvider extends ChangeNotifier {
  final Map<String, Map<String, dynamic>> _items = {};

  Map<String, Map<String, dynamic>> get items => _items;

  double get total {
    return _items.values.fold(0,
        (sum, item) => sum + (item['product'].price * item['quantity']));
  }

  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!['quantity']++;
    } else {
      _items[product.id] = {
        'product': product,
        'quantity': 1,
      };
    }
    notifyListeners();
  }

  void increaseQuantity(String productId) {
    _items[productId]!['quantity']++;
    notifyListeners();
  }

  void decreaseQuantity(String productId) {
    if (_items[productId]!['quantity'] > 1) {
      _items[productId]!['quantity']--;
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clearCart() {}
}
