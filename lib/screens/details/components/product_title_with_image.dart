import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:sahar_mob_app/pages/components/componentsCategory.dart';
import 'package:sahar_mob_app/product_powerbank.dart';
import 'package:sahar_mob_app/screens/details/details_screen.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.salma,
  }) : super(key: key);

  final String salma;

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${data["brand"]}",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "${data['name']}",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(text: "Price\n"),
                            TextSpan(
                                text: "${data['price']} LE",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                          ]),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Expanded(
                            child: Image.asset(
                          "${data['image']}",
                          fit: BoxFit.fitWidth,
                        ))
                      ],
                    )
                  ],
                ),
              ),
            );
          }
          return Text("Loading");
        }));
  }
}
