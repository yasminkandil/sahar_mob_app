import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';
import 'package:sahar_mob_app/home/home_page.dart';

import '../utils/color.dart';

class CartItem extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int counter = 1;

  void incrementCounter() {
    setState(() {
      if (counter == 99) {
        return null;
      }
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter == 0) {
        return null;
      }
      counter--;
    });
  }

  void total() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My cart'),
        backgroundColor: GreyColors,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: orangeColors,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return MyHomePage();
              }),
            );
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 32.0),
                Text("Your cart is empty!"),
                SizedBox(height: 8.0),
                MaterialButton(
                  height: 60.0,
                  minWidth: double.infinity,
                  color: GreyColors,
                  onPressed: () {},
                  child: Text("Proceed to Checkout",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: orangeColors,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
