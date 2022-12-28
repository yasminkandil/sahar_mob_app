import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sahar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SafeArea(child: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Navigation_bar();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
