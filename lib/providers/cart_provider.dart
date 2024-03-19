import 'package:flutter/material.dart';
import '../core/constants/data/products.dart';
import '/models/product_data_model.dart';
import '/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];

  void addProductToCart(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  void removeProductFromCart(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }
}
