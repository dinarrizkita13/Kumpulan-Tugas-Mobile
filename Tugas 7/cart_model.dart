import 'package:flutter/material.dart';

class Product {
  final String nama, deskripsi;

  Product(this.nama, this.deskripsi);
}

class CartModel extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;
  int get totalItems => items.length;

  void add(Product product) {
  _items.add(product);
  notifyListeners();
  }

  void removeItem(Product product) {
    items.remove(product);
    notifyListeners();
  }
}