import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:sportyshop/screens/list_product.dart';
import 'package:sportyshop/widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _thumbnail = "";
  String _category = "jersey";
  int _stock = 0;
  bool _isFeatured = false;

  final List<String> _categories = [
    'jersey', 'shoe', 'pants', 'shirt', 'outer',
    'socks', 'bag', 'equipment', 'accessory', 'protection'
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Form Tambah Produk'))),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Nama Produk", border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                onChanged: (String? value) { setState(() { _name = value!; }); },
                validator: (String? value) { if (value == null || value.isEmpty) return "Nama tidak boleh kosong!"; return null; },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Harga", border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                keyboardType: TextInputType.number,
                onChanged: (String? value) { setState(() { _price = int.tryParse(value!) ?? 0; }); },
                validator: (String? value) { if (value == null || value.isEmpty) return "Harga tidak boleh kosong!"; if (int.tryParse(value) == null) return "Harga harus angka!"; return null; },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Deskripsi", border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                onChanged: (String? value) { setState(() { _description = value!; }); },
                validator: (String? value) { if (value == null || value.isEmpty) return "Deskripsi tidak boleh kosong!"; return null; },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Thumbnail URL", border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                onChanged: (String? value) { setState(() { _thumbnail = value!; }); },
                validator: (String? value) { if (value == null || value.isEmpty) return "Thumbnail tidak boleh kosong!"; return null; },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: "Stok", border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                keyboardType: TextInputType.number,
                onChanged: (String? value) { setState(() { _stock = int.tryParse(value!) ?? 0; }); },
                validator: (String? value) { if (value == null || value.isEmpty) return "Stok tidak boleh kosong!"; if (int.tryParse(value) == null) return "Stok harus angka!"; return null; },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                value: _category,
                items: _categories.map((String items) {
                  return DropdownMenuItem(value: items, child: Text(items));
                }).toList(),
                onChanged: (String? newValue) { setState(() { _category = newValue!; }); },
                decoration: InputDecoration(labelText: "Kategori", border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SwitchListTile(
                title: const Text("Produk Unggulan"),
                value: _isFeatured,
                onChanged: (bool value) { setState(() { _isFeatured = value; }); },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary)),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final response = await request.postJson(
                        "https://haekal-handrian-sportyshop.pbp.cs.ui.ac.id/create-flutter/",
                        jsonEncode({
                          "name": _name,
                          "price": _price,
                          "description": _description,
                          "thumbnail": _thumbnail,
                          "category": _category,
                          "stock": _stock,
                          "is_featured": _isFeatured,
                        }),
                      );
                      if (context.mounted) {
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Produk berhasil disimpan!")));
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProductListPage()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Gagal menyimpan produk.")));
                        }
                      }
                    }
                  },
                  child: const Text("Save", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}