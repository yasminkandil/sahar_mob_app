import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/edit_account.dart';
import 'package:sahar_mob_app/read%20data/get_product_name.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';

class ViewProductPage extends StatefulWidget {
  const ViewProductPage({super.key});

  @override
  _ViewProductPageState createState() => _ViewProductPageState();
}

class _ViewProductPageState extends State<ViewProductPage> {
 
  final pro =FirebaseFirestore.instance.collection('products');

List<String> prod = [];
Future getDocProd() async{
  await FirebaseFirestore.instance.collection('products').get().
  then((snapshot) => snapshot.docs.forEach((document) {
    //print(document.reference);
    prod.add(document.reference.path);
  }),
  );
}
  @override
  void initState() {
    super.initState();
    setState(() {});
    //getData();
  }

 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        backgroundColor: GreyColors,
        centerTitle: true,
      ),
      body: Center(
        child:
       Column( 
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text('Products:${pro.id}',
        style: TextStyle(fontSize: 20),),
        MaterialButton(onPressed: (){
         // FirebaseAuth.instance.signOut();

        },
        color: Colors.deepPurple,
        child: Text('Products'),),
        Expanded(
          child: 
          FutureBuilder(
                        future: getDocProd(),
            builder: (context, snapshot)
           {
           return ListView.builder(
          itemCount: prod.length,
          itemBuilder:
         (context, index) {

          return ListTile(
            title:GetProductName(salma: prod[index])
         // Text(docIDs[index]),
          ); 
          },
        
        );
           },
        ),
        ),
      ],
      ),
      ),
    
    );
  }
}
