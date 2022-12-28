import 'package:cloud_firestore/cloud_firestore.dart';

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
  ProductModel(
      {required this.capacity,
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

toJson()
{
  return{
     name: ["name"],
      description:["description"],
      price: ["price"],
      capacity: ["capacity"],
  };
}

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document)
      {final data= document.data();
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
      */);
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