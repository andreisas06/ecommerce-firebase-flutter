import 'package:ecommerce_firebase/app/providers.dart';
import 'package:ecommerce_firebase/widgets/product_banner.dart';
import 'package:ecommerce_firebase/widgets/product_display.dart';
import 'package:ecommerce_firebase/widgets/user_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserHome extends ConsumerWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserTopBar(
                leadingButton: IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: (() {
                    ref.watch(firebaseAuthProv).signOut();
                  }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ProductBanner(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Products",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "View all of our products",
                style: TextStyle(fontSize: 12),
              ),
              Flexible(child: ProductsDisplay())
            ],
          ),
        ),
      ),
    );
  }
}
