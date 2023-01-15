import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sahar_mob_app/screens/order_status.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key, required this.salma});
  final String salma;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 61, 61, 61),
          title: Text("My Orders Details"),
        ),
        backgroundColor: Colors.orange,
        body: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('orders')
                .doc(salma)
                .get(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data = snapshot.data?.data() != null
                    ? snapshot.data!.data()! as Map<String, dynamic>
                    : <String, dynamic>{};
                return ListView(
                  children: [
                    Text("Email:  ${data['orderBy']} ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            height: 2)),
                    Text("Date: ${data['orderDate']}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            height: 2)),
                    Text("Order Status: ${data['orderStatus']}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            height: 2)),
                    Text(
                      "Product Name: ${data['products']}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18, height: 2),
                    ),
                    Text("Total Paid:${data['Total']}" + "EGP",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            height: 2)),
                    Text("Paument Method: ${data['paymentMethod']}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            height: 2)),
                  ],
                );
              }
              return Text("Loading...");
            })));
  }
}
