import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sahar_mob_app/product_powerbank.dart';
import 'package:sahar_mob_app/screens/details/components/body.dart';

class DetailScreen extends StatelessWidget {
  final String salma;
  const DetailScreen({super.key, required this.salma});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: buildAppBar(context),
      body: Body(
        salma: salma,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.add_shopping_cart_outlined,
          ),
          onPressed: () {},
        ),
        SizedBox(
          width: 2,
        )
      ],
    );
  }
}
