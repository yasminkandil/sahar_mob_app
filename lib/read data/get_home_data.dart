import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:velocity_x/velocity_x.dart';

import '../screens/details/details_screen.dart';

class GetHomePhoto extends StatelessWidget {
  final String homeimage;
  GetHomePhoto({required this.homeimage});

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('gallery');
    return FutureBuilder<DocumentSnapshot>(
      future: products.doc(homeimage).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data?.data() != null
              ? snapshot.data!.data()! as Map<String, dynamic>
              : <String, dynamic>{};
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(data['imagePath']),
                fit: BoxFit.cover,
              ),
            ),
          );
        }
        else {
                                return Center(child: CircularProgressIndicator());

                  }
      }),
    );
  }
}

//Class to get offers data

class GetOffersData extends StatelessWidget {
  final Function press;
  final String offersimage;
  GetOffersData({required this.offersimage,required this.press});

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('products')
            //.where('id', isEqualTo: offersimage)
            .orderBy('Date',descending: true)
            .limit(4)
            .get()
            .then((value) => value.docs[1].reference.get()),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data?.data() != null
                ? snapshot.data!.data()! as Map<String, dynamic>
                : <String, dynamic>{};
            return GestureDetector(
                 onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(
                    salma: offersimage,
                  );
                }));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(35),
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  //borderRadius: BorderRadius.circular(16)
                                ),
                                child: Image(
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage("${data["image"]}")),
                              ),
                              Container(
                                 padding: EdgeInsets.all(35),

                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                               // padding: const EdgeInsets.symmetric(
                                 //   vertical: 10 / 4),
                                child: Text(
                                    "${data['name']} \n" +
                                        "${data['price']}" +
                                        "LE",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                              SizedBox(
                                width: 3,
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
  else {
                                return Center(child: CircularProgressIndicator());

                  }        }));
  }
}
