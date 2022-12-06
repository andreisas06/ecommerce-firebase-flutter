import 'dart:io';

import 'package:ecommerce_firebase/app/providers.dart';
import 'package:ecommerce_firebase/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/custom_input_field.dart';

// image provider with riverpod

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
    final addImageProvider = StateProvider<XFile?>((_) => null);
    _addProduct() async {
      final storage = ref.read(databaseProvider);
      final fileStorage = ref.read(storageProvider);
      final imageFile = ref.read(addImageProvider.notifier).state;
      if (storage == null || fileStorage == null || imageFile == null) {
        print("Error: storage, fileStorage or imageStorage is null");
        return;
      }
      final imgUrl = await fileStorage.uploadFile(imageFile.path);
      await storage.addProduct(Product(
        name: titleEditingController.text,
        description: descriptionEditingController.text,
        price: double.parse(priceEditingController.text),
        imageUrl: imgUrl,
      ));

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
            //const Spacer(),
            // ElevatedButton(
            //   onPressed: () => _addProduct(),
            //   child: const Text("Add Product"),
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            Consumer(builder: ((context, ref, child) {
              final image = ref.watch(addImageProvider);
              return image == null
                  ? Text("No Image Selected")
                  : Image.file(
                      File(image.path),
                      height: 200,
                    );
            })),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: (() async {
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    ref.watch(addImageProvider.notifier).state = image;
                  }
                }),
                child: const Text('Upload Image')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: (() => _addProduct()),
              child: const Text("Add Product"),
            ),
          ],
        ),
      ),
    );
  }
}
