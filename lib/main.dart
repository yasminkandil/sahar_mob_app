import 'package:flutter/material.dart';

import 'package:sahar_mob_app/pages/navbar.dart';

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
    );
  }
}
