import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/contact_us.dart';
import 'package:sahar_mob_app/pages/admin.dart';
import 'package:sahar_mob_app/pages/edit_account.dart';
import 'package:sahar_mob_app/pages/login_page.dart';
import 'package:sahar_mob_app/pages/navbar.dart';
import 'package:sahar_mob_app/pages/regi_page.dart';
import 'package:sahar_mob_app/pages/add_product.dart';
import 'package:sahar_mob_app/pages/category.dart';
import 'package:sahar_mob_app/pages/order_history.dart';
<<<<<<< HEAD
import 'package:sahar_mob_app/pages/products_powerbank.dart';
=======
import 'package:sahar_mob_app/pages/view_account.dart';
>>>>>>> 0b75c52a640cef9297ffa7698e7cb24f29ef439b
import 'package:sahar_mob_app/style/colors.dart';
import 'package:sahar_mob_app/style/style.dart';

import 'package:sahar_mob_app/models/ProductModel.dart';
import 'package:sahar_mob_app/screens/checkoutscreen.dart';
import 'package:sahar_mob_app/screens/Productscreen.dart';
import 'package:flutter/material.dart';

import 'pages/regi_page.dart';
import 'pages/login_page.dart';
import 'pages/add_product.dart';
import 'pages/edit_product.dart';
import 'pages/add_category.dart';
import 'pages/add_quality.dart';
import 'pages/add_offer.dart';
import 'pages/admin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Design',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
<<<<<<< HEAD
      home: PowerBank(),
=======
      //home: SafeArea(child: LoginPage()),
      home: SafeArea(child: Admin()),
      // home: Shop(),
      // home: AddProductPage(),
>>>>>>> 0b75c52a640cef9297ffa7698e7cb24f29ef439b
      //home: CategoryPage(),
<<<<<<< HEAD
      home: SafeArea(child: Navigation_bar()),
=======
      //home: SafeArea(child: ViewAccountPage()),
    );
  }
}

/*class CartApp extends StatefulWidget {
  @override
  _CartAppState createState() => _CartAppState();
}

class _CartAppState extends State<CartApp> {
  List<ProductModel> cart = [];
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart App"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Products",
              ),
              Tab(
                text: "Checkout",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductScreen((selectedProduct) {
              setState(() {
                cart.add(selectedProduct); //update
                sum = 0;
                cart.forEach((item) {
                  sum = sum + item.price;
                });
              });
            }),
            CheckoutScreen(cart, sum),
          ],
        ),
      ),
>>>>>>> 77dd889f5a6f84e5bc74d30b62609993a27a0fbd
    );
  }
}*/
