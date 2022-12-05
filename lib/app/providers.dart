import 'package:ecommerce_firebase/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProv =
    Provider<FirebaseAuth>(((ref) => FirebaseAuth.instance));

final authStateChangeProv = StreamProvider<User?>(((ref) {
  return ref.watch(firebaseAuthProv).authStateChanges();
}));

final databaseProvider = Provider<FirestoreService?>(((ref) {
  final auth = ref.watch(authStateChangeProv);

  String? uid = auth.asData?.value?.uid;

  if (uid != null) {
    return FirestoreService(uid: uid);
  }
}));


