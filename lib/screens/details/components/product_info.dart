import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/models/product_model2.dart';

import 'package:sahar_mob_app/pages/components/componentsCategory.dart';
import 'package:sahar_mob_app/product_powerbank.dart';
import 'package:sahar_mob_app/screens/details/components/product_title_with_image.dart';
import 'package:sahar_mob_app/screens/details/details_screen.dart';

class productinfo extends StatelessWidget {
  ProductModel2 productModel2;

  productinfo(this.productModel2);

  @override
  Widget build(BuildContext context) {
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
                      text: "${productModel2.quantity}",
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
}
