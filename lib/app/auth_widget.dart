import 'package:ecommerce_firebase/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthWidget extends ConsumerWidget {
  const AuthWidget({
    Key? key,
    required this.noSignInBuilder,
    required this.signInBuilder,
    required this.adminSignedInBuilder,
  }) : super(key: key);
  final WidgetBuilder noSignInBuilder;
  final WidgetBuilder signInBuilder;
  final WidgetBuilder adminSignedInBuilder;

  final adminEmail = 'admin@admin.com';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChange = ref.watch(authStateChangeProv);
    return authStateChange.when(
        data: ((user) => user != null
            ? user.email == adminEmail
                ? adminSignedInBuilder(context)
                : signInBuilder(context)
            : noSignInBuilder(context)),
        error: ((error, stackTrace) => const Scaffold(
              body: Center(
                child: Text("Something went bad bad! :("),
              ),
            )),
        loading: () => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
