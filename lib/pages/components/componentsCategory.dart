import 'package:flutter/material.dart';
import 'package:sahar_mob_app/constants.dart';

class Categorie extends StatefulWidget {
  const Categorie({super.key});

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<String> categories = [
    "PowerBanks",
    "Cables",
    "Covers",
    "HeadPhones",
    "EarPhones"
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) => GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(categories[index],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == index
                          ? kTextColor
                          : Color.fromARGB(72, 0, 0, 0))),
              Container(
                margin: EdgeInsets.only(top: 15 / 4),
                height: 2,
                width: 30,
                color:
                    selectedIndex == index ? Colors.black : Colors.transparent,
              )
            ],
          ),
        ),
      );
}
