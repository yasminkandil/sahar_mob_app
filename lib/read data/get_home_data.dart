import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter/material.dart';
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
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
