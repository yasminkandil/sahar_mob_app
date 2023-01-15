import 'package:flutter/material.dart';
import 'package:sahar_mob_app/controllers/home_controller.dart';
import 'package:sahar_mob_app/pages/category.dart';
import 'package:sahar_mob_app/pages/view_account.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:get/get.dart';
import 'navbar.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navbarItem = [
      BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: const Icon(Icons.person), label: 'Profile'),
      BottomNavigationBarItem(icon: const Icon(Icons.shopping_bag), label: 'Cart'),
      BottomNavigationBarItem(icon: const Icon(Icons.category), label: 'Categories'),


    ];
    var navBody = [
      Container(child: Navigation_bar()),
      Container(
        color: Colors.white10,
        child: ViewAccountPage(),
      ),
      Container(color: Colors.white30, child: CategoryPage(),),
            Container(color: Colors.lightBlue, child: CategoryPage(),),

    ];
    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => Expanded(
                child: navBody.elementAt(controller.currentNavIndex.value)),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        (() => BottomNavigationBar(
            currentIndex: controller.currentNavIndex.value,
            selectedItemColor: orangeColors,
            onTap: (value) {
              controller.currentNavIndex.value = value;
            },
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.grey,
            items: navbarItem)),
      ),
    );
  }
}
