import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/admin/add_category.dart';
import 'package:sahar_mob_app/admin/add_product.dart';
import 'package:sahar_mob_app/utils/color.dart';

class GetProductName extends StatelessWidget {
  final String salma;

  const GetProductName({required this.salma});

  // const GetUserName({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');

    return FutureBuilder<DocumentSnapshot>(
      future: products.doc(salma).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data?.data() != null
              ? snapshot.data!.data()! as Map<String, dynamic>
              : <String, dynamic>{};
          return Row(
            children: [
              Container(
                height: 50,
                width: 50,
                child: Image.network(data['image']),
              ),
              RichText(
                textScaleFactor: 1.5,
                text: TextSpan(
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold), //apply style to all

                  text: '${data['id']}\n',
                  children: [
                    // <-- Text
                    TextSpan(
                        text: 'Name : ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '${data['name']}\n',
                        style: TextStyle(
                            color: orangeColors,
                            fontWeight: FontWeight.normal)),

                    TextSpan(
                        text: 'Quantity  : ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '${data['quantity']}\n',
                        style: TextStyle(
                            color: orangeColors,
                            fontWeight: FontWeight.normal)),
                    TextSpan(
                        text: 'Price  : ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '${data['price']}\n',
                        style: TextStyle(
                            color: orangeColors,
                            fontWeight: FontWeight.normal)),
                    TextSpan(
                        text: 'Brand  : ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '${data['brand']}\n',
                        style: TextStyle(
                            color: orangeColors,
                            fontWeight: FontWeight.normal)),
                    TextSpan(
                        text: 'Category  : ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '${data['category']}\n',
                        style: TextStyle(
                            color: orangeColors,
                            fontWeight: FontWeight.normal)),

/*
                   TextSpan(

                      text: "Edit",
                      style: TextStyle(
                        color: Colors.blueGrey
                      ),
                        recognizer: TapGestureRecognizer()..onTap = () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddProductPage()))
                    
                  ),*/
                  ],
                ),
              ),
            ],
          );
          /* ');
                 Text (${da
                 ta['title']}
             
             ', Price : ${data['price']}'
             ', Description : ${data['description']}');*/
        }
        return Text('loading..');
      }),
    );
  }
}
