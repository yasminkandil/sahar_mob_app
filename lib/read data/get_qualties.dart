import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GetQualtiesPage extends StatelessWidget {
  final String quality;

  const GetQualtiesPage({required this.quality});

  // const GetUserName({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('qualties');

    return FutureBuilder<DocumentSnapshot>(
      future: products.doc(quality).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data?.data() != null
              ? snapshot.data!.data()! as Map<String, dynamic>
              : <String, dynamic>{};
          return RichText(
            textScaleFactor: 2,
            text: TextSpan(
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold), //apply style to all

              children: [
                // <-- Text
                TextSpan(
                    text: 'Name : ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: '${data['name']}\n',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.normal)),
              ],
            ),
          );
        }
        return Text('loading..');
      }),
    );
  }
}
