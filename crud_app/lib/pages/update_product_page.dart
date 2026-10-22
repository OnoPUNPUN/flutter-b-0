import 'package:crud_app/models/product.dart';
import 'package:crud_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class UpdateProductPage extends StatefulWidget {
  final Product product;
  const UpdateProductPage({super.key, required this.product});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameTEController;
  late final TextEditingController _imageTEController;
  late final TextEditingController _priceTEController;
  late final TextEditingController _descriptionTEController;

  @override
  void initState() {
    super.initState();
    _nameTEController = TextEditingController(text: widget.product.name);
    _imageTEController = TextEditingController(text: widget.product.imageUrl);
    _priceTEController = TextEditingController(
      text: widget.product.price.toString(),
    );
    _descriptionTEController = TextEditingController(
      text: widget.product.description,
    );
  }

  void _updateProduct() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final price = double.tryParse(_priceTEController.text.trim());

    if (price == null || price <= 0) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Enter a Valid Price")));
      return;
    }

    final updatedProduct = Product(
      id: widget.product.id,
      name: _nameTEController.text.trim(),
      imageUrl: _imageTEController.text.trim(),
      price: price,
      description: _descriptionTEController.text.trim(),
    );

    Navigator.pop(context, updatedProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update Product")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
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
                  onPressed: _updateProduct,
                  child: Text("Update Product"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
