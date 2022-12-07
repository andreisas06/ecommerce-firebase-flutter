import 'package:flutter/material.dart';

class UserTopBar extends StatelessWidget {
  final IconButton leadingButton;
  const UserTopBar({Key? key, required this.leadingButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leadingButton,
        const Spacer(),
        IconButton(
          onPressed: (() {}),
          icon: const Icon(Icons.history),
        ),
        IconButton(
          onPressed: (() {}),
          icon: const Icon(Icons.shopping_bag),
        )
      ],
    );
  }
}
