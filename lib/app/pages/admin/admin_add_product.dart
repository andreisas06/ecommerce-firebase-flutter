import 'package:ecommerce_firebase/app/providers.dart';
import 'package:ecommerce_firebase/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/custom_input_field.dart';

class AdminAddProduct extends ConsumerStatefulWidget {
  const AdminAddProduct({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdminAddProductState();
}

class _AdminAddProductState extends ConsumerState<AdminAddProduct> {
  final titleEditingController = TextEditingController();
  final priceEditingController = TextEditingController();
  final descriptionEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _addProduct() async {
      final storage = ref.read(databaseProvider);
      if (storage == null) {
        return;
      }
      await storage.addProduct(Product(
          name: titleEditingController.text,
          description: descriptionEditingController.text,
          price: double.parse(priceEditingController.text),
          imageUrl: "imageUrl"));

      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(title: Text("Add Product")),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            CustomInputFieldFb1(
              inputController: titleEditingController,
              labelText: 'Product Name',
              hintText: 'Product Name',
            ),
            const SizedBox(height: 15),
            CustomInputFieldFb1(
              inputController: descriptionEditingController,
              labelText: 'Product Description',
              hintText: 'Product Description',
            ),
            const SizedBox(height: 15),
            CustomInputFieldFb1(
              inputController: priceEditingController,
              labelText: 'Price',
              hintText: 'Price',
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () => _addProduct(),
                child: const Text("Add Product")),
          ],
        ),
      ),
    );
  }
}
