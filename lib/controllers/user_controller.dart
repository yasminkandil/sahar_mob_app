import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahar_mob_app/models/user_model.dart';
import 'package:sahar_mob_app/pages/login_page.dart';
import '../user_auth.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
 
  final _userRep = Get.put(UserAuth());
  FirebaseAuth auth = FirebaseAuth.instance;

  getUsers() async {
final DocumentSnapshot documentSnapshot =
        await  FirebaseFirestore.instance
                    .collection('users')
                    .doc('3jHUNfTA0RAHYLmKVCUb').get();   
         if (documentSnapshot != null) {
      return _userRep.getUserDetails
      (documentSnapshot.get('users'));
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  Future getUserName() async {
    String userName;
    final DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.
        collection('users').doc().get();
    userName = documentSnapshot.get('email');
    return userName;
  }

  /// Fetch List of user records.
  Future<List<UserModel>> getAllUsers() async => await _userRep.allUsers();
  updateRecord(UserModel user) async {
    await _userRep.UpdateUsersData(user);
  }
}
