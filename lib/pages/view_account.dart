import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/edit_account.dart';
import 'package:sahar_mob_app/pages/navbar.dart';
import 'package:sahar_mob_app/pages/update_user.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';

import '../widgets/btn_widget.dart';

class ViewAccountPage extends StatefulWidget {
  const ViewAccountPage({super.key});

  @override
  State<ViewAccountPage> createState() => _ViewAccountPageState();
}

class _ViewAccountPageState extends State<ViewAccountPage> {
  @override
  Widget build(BuildContext context) {
    final userr = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Account'),
        backgroundColor: GreyColors,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: orangeColors,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Navigation_bar();
              }),
            );
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: GreyColors,
              ),
              onPressed: () {})
        ],
      ),
      body: Container(
        child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where('email', isEqualTo: userr.email)
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data!.docs[index];

                          return Column(
                            children: [
// -- IMAGE with ICON
                              const SizedBox(height: 50),
                              Form(
                                child: Column(children: [
                                  Text(
                                    "First Name:",
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),

                                        //labelText: "First Name : ",
                                        hintText: '${data['firstname']}\n'),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Last Name:",
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Last Name",
                                        hintText: '${data['lastname']}\n'),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Email:",
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        // labelText: "Email : ",
                                        hintText: '${data['email']}\n'),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Address:",
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        // border: InputBorder.none,
                                        border: OutlineInputBorder(),
                                        //labelText: "Address",
                                        hintText: '${data['address']}\n'),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return UpdateUser();
                                        }),
                                      );
                                    },
                                    child: const Text('Edit'),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                ]),
                              ),
                            ],
                          );
                        });
                  } else {
                    return Text('loading..');
                  }
                })),
      ),
    );
  }
}
