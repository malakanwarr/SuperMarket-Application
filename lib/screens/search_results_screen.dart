import 'package:flutter/material.dart';
import 'package:supermarket_app/models/product.dart';
import 'package:supermarket_app/models/product_data.dart';

class SearchResultsScreen extends StatelessWidget {
  final String query;

  SearchResultsScreen({required this.query});

  @override
  Widget build(BuildContext context) {
    // filter products
    final List<Product> results = allProducts
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Results for '$query'", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 17, 60, 19),
      ),
      body: results.isEmpty
          ? Center(child: Text("No products found"))
          : GridView.builder(
              padding: EdgeInsets.all(12),
              itemCount: results.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final product = results[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.asset(product.imageUrl, fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${product.price.toStringAsFixed(2)} EGP',
                                    style: TextStyle(color: Colors.grey[700])),
                                IconButton(
                                  icon: Icon(Icons.add_circle,
                                      color: const Color.fromARGB(255, 4, 105, 6), size: 30),
                                  onPressed: () {
                                    print('Added ${product.name} to cart');
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
