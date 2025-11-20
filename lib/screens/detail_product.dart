import 'package:flutter/material.dart';
import 'package:sportyshop/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://haekal-handrian-sportyshop.pbp.cs.ui.ac.id/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              errorBuilder: (ctx, error, stackTrace) =>
                  Container(height: 300, color: Colors.grey[800], child: const Icon(Icons.broken_image, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      if (product.isFeatured)
                        const Chip(
                          label: Text('Featured'),
                          backgroundColor: Colors.amber,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Rp ${product.price}",
                    style: TextStyle(
                        fontSize: 22,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(Icons.category, "Kategori", product.categoryDisplay),
                  _buildInfoRow(Icons.inventory, "Stok", "${product.stock}"),
                  _buildInfoRow(Icons.visibility, "Dilihat", "${product.productViews} kali"),
                  _buildInfoRow(Icons.person, "Penjual", product.username),
                  const Divider(height: 32, color: Colors.grey),
                  const Text(
                    "Deskripsi",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Kembali ke Daftar'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 8),
          Text("$label: ", style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}