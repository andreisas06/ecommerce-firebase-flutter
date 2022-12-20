import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_firebase/models/product.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreService {
  final String uid;

  FirestoreService({required this.uid});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addProduct(Product product) async {
    final docId = firestore.collection("products").doc().id;
    await firestore
        .collection("products")
        .doc(docId)
        .set(product.toJson(docId));
  }

  Future<void> deleteProduct(String id) async {
    await firestore.collection("products").doc(id).delete();
  }

  Stream<List<Product>> getProducts() {
    return firestore
        .collection("products") // gets collection
        .snapshots() // gets snapshots, loop through
        .map((snapshot) => snapshot.docs.map((doc) {
              final d = doc.data();
              return Product.fromJson(d);
            }).toList()); // build a list out of the products mapping
  }
}
