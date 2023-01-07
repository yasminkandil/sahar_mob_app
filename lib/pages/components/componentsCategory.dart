import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/contact_us.dart';
import 'package:sahar_mob_app/pages/products_all.dart';
import 'package:sahar_mob_app/product_powerbank.dart';

class Categorie extends StatefulWidget {
  const Categorie({super.key});

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<String> prod = [];
  Future getDocProd() async {
    await FirebaseFirestore.instance.collection('categories').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            prod.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDocProd(),
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SizedBox(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: prod.length,
                itemBuilder: (context, index) => buildCategory(
                  salma: prod[index],
                ),
              ),
            ),
          );
        });
  }
}

class buildCategory extends StatelessWidget {
  const buildCategory({super.key, required this.salma});
  final String salma;
  @override
  Widget build(BuildContext context) {
    List<String> prod = [];
    Future getDocProd() async {
      await FirebaseFirestore.instance.collection('categories').get().then(
            (snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              prod.add(document.reference.id);
            }),
          );
    }

    int selectedIndex = 0;
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('categories')
            .doc(salma)
            .get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data?.data() != null
                ? snapshot.data!.data()! as Map<String, dynamic>
                : <String, dynamic>{};
            return GestureDetector(
              onTap: () {
                if (data['name'] == "Powerbank") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Products(),
                    ),
                  );
                } else if (data['name'] == 'Cabels') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactUs(),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${data['name']}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedIndex == data['name']
                                ? Color.fromARGB(72, 0, 0, 0)
                                : Color.fromARGB(72, 0, 0, 0))),
                    Container(
                      margin: EdgeInsets.only(top: 15 / 4),
                      height: 2,
                      width: 30,
                      color: selectedIndex == data['name']
                          ? Colors.black
                          : Colors.transparent,
                    )
                  ],
                ),
              ),
            );
          }
          return Text("Loading...");
        }));
  }
}
