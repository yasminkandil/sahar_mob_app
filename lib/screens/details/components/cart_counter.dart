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
        IconButton(
            onPressed: (() {
              if (numofItems > 1) {
                setState(() {
                  numofItems--;
                });
              }
            }),
            icon: Icon(Icons.remove)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15 / 2),
          child: Text(
            numofItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        IconButton(
            onPressed: (() {
              setState(() {
                numofItems++;
              });
            }),
            icon: Icon(Icons.add)),
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
