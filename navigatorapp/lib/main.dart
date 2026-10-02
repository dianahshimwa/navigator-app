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
  final String image;

  const Product({
    required this.name,
    required this.label,
    required this.description,
    required this.price,
    required this.color,
    required this.image,
  });
}

const List<Product> products = [
  Product(
    name: 'Pixel',
    label: 'pixel 1',
    description: 'Pixel is the most featureful phone ever',
    price: 800,
    color: Colors.blue,
    image: 'https://res.cloudinary.com/dl2fjmhft/image/upload/w_600,q_auto,f_auto/v1790929097/pexels-richard-l-2150581203-32218867_n3dizm.jpg'
  ),
  Product(
    name: 'Laptop',
    label: 'laptop',
    description: 'Laptop is most productive development tool',
    price: 2000,
    color: Colors.green,
    image: 'https://res.cloudinary.com/dl2fjmhft/image/upload/w_600,q_auto,f_auto/v1790929094/pexels-pavel-danilyuk-7190953_emrbmi.jpg'
  ),
  Product(
    name: 'Tablet',
    label: 'tablet',
    description: 'Tablet is the most useful device ever for meeting',
    price: 1500,
    color: Color(0xFFCDDC39),
    image:'https://res.cloudinary.com/dl2fjmhft/image/upload/w_600,q_auto,f_auto/v1790929098/pexels-mallonymedia-6849081_aiaxwt.jpg'
  ),
  Product(
    name: 'Pendrive',
    label: 'pen drive',
    description: 'Pendrive is useful storage medium',
    price: 100,
    color: Colors.redAccent,
    image: 'https://res.cloudinary.com/dl2fjmhft/image/upload/w_600,q_auto,f_auto/v1790929094/pexels-ruben-boekeloo-521336009-18641665_wkrb2g.jpg'
  ),
  Product(
    name: 'Floppy Drive',
    label: 'floppy',
    description: 'Floppy drive is useful rescue storage medium',
    price: 20,
    color: Colors.teal,
    image: 'https://res.cloudinary.com/dl2fjmhft/image/upload/w_600,q_auto,f_auto/v1790929094/pexels-nicolas-foster-65973708-38117132_tjoloj.jpg'
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

// ---------------- COLOURED BOX ----------------
class ColorBox extends StatelessWidget {
  final Product product;
  final double? width;
  final double? height;
  final double fontSize;

  const ColorBox({
    super.key,
    required this.product,
    this.width,
    this.height,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.network(
        product.image,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            color: product.color,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(color: Colors.white),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          debugPrint('Image failed for ${product.name}: $error');
          return Container(
            color: product.color,
            alignment: Alignment.center,
            child: Text(
              product.label,
              style: TextStyle(color: Colors.white, fontSize: fontSize),
            ),
          );
        },
      ),
    );
  }
}
 
// ---------------- DETAILS PAGE ----------------
class ProductDetailsPage extends StatelessWidget {
  final Product product;
  const ProductDetailsPage({super.key, required this.product});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar adds the back arrow automatically -> returns to home page
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ColorBox(product: product, height: 250, fontSize: 60),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(product.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 40),
                  Text(product.description, textAlign: TextAlign.center),
                  const SizedBox(height: 40),
                  Text('Price: ${product.price}'),
                  const SizedBox(height: 40),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: RatingBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- STAR RATING ----------------
class RatingBox extends StatefulWidget {
  const RatingBox({super.key});
 
  @override
  State<RatingBox> createState() => _RatingBoxState();
}
 
class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;
 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        return IconButton(
          iconSize: 20,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          color: Colors.red[500],
          icon: Icon(i < _rating ? Icons.star : Icons.star_border),
          onPressed: () => setState(() => _rating = i + 1),
        );
      }),
    );
  }
}