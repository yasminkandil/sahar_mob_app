import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:sahar_mob_app/pages/components/componentsCategory.dart';
import 'package:sahar_mob_app/product_powerbank.dart';
import 'package:sahar_mob_app/screens/details/components/product_title_with_image.dart';
import 'package:sahar_mob_app/screens/details/details_screen.dart';

class productinfo extends StatelessWidget {
  const productinfo({
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

            return Row(
              children: <Widget>[
                Column(
                  children: <Widget>[],
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(color: Color.fromARGB(225, 0, 0, 0)),
                        children: [
                          TextSpan(text: "Capacity\n"),
                          TextSpan(
                              text: "${data['quantity']}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(fontWeight: FontWeight.bold))
                        ]),
                  ),
                ),
              ],
            );
          }
          return Text("Loading..");
        }));
  }
}
