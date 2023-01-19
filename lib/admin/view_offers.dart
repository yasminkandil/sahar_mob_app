import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/admin/add_offer.dart';
import 'package:sahar_mob_app/admin/add_product.dart';
import 'package:sahar_mob_app/admin/edit_offer.dart';
import 'package:sahar_mob_app/pages/edit_account.dart';
import 'package:sahar_mob_app/admin/edit_product.dart';
import 'package:sahar_mob_app/read%20data/get_offers.dart';
import 'package:sahar_mob_app/read%20data/get_product_name.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';

import '../widgets/app_bar.dart';

class ViewOffersPage extends StatefulWidget {
  const ViewOffersPage({super.key});

  @override
  _ViewOffersPageState createState() => _ViewOffersPageState();
}

class _ViewOffersPageState extends State<ViewOffersPage> {
  final pro = FirebaseFirestore.instance.collection('offers');

  List<String> prod = [];

  Future getDocProd() async {
    await FirebaseFirestore.instance.collection('offers').get().then(
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
    //getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "View Offers"),
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
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: GreyLightColors,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditOfferPage(
                                      offer: prod[index],
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Edit "),
                                  Icon(
                                    // <-- Icon
                                    Icons.edit,
                                    size: 15.0,
                                  ),
                                ],
                              ),
                            ),
                            ListTile(title: GetOffersPage(offer: prod[index])),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            /*Center(
              child: InkWell(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "To add new offer click ",
                        style: TextStyle(color: Colors.black, fontSize: 25)),
                    TextSpan(
                        text: "here",
                        style: TextStyle(color: orangeColors, fontSize: 25)),
                  ]),
                ),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddOfferPage())),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
