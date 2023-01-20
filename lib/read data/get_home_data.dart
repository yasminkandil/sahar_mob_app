import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/utils/color.dart';

import '../home/home_screen.dart';
import '../screens/details/details_screen.dart';

class GetHomePhoto extends StatelessWidget {
  final String homeimage;
  GetHomePhoto({required this.homeimage});

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('homePage');
    return FutureBuilder<DocumentSnapshot>(
      future: products.doc(homeimage).get(),
      builder: ((context, snapshot) {
        // if (snapshot.hasError) {
        //   return Center(child: CircularProgressIndicator());
        // }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data?.data() != null
              ? snapshot.data!.data()! as Map<String, dynamic>
              : <String, dynamic>{};
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(data['image']),
                fit: BoxFit.cover,
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}

class OffersData extends StatelessWidget {
  final String offersitemss;
  OffersData({required this.offersitemss});
  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');

    return FutureBuilder<DocumentSnapshot>(
      future: products.doc(offersitemss).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data?.data() != null
              ? snapshot.data!.data()! as Map<String, dynamic>
              : <String, dynamic>{};
          return Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    child: Image.network(data['image']),
                  ),
                  RichText(
                    textScaleFactor: 1.5,
                    text: TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold), //apply style to all
                      children: [
                        // <-- Text
                        TextSpan(
                            text: 'Name : ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '${data['name']}\n',
                            style: TextStyle(
                                color: orangeColors,
                                fontWeight: FontWeight.normal)),

                    
                        TextSpan(
                            text: 'Price  : ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '${data['price']}\n',
                            style: TextStyle(
                                color: orangeColors,
                                fontWeight: FontWeight.normal)),
                        TextSpan(
                            text: 'Brand  : ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '${data['brand']}\n',
                            style: TextStyle(
                                color: orangeColors,
                                fontWeight: FontWeight.normal)),
                    
                      ],
                    ),
                  ),
                ],
              ),
             
            ],
          );
          
        }
        return Text('loading..');
      }),
    );
  }
}
