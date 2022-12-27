import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sahar_mob_app/pages/components/componentsCategory.dart';
import 'package:sahar_mob_app/screens/details/components/description.dart';

class Product {
  static const ID = 'id';
  static const Category = 'category';
  static const Name = 'name';
  static const Price = 'price';
  static const Brand = 'brand';
  static const Quantity = 'quantity';
  static const On_Sale = 'onSale';
  static const Description = 'description';
  static const Image = 'image';

  late String _id;
  late String _category;
  late String _name;
  late Double _price;
  late String _brand;
  late int _quantity;
  late bool _onSale;
  late String _description;
  late String _image;

////getters
  String get id => _id;
  String get category => _category;
  String get name => _name;
  Double get price => _price;
  String get brand => _brand;
  int get quntity => _quantity;
  bool get onSale => _onSale;
  String get description => _description;
  String get image => _image;

////named constructor

  Product.fromSnapshot(DocumentSnapshot snapshot) {
    Map data = snapshot.data as Map;
    _id = data[ID];
    _category = data[Category];
    _name = data[Name];
    _price = data[Price];
    _brand = data[Brand];
    _quantity = data[Quantity];
    _onSale = data[On_Sale];
    _description = data[Description];
    _image = data[Image];
  }
}
