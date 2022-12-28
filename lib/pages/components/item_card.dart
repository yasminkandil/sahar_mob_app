import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:sahar_mob_app/pages/components/componentsCategory.dart';
import 'package:sahar_mob_app/product_powerbank.dart';
import 'package:sahar_mob_app/screens/details/details_screen.dart';

class Itemcard extends StatelessWidget {
  final Product product;
  final Function press;
  final String salma;
  const Itemcard({
    required this.salma,
    required this.product,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    final pro = FirebaseFirestore.instance.collection('products');

    return FutureBuilder<DocumentSnapshot>(
        future:
            FirebaseFirestore.instance.collection('products').doc(salma).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data?.data() != null
                ? snapshot.data!.data()! as Map<String, dynamic>
                : <String, dynamic>{};
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(
                    salma: salma,
                  );
                }));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(35),
                      height: 180,
                      width: 160,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(16)),
                      //child: Image.asset(product.image.toString()),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10 / 4),
                      child: Text("${data['name']}")),
                  Text(
                    "${data['price']}" + "LE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            );
          }
          return Text('loading..');
        }));
  }
}
