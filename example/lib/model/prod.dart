import 'package:flutter/material.dart';

class Product {
  String id;
  String name;
  int quantity;
  DateTime dateAddedToTheStock;
  String image = 'assets/pic.png';

  Product(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.dateAddedToTheStock});
}
