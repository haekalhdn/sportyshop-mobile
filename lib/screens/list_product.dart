import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:sportyshop/models/product.dart';
import 'package:sportyshop/widgets/left_drawer.dart';
import 'package:sportyshop/widgets/product_card.dart';
import 'package:sportyshop/screens/login.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  bool filterByMe = false;

  Future<List<Product>> fetchProduct(CookieRequest request) async {
    String endpoint = filterByMe 
        ? 'https://haekal-handrian-sportyshop.pbp.cs.ui.ac.id/json/?filter=my' 
        : 'https://haekal-handrian-sportyshop.pbp.cs.ui.ac.id/json/';

    final response = await request.get(endpoint);

    var data = response;
    List<Product> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(Product.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('SportyShop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final response = await request.logout("https://haekal-handrian-sportyshop.pbp.cs.ui.ac.id/auth/logout/");
              String message = response["message"];
              if (context.mounted) {
                if (response['status']) {
                  String uname = response["username"];
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("$message Sampai jumpa, $uname."),
                  ));
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(message),
                  ));
                }
              }
            },
          ),
        ],
      ),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () { setState(() { filterByMe = false; }); },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !filterByMe ? Theme.of(context).colorScheme.primary : Colors.grey[800],
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("All Products"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () { setState(() { filterByMe = true; }); },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: filterByMe ? Theme.of(context).colorScheme.primary : Colors.grey[800],
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("My Products"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: fetchProduct(request),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return const Center(child: Text('Belum ada produk.', style: TextStyle(fontSize: 20, color: Color(0xff59A5D8))));
                  } else {
                    return GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => ProductCard(product: snapshot.data![index]),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}