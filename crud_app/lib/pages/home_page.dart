import 'package:crud_app/database/app_database.dart';
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

      await AppDatabase.instance.insertProduct(product);

      _showMessage("Producte Added");
    }

    Future<void> _goToUpdatePage(Product product) async {
      final updatedProduct = await Navigator.push<Product>(
        context,
        MaterialPageRoute(
          builder: (context) => UpdateProductPage(product: product),
        ),
      );

      if (!mounted || updatedProduct == null) return;
      
      await AppDatabase.instance.updateProducts(updatedProduct);

      _showMessage("Product Updated");
    }

    Future<void> _deleteProduct(Product product) async {
      if(product.id == null) {
        return;
      }

      await AppDatabase.instance.deleteProduct(product.id!);
      _showMessage("Product Deleted");
    }

    Future<void> _showPopOverMenu(BuildContext cardContext, Product product) async {
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

      if (action == "update") {
        await _goToUpdatePage(product);
      } else if (action == "delete") {
        _deleteProduct(product);
      }
    }

    return Scaffold(
      body: StreamBuilder<List<Product>>(stream: AppDatabase.instance.watchAllProducts(), builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final products = snapshot.data ?? [];

        if (products.isEmpty) {
          return const Center(child: Text("NO products Added"),);
        }
        return GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                final product = products[index];

                return Builder(
                  builder: (cardContext) {
                    return ProductCard(
                      product: product,
                      onLongPressed: () {
                        _showPopOverMenu(cardContext, product);
                      },
                    );
                  },
                );
              },
            );
      }),
           
      floatingActionButton: FloatingActionButton(
        onPressed: _gotoAddPage,
        child: const Icon(Icons.add),
      ),
    );
  }
}
