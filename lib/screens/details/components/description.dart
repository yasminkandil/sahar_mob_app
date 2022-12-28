import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:sahar_mob_app/pages/components/componentsCategory.dart';
import 'package:sahar_mob_app/product_powerbank.dart';
import 'package:sahar_mob_app/screens/details/components/product_info.dart';
import 'package:sahar_mob_app/screens/details/components/product_title_with_image.dart';
import 'package:sahar_mob_app/screens/details/details_screen.dart';

class description extends StatelessWidget {
  const description({
    Key? key,
    required this.salma,
  }) : super(key: key);

  final String salma;

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    final pro = FirebaseFirestore.instance.collection('products');

    return FutureBuilder(
        future:
            FirebaseFirestore.instance.collection('products').doc(salma).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data?.data() != null
                ? snapshot.data!.data()! as Map<String, dynamic>
                : <String, dynamic>{};
            child:
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "${data['description']}",
                style: TextStyle(height: 1.5),
              ),
            );
          }
          return Text("Loading...");
        }));
  }
}
