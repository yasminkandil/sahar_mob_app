import 'package:flutter/material.dart';

import 'package:sahar_mob_app/pages/components/componentsCategory.dart';
import 'package:sahar_mob_app/product_powerbank.dart';
import 'package:sahar_mob_app/screens/details/components/description.dart';
import 'package:sahar_mob_app/screens/details/components/product_info.dart';
import 'package:sahar_mob_app/screens/details/components/product_title_with_image.dart';
import 'package:sahar_mob_app/screens/details/details_screen.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numofItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildButton(
            icon: Icons.remove,
            press: () {
              if (numofItems > 1) {
                setState(() {
                  numofItems--;
                });
              }
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15 / 2),
          child: Text(
            numofItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildButton(
            icon: Icons.add,
            press: () {
              setState(() {
                numofItems++;
              });
            })
      ],
    );
  }

  SizedBox buildButton({IconData? icon, required Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        onPressed: (() {
          press;
        }),
        child: Icon(icon),
      ),
    );
  }
}
