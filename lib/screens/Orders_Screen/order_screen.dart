import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sahar_mob_app/screens/Orders_Screen/order_details.dart';
import 'package:sahar_mob_app/widgets/app_bar.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key, required this.salma});
  final String salma;

  List<String> orders = [];

  Future getDocord() async {
    await FirebaseFirestore.instance
        .collection('orders')
        .where('orderBy', isEqualTo: FirebaseAuth.instance.currentUser?.email)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            orders.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "My Orders",
      ),
      backgroundColor: Colors.orange,
      body: FutureBuilder(
        future: getDocord(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) =>
                buildOrders(salma: orders[index], index: index),
          );
        },
      ),
    );
  }
}

class buildOrders extends StatelessWidget {
  buildOrders({super.key, required this.salma, required this.index});
  final String salma;
  final int index;
  var indexx = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('orders').doc(salma).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data?.data() != null
              ? snapshot.data!.data()! as Map<String, dynamic>
              : <String, dynamic>{};
          return Container(
              child: ListTile(
            leading: Text("  ${index + 1} "),
            title: Text(" Name:  ${data["products"]}"),
            subtitle: Text("Order Price:    ${data['totalPrice']}  " + "EGP"),
            trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrdersDetails(
                        salma: salma,
                      ),
                    ),
                  );
                }),
          ));
        }
        return Text("Loading..");
      }),
    );
  }
}
