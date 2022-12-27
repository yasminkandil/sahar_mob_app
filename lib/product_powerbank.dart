// ignore_for_file: await_only_futures

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/ui/firebase_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/products_all.dart';

class Product {
  String? brand, category, descreption, image, name;
  int? price, quantity;

  Product({
    required this.brand,
    required this.category,
    required this.descreption,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

// class Product {
//   final String? id;
//   final String title;
//   final String price;
//   final String description;
//   final String image;
//   final String capacity;

//   Product({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.image,
//     required this.capacity,
//   });

//   Product.fromSnapshot(DataSnapshot  snapshot)

//       : id = snapshot.key,
//         title = snapshot.value['title'],
//         price = snapshot.value!["price"],
//         description = snapshot.value["descreption"],
//         image = snapshot.value!["image"],
//         capacity = snapshot.value["capaciy"];

//   toJson() {
//     return {
//       "title": title,
//       "price": price,
//       "descreption": description,
//       "image":image,
//       "capacity":capacity
//     };
//   }
// }

// class DatabaseService {

//   static Future<List<Products>?> getNeeds() async {
//     Query productss = await FirebaseDatabase.instance
//       // ignore: deprecated_member_use
//       .reference()
//       .child("products")
//       .orderByKey();

//     print(productss); // to debug and see if data is returned

//     List<Products>? product;

//     Map<dynamic, dynamic> values = productss.data.value;
//     values.forEach((key, values) {
//       product?.add(values);
//     });

//     return product;
//   }
// }

// class Productt extends StatelessWidget {
//   String? image, title, description, capacity;
//   int? price, id;
//   Color? color;

//   Productt(
//       {required this.id,
//       required this.title,
//       required this.price,
//       required this.description,
//       required this.image,
//       required this.capacity,
//       required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<DocumentSnapshot>(
//         future: FirebaseFirestore.instance.collection('products').doc(title).get(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Text("Loading..");
//           }
//           return Text(
//             snapshot.requireData['title'],

//             style: TextStyle(fontWeight: FontWeight.bold),
//           );

//         });
//   }
// }

class Databaseservice {
  late final CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  Stream<QuerySnapshot> get product {
    return products.snapshots();
  }

  // getcount(products) {
  //   return products.count();
  // }

  Future gettitle() async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('products').doc("name");
    String prodtitle = "";

    docRef.get().then((DocumentSnapshot snapshot) {
      Map<String, dynamic> data = snapshot.data() != null
          ? snapshot.data()! as Map<String, dynamic>
          : <String, dynamic>{};

      var prodtitle = "${data['name']}";

      return prodtitle;
    });
  }

  Future<String> getimage() async {
    DocumentReference documentReference = products.doc();
    String prodimage = "";
    await documentReference.get().then((snapshot) {
      prodimage = snapshot['image'].toString();
    });
    return prodimage;
  }

  getdescription() async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('products').doc('descreption');
    String proddescreption = "";

    docRef.get().then((DocumentSnapshot snapshot) {
      Map<String, dynamic> data = snapshot.data() != null
          ? snapshot.data()! as Map<String, dynamic>
          : <String, dynamic>{};

      String proddescreption = "${data['descreption']}";
    });
    return proddescreption;
  }

  getprice() async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('products').doc('price');
    String prodprice = "";
    docRef.get().then((DocumentSnapshot snapshot) {
      var prodprice = snapshot.toString();
    });
    return prodprice;
  }
}
////////////////////////////////////////////////////////////////////////////////////////////

// Databaseservice productt = Databaseservice();

// Productss pp = Productss(
//   salma: gettitle(),
// );

///////////////////////////////geters

gettitle() {
  DocumentReference docRef =
      FirebaseFirestore.instance.collection('products').doc();
  String prodtitle = "";

  docRef.get().then((DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() != null
        ? snapshot.data()! as Map<String, dynamic>
        : <String, dynamic>{};

    String prodtitle = data["name"];

    return prodtitle;
  });
}

getdescription() {
  DocumentReference docRef =
      FirebaseFirestore.instance.collection('products').doc();
  String proddescreption = "";

  docRef.get().then((DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() != null
        ? snapshot.data()! as Map<String, dynamic>
        : <String, dynamic>{};

    String proddescreption = "${data['description']}";

    return proddescreption;
  });
}

getprice() {
  DocumentReference docRef =
      FirebaseFirestore.instance.collection('products').doc();

  docRef.get().then((DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() != null
        ? snapshot.data()! as Map<String, dynamic>
        : <String, dynamic>{};

    String prodprice = data['price'].toString();

    return prodprice;
  });
}

getimage() {
  DocumentReference docRef =
      FirebaseFirestore.instance.collection('products').doc();

  docRef.get().then((DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() != null
        ? snapshot.data()! as Map<String, dynamic>
        : <String, dynamic>{};

    String prodimage = data['image'].toString();

    return prodimage;
  });
}

