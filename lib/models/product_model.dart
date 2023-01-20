import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String errormssg = "You can't leave this field empty";
String aregexp = r'^[a-z A-Z]+$';

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

var imageUrl;
var downloadUrl;
var imagee;
var greyimage =
    'https://www.google.com/search?q=profile+photo+&tbm=isch&ved=2ahUKEwis27rOz_76AhVFexoKHU2PBGoQ2-cCegQIABAA&oq=profile+photo+&gs_lcp=CgNpbWcQAzIECAAQQzIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDoGCAAQBxAeULwEWLwEYKoIaABwAHgAgAGZAYgBkwKSAQMwLjKYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=d4lZY-zDCsX2ac2ektAG&bih=657&biw=1366#imgrc=nfkyptoYx2OzJM';
late String Cvalue;
var imageUrl2;
var downloadUrl2;
var imagee2;
var greyimage2 =
    'https://www.google.com/search?q=profile+photo+&tbm=isch&ved=2ahUKEwis27rOz_76AhVFexoKHU2PBGoQ2-cCegQIABAA&oq=profile+photo+&gs_lcp=CgNpbWcQAzIECAAQQzIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDoGCAAQBxAeULwEWLwEYKoIaABwAHgAgAGZAYgBkwKSAQMwLjKYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=d4lZY-zDCsX2ac2ektAG&bih=657&biw=1366#imgrc=nfkyptoYx2OzJM';
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

setImage2(String imagee2) {
  imagee2 = imagee2;
}

getImage2() {
  return imagee2;
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
    String prodimage,
    String date,
    String img2) async {
  await FirebaseFirestore.instance.collection('products').doc().set({
    'name': name,
    'description': description,
    'brand': brand,
    'quality': quality,
    'color': color,
    'category': category,
    'price': price,
    'quantity': quantity,
    'image': prodimage,
    'Date': date,
    'image2': img2,
  });
}

class ProductModel {
  String name;
  String description;
  String price;
  String capacity;

  ProductModel({
    required this.capacity,
    required this.name,
    required this.description,
    required this.price,
  });
}
