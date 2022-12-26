import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetProductName extends StatelessWidget {
  // const GetUserName({super.key});
  final String salma;
  GetProductName({required this.salma});
  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
  final pro = FirebaseFirestore.instance.collection('products');

    return FutureBuilder<DocumentSnapshot>(
      future: products.doc(salma).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data?.data() != null
              ? snapshot.data!.data()! as Map<String, dynamic>
              : <String, dynamic>{};
          return RichText(
              text: TextSpan(
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), //apply style to all
text: 'Product Number: ${data['ID']}\n',
                  children: [
                TextSpan(
                    text: 'Name : ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: '${data['name']}\n',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.normal)) ,


                TextSpan(
                  
                    text: 'Description  : ',
                    style: TextStyle(
                   color: Colors.black, fontWeight: FontWeight.bold)),
                
                TextSpan(
                    text: '${data['description']}\n',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.normal)),
              ]));

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
