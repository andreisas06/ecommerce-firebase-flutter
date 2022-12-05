import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_firebase/models/product.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreService {
  final String uid;

  FirestoreService({required this.uid});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addProduct(Product product) async {
    await firestore
        .collection("products")
        .add(product.toJson())
        .then((value) => print(value))
        .catchError((error) => print("Error"));
  }
}
