import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String fnameerrormssg = "Enter First Name";
String lnameerrormssg = "Enter Last Name";
String emailerrormssg = "Enter Email Correctly";
String addrerrormssg = "Enter Address";
String mobileerrormssg = "Enter Mobile Number Correctly";
String eregexp =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
String aregexp = r'^[a-z A-Z]+$';
String mregexp = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$';
var imagee;
setImage(String imagee) {
  imagee = imagee;
}

getImage() {
  return imagee;
}

Future addUserDetails(
    String firstname,
    String lastname,
    String userEmail,
    String useraddress,
    String userPhoneNumber,
    String userImage,
    String id) async {
  await FirebaseFirestore.instance.collection('users').doc(id).set(
    {
      'firstname': firstname,
      'lastname': lastname,
      'email': userEmail,
      'mobile': userPhoneNumber,
      'address': useraddress,
      'image': userImage,
      'id': id,
    },
  );

  print('NEW USER REGISTERED WITH ID:');
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController fisrtController = TextEditingController();
TextEditingController lastController = TextEditingController();
TextEditingController confirmPassController = TextEditingController();
TextEditingController mobileController = TextEditingController();
TextEditingController addrController = TextEditingController();

class UserModel {
  String firstname;
  String lastname;
  String email;
  String address;
  String mobile;
  String image;

  UserModel({
    required this.firstname,
    // required this.images,
    required this.lastname,
    required this.email,
    required this.address,
    required this.mobile,
    required this.image,
  });
}

class UsersData {
  Future<Object> getUsers() async {
    final DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc().get();
    return documentSnapshot;
  }
}
