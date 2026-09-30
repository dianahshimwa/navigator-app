import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Navigation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      home: const ProductListPage(),
    );
  }
}

// ---------------- MODEL ----------------
class Product {
  final String name;
  final String label; // text shown inside the coloured box
  final String description;
  final int price;
  final Color color;

  const Product({
    required this.name,
    required this.label,
    required this.description,
    required this.price,
    required this.color,
  });
}

const List<Product> products = [
  Product(
    name: 'Pixel',
    label: 'pixel 1',
    description: 'Pixel is the most featureful phone ever',
    price: 800,
    color: Colors.blue,
  ),
  Product(
    name: 'Laptop',
    label: 'laptop',
    description: 'Laptop is most productive development tool',
    price: 2000,
    color: Colors.green,
  ),
  Product(
    name: 'Tablet',
    label: 'tablet',
    description: 'Tablet is the most useful device ever for meeting',
    price: 1500,
    color: Color(0xFFCDDC39),
  ),
  Product(
    name: 'Pendrive',
    label: 'pen drive',
    description: 'Pendrive is useful storage medium',
    price: 100,
    color: Colors.redAccent,
  ),
  Product(
    name: 'Floppy Drive',
    label: 'floppy',
    description: 'Floppy drive is useful rescue storage medium',
    price: 20,
    color: Colors.teal,
  ),
];

// ---------------- LIST PAGE (HOME) ----------------
class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Navigation')),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetailsPage(product: product),
              ),
            ),
            child: ProductBox(product: product),
          );
        },
      ),
    );
  }
}

// ---------------- LIST ITEM ----------------
class ProductBox extends StatelessWidget {
  final Product product;
  const ProductBox({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 140,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ColorBox(product: product, width: 130, fontSize: 26),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(product.description, textAlign: TextAlign.center),
                    Text('Price: ${product.price}'),
                    const RatingBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}