import 'package:crud_app/models/product.dart';
import 'package:crud_app/pages/add_product_page.dart';
import 'package:crud_app/pages/update_product_page.dart';
import 'package:crud_app/widgets/product_action_menu.dart';
import 'package:crud_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

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
    void _showMessage(String message) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(message)));
    }

    Future<void> _gotoAddPage() async {
      final product = await Navigator.push<Product>(
        context,
        MaterialPageRoute(builder: (context) => const AddProductPage()),
      );

      if (!mounted || product == null) return;

      setState(() {
        _products.add(product);
      });
      _showMessage("Producte Added");
    }

    Future<void> _goToUpdatePage(int index) async {
      final updatedProduct = await Navigator.push<Product>(
        context,
        MaterialPageRoute(
          builder: (context) => UpdateProductPage(product: _products[index]),
        ),
      );

      if (!mounted || updatedProduct == null) return;
      setState(() {
        _products[index] = updatedProduct;
      });

      _showMessage("Product Updated");
    }

    void _deleteProduct(int index) {
      setState(() {
        _products.removeAt(index);
      });
      _showMessage("Product Deleted");
    }

    Future<void> _showPopOverMenu(BuildContext cardContext, int index) async {
      final action = await showPopover(
        context: cardContext,
        bodyBuilder: (context) => const ProductActionMenu(),
        direction: PopoverDirection.bottom,
        width: 150,
        style: PopoverStyle(
          backgroundColor: Colors.white,
          barrierColor: Colors.transparent,
        ),
      );

      if (!mounted || action == null) return;

      if (index >= _products.length) {
        return;
      }

      if (action == "update") {
        await _goToUpdatePage(index);
      } else if (action == "delete") {
        _deleteProduct(index);
      }
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
                  builder: (cardContext) {
                    return ProductCard(
                      product: product,
                      onLongPressed: () {
                        _showPopOverMenu(cardContext, index);
                      },
                    );
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
