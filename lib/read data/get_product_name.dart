import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class GetProductName extends StatelessWidget {

  // const GetUserName({super.key});
final String salma;
 GetProductName({required this.salma});
  @override

  Widget build(BuildContext context) {

    CollectionReference products=
    FirebaseFirestore.instance.collection('products');
    
    
    return FutureBuilder<DocumentSnapshot>
    (
      future: products.doc(salma).get(),
            builder:((context, snapshot){


       if (snapshot.connectionState == ConnectionState.done) {
         Map<String, dynamic> data = 
             snapshot?.data?.data()!=null?
             snapshot?.data!.data()! 
              as Map<String,dynamic>:<String,dynamic>{}; 
             return Text('Name : ${data['name']}');
        }
       return Text('loading..'); 
    }),
    );
  
  }
}