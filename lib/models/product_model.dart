import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String selectedValC = 'Black';
String selectedValQ = 'Original';
String selectedValCat = 'Headphones';
TextEditingController nameController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
TextEditingController aboutController = TextEditingController();
TextEditingController priceController = TextEditingController();
TextEditingController qualityController = TextEditingController();
TextEditingController quantityController = TextEditingController();
TextEditingController colorController = TextEditingController();
TextEditingController categController = TextEditingController();
TextEditingController nameeController = TextEditingController();
TextEditingController descriptionnController = TextEditingController();
TextEditingController abouttController = TextEditingController();
TextEditingController priceeController = TextEditingController();
TextEditingController quantityyController = TextEditingController();
var imageUrl;
var downloadUrl;
var imagee;
var greyimage =
    'https://www.google.com/search?q=profile+photo+&tbm=isch&ved=2ahUKEwis27rOz_76AhVFexoKHU2PBGoQ2-cCegQIABAA&oq=profile+photo+&gs_lcp=CgNpbWcQAzIECAAQQzIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDoGCAAQBxAeULwEWLwEYKoIaABwAHgAgAGZAYgBkwKSAQMwLjKYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=d4lZY-zDCsX2ac2ektAG&bih=657&biw=1366#imgrc=nfkyptoYx2OzJM';
late String Cvalue;

String getCValue() {
  return Cvalue;
}

late String Categvalue;

String getCategValue() {
  return Categvalue;
}

late String Qvalue;

String getQValue() {
  return Qvalue;
}

setImage(String imagee) {
  imagee = imagee;
}

getImage() {
  return imagee;
}

List Listcolors = ['Black', 'Blue'];
List ListCateg = [
  'Headphones',
  'PowerBank',
  'Speakers',
  'Chargers',
  'Cables',
  'Memory',
  'Maintanance'
];
List ListQuality = ['Original', 'HighCopy'];

Future addProduct(
    String name,
    String description,
    String brand,
    String quality,
    String color,
    String category,
    String price,
    String quantity,
    String prodimage) async {
  await FirebaseFirestore.instance.collection('products').doc().set({
    'name': name,
    'description': description,
    'brand': brand,
    'quality': quality,
    'color': color,
    'category': category,
    'price': int.parse(price),
    'quantity': int.parse(quantity),
    'image': prodimage,
  });
}

class ProductModel {
  //List<String> images;
  //List<String> like;
  //List<String> dislike;
  //List<String> favories;
  String name;
  String description;
  String price;
  String capacity;

  //String uid;
  // CarType type;
  //String id;
  ProductModel({
    required this.capacity,
    // required this.images,
    required this.name,
    required this.description,
    required this.price,
    // required this.type,
    //  required this.id,
    // required this.uid,
    // required   this.dislike,
    //required   this.like,
    //required   this.favories
  });

  toJson() {
    return {
      name: ["name"],
      description: ["description"],
      price: ["price"],
      capacity: ["capacity"],
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return ProductModel(
      //  id:document.id,
      name: data!["name"],
      description: data["description"],
      price: data!["price"],
      capacity: data["capacity"],
      /*  uid: data["uid"],
      images: data["images"].map<String>((i) => i as String).toList(),
      like: data["like"] == null
          ? []
          : data["like"].map<String>((i) => i as String).toList(),
      favories: data["favories"] == null
          ? []
          : data["favories"].map<String>((i) => i as String).toList(),
      dislike: data["dislike"] == null
          ? []
          : data["dislike"].map<String>((i) => i as String).toList()
    //  type: map["type"] == "car" ? CarType.car : CarType.moto
      */
    );
  }

  Map<String, dynamic> toMap() {
    return {
      //  "type": type == CarType.car ? "car" : "moto",
      // "images": images,
      "name": name,
      "description": description,
      "capacity": capacity,
      "prix": price,
      // "uid": uid,
      //"like": like,
      // "dislike": dislike,
      // "favories": favories
    };
  }
}

//enum CarType { car, moto }