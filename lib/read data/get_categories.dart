import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GetCategoriesPage extends StatelessWidget {
  final String category;

  const GetCategoriesPage({required this.category});

  // const GetUserName({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('categories');

    return FutureBuilder<DocumentSnapshot>(
      future: products.doc(category).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data?.data() != null
              ? snapshot.data!.data()! as Map<String, dynamic>
              : <String, dynamic>{};
          return Row(
            children: [
              Container(
                height: 70,
                width: 70,
                child: Image.network(data['image']),
              ),
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
                        text: '${data['name']}',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
            ],
          );
        }
        return Text('loading..');
      }),
    );
  }
}
