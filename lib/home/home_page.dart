import 'package:flutter/material.dart';
import 'package:sahar_mob_app/controllers/home_controller.dart';
import 'package:sahar_mob_app/home/offerhomefile.dart';
import 'package:sahar_mob_app/pages/category.dart';
import 'package:sahar_mob_app/pages/components/componentsCategory.dart';
import 'package:sahar_mob_app/pages/gallary.dart';
import 'package:sahar_mob_app/pages/view_account.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:get/get.dart';
import '../pages/cart.dart';
import '../pages/products_all.dart';
import 'navbar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navbarItem = [
      BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: const Icon(Icons.photo), label: 'Gallery'),
      BottomNavigationBarItem(icon: const Icon(Icons.shop), label: 'Shop'),
    ];
    var navBody = [
      Container(child: Navigation_bar()),
      Container(
        child: gallery(),
      ),
      Container(
        child: CategoryPage(),
      ),
      Container(
        child: Products(cat: 'Cables'),
      ),
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
