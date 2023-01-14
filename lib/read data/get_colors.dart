import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/utils/color.dart';

class GetColorsPage extends StatelessWidget {
  final String color;

  const GetColorsPage({required this.color});

  // const GetUserName({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('colors');

    return FutureBuilder<DocumentSnapshot>(
      future: products.doc(color).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data?.data() != null
              ? snapshot.data!.data()! as Map<String, dynamic>
              : <String, dynamic>{};
          return Row(
            children: [
              RichText(
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
                        text: '${data['color']}',
                        style: TextStyle(
                            color: orangeColors,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  final delete = FirebaseFirestore.instance
                      .collection('colors')
                      .doc(color)
                      .delete()
                      .then((value) => Navigator.pop(context));
                },
                icon: Icon(Icons.delete, color: Colors.red, size: 30.0),
              ),
            ],
          );
        }
        return Text('loading..');
      }),
    );
  }
}
