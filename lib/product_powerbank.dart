// ignore_for_file: await_only_futures

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/ui/firebase_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/products_all.dart';

class Product {
  String? brand, category, descreption, image, name;
  int? price, quantity;

  Product({
    required this.brand,
    required this.category,
    required this.descreption,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class Getproducts {
  Future getname() async {
    final DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('products').doc().get();
    return documentSnapshot;
  }
}
////////////////////////////////////////////////////////////////////////////////////////////

// Databaseservice productt = Databaseservice();

// Productss pp = Productss(
//   salma: gettitle(),
// );

///////////////////////////////geters

gettitle() {
  DocumentReference docRef =
      FirebaseFirestore.instance.collection('products').doc();
  String prodtitle = "";

  docRef.get().then((DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() != null
        ? snapshot.data()! as Map<String, dynamic>
        : <String, dynamic>{};

    String prodtitle = data["name"];

    return prodtitle;
  });
}

getdescription() {
  DocumentReference docRef =
      FirebaseFirestore.instance.collection('products').doc();
  String proddescreption = "";

  docRef.get().then((DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() != null
        ? snapshot.data()! as Map<String, dynamic>
        : <String, dynamic>{};

    String proddescreption = "${data['description']}";

    return proddescreption;
  });
}

getprice() {
  DocumentReference docRef =
      FirebaseFirestore.instance.collection('products').doc();

  docRef.get().then((DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() != null
        ? snapshot.data()! as Map<String, dynamic>
        : <String, dynamic>{};

    String prodprice = data['price'].toString();

    return prodprice;
  });
}

getimage() {
  DocumentReference docRef =
      FirebaseFirestore.instance.collection('products').doc();

  docRef.get().then((DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() != null
        ? snapshot.data()! as Map<String, dynamic>
        : <String, dynamic>{};

    String prodimage = data['image'].toString();

    return prodimage;
  });
}

getcategory() {
  DocumentReference docRef =
      FirebaseFirestore.instance.collection('products').doc();

  docRef.get().then((DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() != null
        ? snapshot.data()! as Map<String, dynamic>
        : <String, dynamic>{};

    String prodcat = data['category'].toString();

    return prodcat;
  });
}

getquantity() {
  DocumentReference docRef =
      FirebaseFirestore.instance.collection('products').doc();

  docRef.get().then((DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() != null
        ? snapshot.data()! as Map<String, dynamic>
        : <String, dynamic>{};

    String prodimage = data['quantity'].toString();

    return prodimage;
  });
}

///////////////////////////////////////////////////////////////
///
Getproducts pp = Getproducts();
List<Product>? product = [
  Product(
      brand: "",
      name: "gettitle()",
      category: "getcategory()",
      descreption: "getdescription()",
      image: "getimage()",
      price: 0,
      quantity: 0)
];
