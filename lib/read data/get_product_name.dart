import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/add_category.dart';
import 'package:sahar_mob_app/pages/add_product.dart';

class GetProductName extends StatelessWidget{
  final String salma;

  const GetProductName({ required this.salma});
  

  
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
          return RichText(
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
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.normal)),
                TextSpan(
                    text: 'Description  : ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: '${data['description']}\n',
                    style: TextStyle(
                        color: Colors.deepOrange,
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
