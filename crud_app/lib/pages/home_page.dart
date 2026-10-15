import 'package:crud_app/models/product.dart';
import 'package:crud_app/pages/add_product_page.dart';
import 'package:crud_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> _products = [
    Product(
      name: "Goodnight Punpun",
      imageUrl: "https://m.media-amazon.com/images/I/917IJDfk36L._AC_UF1000,1000_QL80_.jpg",
      price: 520,
      description: "Goodnight Punpun is a Japanese manga series written and illustrated by Inio Asano. It was initially serialized in Shogakukan's seinen manga magazine Weekly Young Sunday between 2007 and 2008, and was later transferred to Weekly Big Comic Spirits, where it ran from 2008 to 2013.",
    ),
    Product(
      name: "20th Century Boys",
      imageUrl: "https://m.media-amazon.com/images/I/81TZrYTkAkL._AC_UF1000,1000_QL80_.jpg",
      price: 480,
      description: "20th Century Boys is a Japanese manga series written and illustrated by Naoki Urasawa. It was originally serialized in Shogakukan's seinen manga magazine Big Comic Spirits from 1999 to 2006, with the 249 chapters published into 22 tankōbon volumes.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Future<void> _gotoAddPage() async {
      final product = await Navigator.push<Product>(
        context,
        MaterialPageRoute(builder: (context) => const AddProductPage()),
      );

      if (!mounted || product == null) return;

      setState(() {
        _products.add(product);
        print(product.name);
      });
    }

    return Scaffold(
      body: _products.isEmpty
          ? const Text("NO Product added")
          : GridView.builder(
              itemCount: _products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                final product = _products[index];

                return Builder(
                  builder: (context) {
                    return ProductCard(product: product, onLongPressed: () {});
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _gotoAddPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
