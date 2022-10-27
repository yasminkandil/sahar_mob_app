import 'package:flutter/material.dart';

import 'package:sahar_mob_app/models/Cart.dart';
import 'package:sahar_mob_app/pages/checkout.dart';
//import 'package:sahar_mob_app/lib/pages/checkout.dart';
//import 'package:shop_app/lib/pages/checkout.dart';
import 'package:sahar_mob_app/pages/checkOutCard.dart';
import 'package:sahar_mob_app/pages/body.dart';

class Mycart extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${demoCarts.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
