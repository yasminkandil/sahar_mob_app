import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sahar_mob_app/models/user_model.dart';
import 'package:sahar_mob_app/pages/view_product.dart';
import 'package:sahar_mob_app/read%20data/get_product_name.dart';


class UserAuth extends GetxController{
  static UserAuth get instance=> Get.find();
  final CollectionReference usercol =
      FirebaseFirestore.instance.collection("users");



final _db = FirebaseFirestore.instance;

Future <UserModel> getUserDetails(String email) async{
final snapshot = 
await _db.collection('users').where("email",isEqualTo:email )
.get();
final userData = snapshot.docs.map((e) => 
UserModel.fromSnapshot(e)).single;
return userData;
}

Future <List<UserModel>> allUsers() async{
final snapshot = 
await _db.collection('users').get();
final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
return userData;
}

Future<void> UpdateUsersData(UserModel users) async{
  await _db.collection('users').doc(users.email).
  update(users.toJson());


} 

}