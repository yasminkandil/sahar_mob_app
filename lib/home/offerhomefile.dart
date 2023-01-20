import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/admin/add_offer.dart';
import 'package:sahar_mob_app/admin/add_product.dart';
import 'package:sahar_mob_app/admin/edit_product.dart';
import 'package:sahar_mob_app/read%20data/get_home_data.dart';
import 'package:velocity_x/velocity_x.dart';
import '../read data/getofferdata.dart';
import '../screens/details/details_screen.dart';
import '../widgets/app_bar.dart';

class Offerrphoto extends StatefulWidget {
  Offerrphoto({super.key});

  @override
  State<Offerrphoto> createState() => _OfferrphotoState();
}

class _OfferrphotoState extends State<Offerrphoto> {
  List<String> offershome = [];

  //final pro = FirebaseFirestore.instance.collection('products');

  Future Offeraraff() async {
    await FirebaseFirestore.instance
        .collection('products')
        .where('onSale', isEqualTo: true)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            offershome.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                future: Offeraraff(),
                builder: (context, snapshot) {
                  Map<String, dynamic> data = snapshot.data?.data() != null
                      ? snapshot.data!.data()! as Map<String, dynamic>
                      : <String, dynamic>{};
                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 220,
                        width: double.infinity,
                        // decoration: BoxDecoration(color: GreyColors),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                      offershome.length,
                                      (index) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              OffersData(
                                                offersitemss: offershome[index],
                                              ),
                                            ],
                                          )
                                              .box
                                              .orange400
                                              .rounded
                                              .padding(const EdgeInsets.all(10))
                                              .make()),
                                ))
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
