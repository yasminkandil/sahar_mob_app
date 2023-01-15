import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/admin/add_category.dart';
import 'package:sahar_mob_app/admin/add_product.dart';
import 'package:sahar_mob_app/pages/gallery_details_page.dart';
import 'package:sahar_mob_app/home/navbar.dart';
import 'package:sahar_mob_app/utils/color.dart';

class GetGallery extends StatelessWidget {
  final String imagee;

  GetGallery({required this.imagee});

  // const GetUserName({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('gallery');

    return FutureBuilder<DocumentSnapshot>(
      future: products.doc(imagee).get(),
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
        return Text('loading..');
      }),
    );
  }
}
