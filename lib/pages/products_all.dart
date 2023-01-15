import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahar_mob_app/pages/my_drawer_header.dart';
import 'package:sahar_mob_app/pages/navbar.dart';

import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/pages/components/body.dart';

import '../widgets/app_bar.dart';

class Products extends StatelessWidget {
  Products({super.key, required this.cat});
  String cat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Shop"),
      body: Body(
        cat: cat,
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
            child: Container(
          child: Column(children: [
            // Malhashh lazmaa walla ehhh!!!!!!!!
            MyHeaderDrawer(),
            HomeNavbar().MyDrawerList()
          ]),
        )),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Shop"),
      backgroundColor: orangeColors,
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
