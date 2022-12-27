import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:sahar_mob_app/pages/components/componentsCategory.dart';

import 'package:sahar_mob_app/pages/components/item_card.dart';
import 'package:sahar_mob_app/product_powerbank.dart';
import 'package:sahar_mob_app/screens/details/details_screen.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Categorie(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GridView.builder(
              itemCount: product!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.75),
              itemBuilder: (context, index) => Itemcard(
                product: product![index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(product: product![index]))),
              ),
            ),
          ),
        )
      ],
    );
  }
}
