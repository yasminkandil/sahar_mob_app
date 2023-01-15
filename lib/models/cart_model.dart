// class Cart {

//   late final int? id;
//   final String? productId;
//   final String? productName;
//   final int? initialPrice;
//   final int? productPrice;
//   final int? quantity;
//   final String? unitTag;
//   final String? image;

//   Cart({
//     required this.id ,
//     required this.productId,
//     required this.productName
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

var imagee;
setImage(String imagee) {
  imagee = imagee;
}

getImage() {
  return imagee;
}

Future addCart(
    String name,
    String description,
    String brand,
    String quality,
    String color,
    String category,
    String price,
    String quantity,
    String prodimage) async {
  await FirebaseFirestore.instance.collection('cart').doc().set(
    {
      'name': name,
      'description': description,
      'brand': brand,
      'quality': quality,
      'color': color,
      'category': category,
      'price': int.parse(price),
      'quantity': int.parse(quantity),
      'image': prodimage,
    },
  );

  print('added to cart');
}

class Cartmodel {
  String name;
  String description;
  String price;
  String capacity;

  Cartmodel({
    required this.capacity,
    // required this.images,
    required this.name,
    required this.description,
    required this.price,
    // required this.type,
  });

  toJson() {
    return {
      name: ["name"],
      description: ["description"],
      price: ["price"],
      capacity: ["capacity"],
    };
  }

  Future getcart() async {
    String userName;
    final DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('cart').doc().get();
    userName = documentSnapshot.get('productName');
    return userName;
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "description": description,
      "capacity": capacity,
      "prix": price,
    };
  }
}

class Data {
  Future<Object> getUsers() async {
    final DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('cart').doc().get();
    return documentSnapshot;
  }
}
