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
      'mobile': int.parse(userPhoneNumber),
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
  //List<String> images;
  //List<String> like;
  //List<String> dislike;
  //List<String> favories;
  String firstname;
  String lastname;
  String email;
  String address;
  String mobile;
  String image;
  //String uid;
  // CarType type;
  //String id;
  UserModel({
    required this.firstname,
    // required this.images,
    required this.lastname,
    required this.email,
    required this.address,
    required this.mobile,
    required this.image,
    // required this.type,
    //  required this.id,
    // required this.uid,
    // required   this.dislike,
    //required   this.like,
    //required   this.favories
  });

  Future getUserName() async {
    String userName;
    final DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc().get();
    userName = documentSnapshot.get('firstname');
    return userName;
  }

  /*factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return UserModel(
      //  id:document.id,
      firstname: data!["firstname"],
      lastname: data["lastname"],
      email: data!["email"],
      address: data["address"],
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
  }*/

  Map<String, dynamic> toMap() {
    return {
      //  "type": type == CarType.car ? "car" : "moto",
      // "images": images,
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "address": address,
      // "uid": uid,
      //"like": like,
      // "dislike": dislike,
      // "favories": favories
    };
  }
}

//enum CarType { car, moto }
class UsersData {
  Future<Object> getUsers() async {
    final DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc().get();
    return documentSnapshot;
  }
}
