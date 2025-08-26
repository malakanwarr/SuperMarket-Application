import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supermarket_app/models/product.dart';
import 'package:supermarket_app/providers/cart_provider.dart';



class ProductListScreen extends StatelessWidget {
  final String category;

  ProductListScreen({required this.category});

  final Map<String, List<Product>> sampleProductsByCategory = {
    'Fruits': [
      Product(id: '1', name: 'Apple', price: 5.0, imageUrl: '/Users/malakamr/supermarket_app/lib/assets/Royal-Gala_Iconic.jpg'),
      Product(id: '2', name: 'Banana', price: 3.0, imageUrl: '/Users/malakamr/supermarket_app/lib/assets/Banana_Iconic.jpg'),
      Product(id: '3', name: 'Orange', price: 4.0, imageUrl: '/Users/malakamr/supermarket_app/lib/assets/Orange_Iconic.jpg'),
      Product(id: '4', name: 'Mango', price: 6.0, imageUrl: '/Users/malakamr/supermarket_app/lib/assets/Mango_Iconic.jpg'),
      Product(id: '5', name: 'Pineapple', price: 8.0, imageUrl: '/Users/malakamr/supermarket_app/lib/assets/Pineapple_Iconic.jpg'),   
      Product(id:'6', name:'Kiwi', price: 7.0, imageUrl: '/Users/malakamr/supermarket_app/lib/assets/Kiwi_Iconic.jpg'),

    ],
    'Vegetables': [
      Product(id: '3', name: 'Tomato', price: 2.0, imageUrl: '/Users/malakamr/supermarket_app/lib/assets/Regular-Tomato_Iconic.jpg'),
      Product(id: '4', name: 'Cucumber', price: 2.5, imageUrl: '/Users/malakamr/supermarket_app/lib/assets/Cucumber_Iconic.jpg'),
      Product(id: '5', name: 'Potato', price: 1.0, imageUrl: '/Users/malakamr/supermarket_app/lib/assets/Solid-Potato_Iconic.jpg'),
      Product(id: '7', name: 'Carrot', price: 1.8, imageUrl: '/Users/malakamr/supermarket_app/lib/assets/Carrots_Iconic.jpg'),
      Product(id: '5', name: 'Garlic', price: 1.5, imageUrl: '/Users/malakamr/supermarket_app/lib/assets/Garlic_Iconic.jpg'),
      

    ],
    'Dairy': [
      Product(id: '5', name: 'Almarai Milk Full Fat', price: 64.0, imageUrl: '/Users/malakamr/supermarket_app/lib/assets/mara3i.PNG'),
      Product(id: '6', name: 'Almarai Cooking Cream', price: 99.0, imageUrl: '/Users/malakamr/supermarket_app/lib/assets/mara3i_krema.PNG'),
      Product(id: '7', name: 'Nestle Sweetened Condensed Milk', price: 89.0, imageUrl: '/Users/malakamr/supermarket_app/lib/assets/nestle.PNG'),
      Product(id: '8', name: 'Beyti Milk Full Cream', price: 30.0, imageUrl: '/Users/malakamr/supermarket_app/lib/assets/beyti.PNG'),
    ],
   
  };

  @override
  Widget build(BuildContext context) {
    final List<Product> products = sampleProductsByCategory[category] ?? [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 60, 19),
        iconTheme: IconThemeData(color: Colors.white), // 👈 makes back arrow white
        title: Text('$category', 
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
      )),
      body: Padding(
  padding: const EdgeInsets.all(12.0),
  child: GridView.builder(
    itemCount: products.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2, // 2 cards per row
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.75, // Adjust height-to-width ratio
    ),
    itemBuilder: (context, index) {
      final product = products[index];
      return Card(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  elevation: 4,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          child: Image.asset(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${product.price.toStringAsFixed(2)} EGP',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                IconButton(
  icon: Icon(Icons.add_circle, color: const Color.fromARGB(255, 4, 105, 6), size: 30,),
  onPressed: () {
    Provider.of<CartProvider>(context, listen: false).addToCart(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${product.name} added to cart")),
    );
  },
),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
)
;
    },
  ),
),

    );
  }
}
