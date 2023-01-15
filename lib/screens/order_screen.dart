import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders"),
      ),
      body: StreamBuilder(
        stream: getorderList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text("No Orders"),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: ListTile(
                    leading: Text("${index + 1}"),
                    title: Text(snapshot.data.documents[index].data["name"]),
                    subtitle:
                        Text(snapshot.data.documents[index].data["price"]),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  getorderList() {
    return FirebaseFirestore.instance
        .collection("orders")
        .where('orderBy', isEqualTo: FirebaseAuth.instance.currentUser?.email)
        .snapshots();
  }
}
