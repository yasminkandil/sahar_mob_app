import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/admin/add_product.dart';
import 'package:sahar_mob_app/admin/edit_product.dart';
import 'package:sahar_mob_app/read%20data/get_product_name.dart';
import 'package:sahar_mob_app/utils/color.dart';
import '../widgets/app_bar.dart';

class ViewProductPage extends StatefulWidget {
  const ViewProductPage({super.key});

  @override
  _ViewProductPageState createState() => _ViewProductPageState();
}

class _ViewProductPageState extends State<ViewProductPage> {
  final pro = FirebaseFirestore.instance.collection('products');
  List<String> prod = [];
  Future getDocProd() async {
    await FirebaseFirestore.instance.collection('products').get().then(
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
      appBar: CustomAppBar(text: "View Products"),
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
                                    builder: (context) => EditProductPage(
                                      salma: prod[index],
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                      'Product Number ${prod[index]} '), // <-- Text
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Icon(
                                    // <-- Icon
                                    Icons.edit,
                                    size: 10.0,
                                  ),
                                ],
                              ),
                            ),
                            ListTile(title: GetProductName(salma: prod[index])),
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
                        text: "To add new product click ",
                        style: TextStyle(color: Colors.black, fontSize: 25)),
                    TextSpan(
                        text: "here",
                        style: TextStyle(color: orangeColors, fontSize: 25)),
                  ]),
                ),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddProductPage())),
              ),
            )
          ],
        ),
      ),
    );
  }
}
