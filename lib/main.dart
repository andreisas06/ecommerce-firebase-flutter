import 'package:ecommerce_firebase/app/auth_widget.dart';
import 'package:ecommerce_firebase/app/pages/admin/admin_add_product.dart';
import 'package:ecommerce_firebase/app/pages/auth/sign_up_page.dart';
import 'package:ecommerce_firebase/app/pages/user/user_home.dart';
import 'package:ecommerce_firebase/app/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/pages/admin/admin_home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          primary: Colors.purple,
        ),
      ),
      home: AuthWidget(
        signInBuilder: (context) => const UserHome(),
        // Scaffold(
        //   body: Center(
        //     child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         const Text("Signed In"),
        //         ElevatedButton(
        //             onPressed: () {
        //               ref.read(firebaseAuthProv).signOut();
        //             },
        //             child: const Text('Sign Out!'))
        //       ],
        //     ),
        //   ),
        // ),
        noSignInBuilder: (context) => const SignUpPage(),
        adminSignedInBuilder: (context) => const AdminHome(),
      ),
    );
  }
}
