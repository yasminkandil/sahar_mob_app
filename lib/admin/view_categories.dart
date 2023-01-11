import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/admin/add_category.dart';
import 'package:sahar_mob_app/read%20data/get_categories.dart';
import 'package:sahar_mob_app/utils/color.dart';

import '../widgets/app_bar.dart';

class ViewCategoriesPage extends StatefulWidget {
  const ViewCategoriesPage({super.key});

  @override
  _ViewCategoriesPageState createState() => _ViewCategoriesPageState();
}

class _ViewCategoriesPageState extends State<ViewCategoriesPage> {
  final pro = FirebaseFirestore.instance.collection('categories');

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
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "View Categories"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getDocProd(),
                builder: (context, snapshot) {
                  Map<String, dynamic> data = snapshot.data?.data() != null
                      ? snapshot.data!.data()! as Map<String, dynamic>
                      : <String, dynamic>{};
                  return ListView.builder(
                    itemCount: prod.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                                title:
                                    GetCategoriesPage(category: prod[index])),
                            Divider(
                              color: orangeColors, //color of divider
                              height: 10, //height spacing of divider
                              thickness: 3, //thickness of divier line
                              indent: 25, //spacing at the start of divider
                              endIndent: 25, //spacing at the end of divider
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Center(
              child: InkWell(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "To add new category click ",
                        style: TextStyle(color: Colors.black, fontSize: 25)),
                    TextSpan(
                        text: "here",
                        style: TextStyle(color: orangeColors, fontSize: 25)),
                  ]),
                ),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddCategPage())),
              ),
            )
          ],
        ),
      ),
    );
  }
}
