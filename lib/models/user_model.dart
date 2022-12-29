import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  //List<String> images;
  //List<String> like;
  //List<String> dislike;
  //List<String> favories;
  String firstname;
  String lastname;
  String email;
  String address;
  //String uid;
 // CarType type;
  //String id;
  UserModel(
      {required this.firstname,
     // required this.images,
      required this.lastname,
      required this.email,
     required this.address,
    // required this.type,
   //  required this.id,
    // required this.uid,
  // required   this.dislike,
   //required   this.like,
   //required   this.favories
   });

toJson()
{
  return{
     firstname: ["firstname"],
      lastname:["lastname"],
      email: ["email"],
      address: ["address"],
  };
}
Future getUserName() async {
    String userName;
    final DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.
        collection('users').doc().get();
    userName = documentSnapshot.get('firstname');
    return userName;
  }
  factory UserModel.fromSnapshot
  (DocumentSnapshot<Map<String, dynamic>> document)
      {final data= document.data();
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
      */);
      }

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