getcategory() {
  DocumentReference docRef =
      FirebaseFirestore.instance.collection('products').doc();

  docRef.get().then((DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() != null
        ? snapshot.data()! as Map<String, dynamic>
        : <String, dynamic>{};

    String prodcat = data['category'].toString();

    return prodcat;
  });
}

getquantity() {
  DocumentReference docRef =
      FirebaseFirestore.instance.collection('products').doc();

  docRef.get().then((DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() != null
        ? snapshot.data()! as Map<String, dynamic>
        : <String, dynamic>{};

    String prodimage = data['quantity'].toString();

    return prodimage;
  });
}

///////////////////////////////////////////////////////////////
List<Product>? product = [
  Product(
      brand: gettitle(),
      name: gettitle(),
      category: getcategory(),
      descreption: getdescription(),
      image: getimage(),
      price: getprice(),
      quantity: getquantity())
];

// class Productss extends StatelessWidget {
//   var salma;
//   Productss({required this.salma});
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference products =
//         FirebaseFirestore.instance.collection('products');
//     final pro = FirebaseFirestore.instance.collection('products');

//     return FutureBuilder<DocumentSnapshot>(
//       future: products.doc(salma).get(),
//       builder: ((context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data = snapshot.data?.data() != null
//               ? snapshot.data!.data()! as Map<String, dynamic>
//               : <String, dynamic>{};
//           return data['name'];
//         } else {
//           return Text("LOadin...");
//         }
//       }),
//     );
//   }
// }

// List<Productt> product = [
//   Productt(
//       id:1,
//       title: $title,
//       price: 234,
//       description:
//           'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
//       image: "assets/powerbank2.png",
//       capacity: "10000 mAh",
//       color: Color.fromARGB(255, 121, 127, 127)),
//   Productt(
//       id: 2,
//       title: "ENergizer Power Bank",
//       price: 234,
//       description:
//           'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
//       image: "assets/pb1.png",
//       capacity: "10000 mAh",
//       color: Color.fromARGB(255, 121, 127, 127)),
//   Productt(
//       id: 3,
//       title: "Xiaomi Power Bank",
//       price: 250,
//       description:
//           'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
//       image: "assets/powerbank.png",
//       capacity: "3000 mAh",
//       color: Color.fromARGB(255, 121, 127, 127)),
//   Productt(
//       id: 4,
//       title: "Anker Power Bank",
//       price: 300,
//       description:
//           'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
//       image: "assets/pb2.png",
//       capacity: "10000 mAh",
//       color: Color.fromARGB(255, 121, 127, 127)),
//   Productt(
//       id: 5,
//       title: "Xiaomi Redmi Power Bank",
//       price: 270,
//       description:
//           'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
//       image: "assets/pb3.png",
//       capacity: "5000 mAh",
//       color: Color.fromARGB(255, 121, 127, 127)),
//   Productt(
//     id: 6,
//     title: "joyroom Power Bank",
//     price: 234,
//     description:
//         'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
//     image: "assets/pb4.png",
//     capacity: "7000 mAh",
//     color: Color.fromARGB(255, 121, 127, 127),
//   ),
// ];
// List<Product> products2 = [
//   Product(
//       id: 1,
//       title: "cable",
//       price: 234,
//       description:
//           'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
//       image: "assets/powerbank2.png",
//       capacity: "10000 mAh",
//       color: Color.fromARGB(255, 121, 127, 127)),
//   Product(
//       id: 2,
//       title: "cable",
//       price: 234,
//       description:
//           'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
//       image: "assets/pb1.png",
//       capacity: "10000 mAh",
//       color: Color.fromARGB(255, 121, 127, 127)),
//   Product(
//       id: 3,
//       title: "cable",
//       price: 250,
//       description:
//           'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
//       image: "assets/powerbank.png",
//       capacity: "3000 mAh",
//       color: Color.fromARGB(255, 121, 127, 127)),
//   Product(
//       id: 4,
//       title: "Anker Power Bank",
//       price: 300,
//       description:
//           'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
//       image: "assets/pb2.png",
//       capacity: "10000 mAh",
//       color: Color.fromARGB(255, 121, 127, 127)),
//   Product(
//       id: 5,
//       title: "Xiaomi Redmi Power Bank",
//       price: 270,
//       description:
//           'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
//       image: "assets/pb3.png",
//       capacity: "5000 mAh",
//       color: Color.fromARGB(255, 121, 127, 127)),
//   Product(
//     id: 6,
//     title: "joyroom Power Bank",
//     price: 234,
//     description:
//         'A Power Bank is a portable charger designed to recharge your electronic devices when youre on the move. Ranging in size from slim, pocket-sized devices up to larger, higher-capacity Power Banks , they can be used to charge smartphones, tablets etc.',
//     image: "assets/pb4.png",
//     capacity: "7000 mAh",
//     color: Color.fromARGB(255, 121, 127, 127),
//   ),
// ];

// List<List<Product>> all = [product, products2];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
