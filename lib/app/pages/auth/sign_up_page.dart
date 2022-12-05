import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providerConfigs: [EmailProviderConfiguration()],
      footerBuilder: (context, action) {
        return const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            "By signing in, you agree to our terms and conditions.",
            style: TextStyle(color: Colors.grey),
          ),
        );
      },
    );
  }
}
