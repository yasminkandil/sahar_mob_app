import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:sahar_mob_app/admin/add_color.dart';

import 'package:sahar_mob_app/read%20data/get_colors.dart';

import 'package:sahar_mob_app/utils/color.dart';

class ViewcolorsPage extends StatefulWidget {
  const ViewcolorsPage({super.key});

  @override
  _ViewcolorsPageState createState() => _ViewcolorsPageState();
}

class _ViewcolorsPageState extends State<ViewcolorsPage> {
  final pro = FirebaseFirestore.instance.collection('colors');

  List<String> prod = [];

  Future getDocProd() async {
    await FirebaseFirestore.instance.collection('colors').get().then(
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
      appBar: AppBar(
        title: Text('Colors List'),
        backgroundColor: GreyColors,
        centerTitle: true,
      ),
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
                            ListTile(title: GetColorsPage(color: prod[index])),
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
                        text: "To add new color click ",
                        style: TextStyle(color: Colors.black, fontSize: 25)),
                    TextSpan(
                        text: "here",
                        style: TextStyle(color: orangeColors, fontSize: 25)),
                  ]),
                ),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddColorPage())),
              ),
            )
          ],
        ),
      ),
    );
  }
}
