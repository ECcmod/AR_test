import 'package:flutter/material.dart';
import '../services/localization.dart';
import 'ar_capture_screen.dart';
import 'ar_view_screen.dart';
import '../models/product_model.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 1,
      name: 'بيتزا',
      price: 45.0,
      arModel: 'assets/models/pizza.gltf',
      imageUrl: 'assets/images/pizza.jpg',
    ),
    Product(
      id: 2,
      name: 'برجر',
      price: 35.0,
      arModel: 'assets/models/burger.gltf',
      imageUrl: 'assets/images/burger.jpg',
    ),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(local.menu),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ARCaptureScreen()),
                ),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) => _ProductCard(product: products[index]),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;
  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap:
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ARViewScreen(product: product)),
            ),
        child: Column(
          children: [
            Expanded(child: Image.asset(product.imageUrl, fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '${product.price} ر.س',
              style: const TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
