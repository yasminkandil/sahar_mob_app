import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class GetUserName extends StatelessWidget {
  // const GetUserName({super.key});
final String documentId;
GetUserName({required this.documentId});
  @override
  Widget build(BuildContext context) {
    CollectionReference users=
    FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>
    (
      future: users.doc(documentId).get(),
      builder:((context, snapshot){
       if(snapshot.connectionState == ConnectionState.done)
       {
          Map<String, dynamic> data = 
             snapshot?.data?.data()!=null?
             snapshot?.data!.data()! 
              as Map<String,dynamic>:<String,dynamic>{}; 
             return Text('First Name : ${data['firstname']}');
       }
else if  (snapshot.hasError) {
            return Center(
              child: Text('You need to sign in to view your account.'),
            );
          }
          else{
             
            return Center(child: CircularProgressIndicator());
          
          }    }),
    );
  }
}