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
import 'package:sahar_mob_app/pages/products_all.dart';
import 'package:sahar_mob_app/pages/view_account.dart';
import 'package:sahar_mob_app/style/colors.dart';
import 'package:sahar_mob_app/style/style.dart';
import 'package:sahar_mob_app/pages/cart.dart';

import 'package:sahar_mob_app/models/ProductModel.dart';
import 'package:sahar_mob_app/pages/checkout.dart';

import 'pages/regi_page.dart';
import 'pages/login_page.dart';
import 'pages/add_product.dart';
import 'pages/edit_product.dart';
import 'pages/add_category.dart';
import 'pages/add_quality.dart';
import 'pages/add_offer.dart';
import 'pages/admin.dart';
//import 'pages/cart_view.dart';
//import 'pages/calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'cart page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: SafeArea(child: Navigation_bar()),

      // home: SafeArea(child: RegisterPage()),
      //home: SafeArea(child: Navigation_bar()),

      // home: PowerBank(),
      //home: SafeArea(child: LoginPage()),
      // home: SafeArea(child: Admin()),
      // home: Shop(),
      // home: AddProductPage(),
      //home: CategoryPage(),
      //home: SafeArea(child: RegisterPage()),
      //home: SafeArea(child: ViewAccountPage()),
    );
  }
}
