// import 'dart:async';
// import 'dart:core';
// import 'dart:developer';
// import 'dart:io';
// import 'package:sahar_mob_app/models/product_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path/path.dart' as Path;
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';


// import '../services.dart';



// class ProductsController extends GetxController {
 
//     static ProductsController get instance=> Get.find();
// final _prodRep=Get.put(DBServices());


// getProds() {
// final name =FirebaseFirestore.instance.collection('products').id;
// if(name != null){
// return _prodRep.getProductDetails(name);
// }else {
// Get.snackbar("Error", "Login to continue");
// }}
// /// Fetch List of user records.
// Future<List <ProductModel>> getAllProds() async => await _prodRep.allProducts();

// updateRecord(ProductModel prods) async {
// await _prodRep.UpdateProductData(prods);

// }
// }