import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:sahar_mob_app/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sahar_mob_app/pages/view_product.dart';
import 'package:sahar_mob_app/read%20data/get_product_name.dart';


class DBServices extends GetxController{
  static DBServices get instance=> Get.find();
  final CollectionReference usercol =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference carouselcol =
      FirebaseFirestore.instance.collection("carousel");
  final CollectionReference vehiculecol =
      FirebaseFirestore.instance.collection("products");
  final CollectionReference commentcol =
      FirebaseFirestore.instance.collection("commentaires");
final _db = FirebaseFirestore.instance;

Future <ProductModel> getProductDetails(String name) async{
final snapshot = 
await _db.collection('products').where("Name",isEqualTo:name ).get();
final prodData = snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).single;
return prodData;
}

Future <List<ProductModel>> allProducts() async{
final snapshot = 
await _db.collection('products').get();
final prodData = snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
return prodData;
}

Future<void> UpdateProductData(ProductModel prods) async{
  await _db.collection('products').doc(prods.name).update(prods.toJson());


} 

}