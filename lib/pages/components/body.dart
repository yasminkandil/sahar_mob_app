import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:sahar_mob_app/pages/components/componentsCategory.dart';

import 'package:sahar_mob_app/pages/components/item_card.dart';
import 'package:sahar_mob_app/products.dart';
import 'package:sahar_mob_app/screens/details/details_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.8),
          child: Text("SHOP NOW!",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold)),
        ),
        Categorie(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.75),
              itemBuilder: (context, index) => Itemcard(
                product: products[index],
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(product: products[index]))),
              ),
            ),
          ),
        )
      ],
    );
  }
}
