import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sahar_mob_app/utils/color.dart';

import 'navbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) { 
    var navbarItem=[
     BottomNavigationBarItem(
      icon: const Icon(Icons.home),
      label:'home'),
   BottomNavigationBarItem(
      icon: const Icon(Icons.person),
      label:'Profile'),
    // BottomNavigationBarItem(icon: Icons.home, label:'home'),
    ];
    return Scaffold(
body: Container(
child: Navigation_bar(),

),
bottomNavigationBar: BottomNavigationBar(
  selectedItemColor: orangeColors ,
  selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),


  type: BottomNavigationBarType.fixed,
  backgroundColor: Colors.grey,
  items: navbarItem),

    );
  }
}