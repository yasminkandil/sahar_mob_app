import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/product_powerbank.dart';

class Categorie extends StatefulWidget {
  const Categorie({super.key});

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<String> prod = [];

  String? salma;
  Future getDocProd() async {
    await FirebaseFirestore.instance.collection('categories').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            prod.add(document.reference.id);
          }),
        );
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SizedBox(
            height: 30,
            child: FutureBuilder(
                future: getDocProd(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data = snapshot.data?.data() != null
                        ? snapshot.data!.data()! as Map<String, dynamic>
                        : <String, dynamic>{};
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: prod.length,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("${data['name']}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: selectedIndex == index
                                                ? Color.fromARGB(72, 0, 0, 0)
                                                : Color.fromARGB(72, 0, 0, 0))),
                                    Container(
                                      margin: EdgeInsets.only(top: 15 / 4),
                                      height: 2,
                                      width: 30,
                                      color: selectedIndex == index
                                          ? Colors.black
                                          : Colors.transparent,
                                    )
                                  ],
                                ),
                              ),
                            ));
                  }
                  return Text("Loading...");
                }))));
  }
}
