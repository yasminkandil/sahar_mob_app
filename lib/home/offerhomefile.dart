import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/admin/add_offer.dart';
import 'package:sahar_mob_app/admin/add_product.dart';
import 'package:sahar_mob_app/admin/edit_product.dart';
import 'package:sahar_mob_app/read%20data/get_home_data.dart';
import 'package:sahar_mob_app/read%20data/get_product_name.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/app_bar.dart';

class Offerrphoto extends StatefulWidget {
   Offerrphoto({super.key});

  @override
  State<Offerrphoto> createState() => _OfferrphotoState();
}

class _OfferrphotoState extends State<Offerrphoto> {
      List<String> offershome = [];

  final pro = FirebaseFirestore.instance.collection('products');

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
    return  Center(
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

                    return   Container(
            width: double.infinity,
            decoration: BoxDecoration(color: orangeColors),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  
                  child:  Row(
                        children: List.generate(offershome.length, (index) => 
                        Column(
                           crossAxisAlignment:CrossAxisAlignment.start,
                  
                          children:<Widget>[
                            
                             OffersData(offersitemss: offershome[index]),
                          
                          ],
                                  
                        ).box.gray300.rounded.
                        padding(const EdgeInsets.all(5)).make()),
                                  
                      )
                                      
                )
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
      );
    
  }
}
