import 'package:ecommerce_firebase/models/product.dart';
import 'package:flutter/cupertino.dart';

class Basket extends ChangeNotifier {
  List<Product> productBag = [];
  Basket() : productBag = [];

  void addProduct(Product product) {
    productBag.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    productBag.remove(product);
    notifyListeners();
  }

  void clearBasket() {
    productBag.clear();
    notifyListeners();
  }

  int get totalProducts => productBag.length;

  double get totalPrice => productBag.fold(0, (total, product) {
        return total + product.price;
      });
  bool get isBagEmpty => productBag.isEmpty;
}
