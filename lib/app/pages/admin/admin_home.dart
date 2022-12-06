import 'package:ecommerce_firebase/app/pages/admin/admin_add_product.dart';
import 'package:ecommerce_firebase/app/providers.dart';
import 'package:ecommerce_firebase/models/product.dart';
import 'package:ecommerce_firebase/widgets/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class AdminHome extends ConsumerWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Home"),
        actions: [
          IconButton(
              onPressed: (() => ref.read(firebaseAuthProv).signOut()),
              icon: const Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: ((context) => const AdminAddProduct()))),
      ),
      body: StreamBuilder<List<Product>>(
        stream: ref.read(databaseProvider)!.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.data != null) {
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("No products yet..."),
                    Lottie.asset("assets/anim/empty.json", // here
                        width: 200,
                        repeat: true),
                  ],
                ),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  final product = snapshot.data![index];
                  return ProductListTile(
                    product: product,
                    onDelete: (() async {
                      await ref
                          .read(databaseProvider)!
                          .deleteProduct(product.id!);
                    }),
                    onPressed: () {
                      print("test");
                    },
                  );
                }));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
