import 'package:crud_app/models/product.dart';
import 'package:crud_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameTEController = TextEditingController();
  final _imageTEController = TextEditingController();
  final _priceTEController = TextEditingController();
  final _descriptionTEController = TextEditingController();

  void _addProduct() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final price = double.tryParse(_priceTEController.text.trim());

    if (price == null || price <= 0) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Enter a Valid Price")));
      return;
    }

    final product = Product(
      name: _nameTEController.text.trim(),
      imageUrl: _imageTEController.text.trim(),
      price: price,
      description: _descriptionTEController.text.trim(),
    );

    Navigator.pop(context, product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Product")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextField(
                controller: _nameTEController,
                label: "Product Name",
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _priceTEController,
                label: "Price",
                keyboardType: TextInputType.numberWithOptions(),
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _descriptionTEController,
                label: "Description",
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _imageTEController,
                label: "Imge URL",
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _addProduct,
                  child: const Text("Add Product"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _imageTEController.dispose();
    _priceTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
