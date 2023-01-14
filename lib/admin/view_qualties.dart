import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/admin/add_quality.dart';
import 'package:sahar_mob_app/read%20data/get_qualties.dart';
import 'package:sahar_mob_app/utils/color.dart';
import '../widgets/app_bar.dart';

class ViewQualitiesPage extends StatefulWidget {
  const ViewQualitiesPage({super.key});

  @override
  _ViewQualitiesPageState createState() => _ViewQualitiesPageState();
}

class _ViewQualitiesPageState extends State<ViewQualitiesPage> {
  final pro = FirebaseFirestore.instance.collection('qualties');

  List<String> prod = [];

  Future getDocProd() async {
    await FirebaseFirestore.instance.collection('qualties').get().then(
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
      appBar: CustomAppBar(text: "View Qualties"),
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
                                title: GetQualtiesPage(quality: prod[index])),
                            Divider(
                              color: orangeColors,
                              height: 10,
                              thickness: 3,
                              indent: 25,
                              endIndent: 25,
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
                        text: "To add new quality click ",
                        style: TextStyle(color: Colors.black, fontSize: 25)),
                    TextSpan(
                        text: "here",
                        style: TextStyle(color: orangeColors, fontSize: 25)),
                  ]),
                ),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddQualityPage())),
              ),
            )
          ],
        ),
      ),
    );
  }
}
