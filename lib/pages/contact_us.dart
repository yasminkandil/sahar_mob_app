import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/home/home_page.dart';
import 'package:sahar_mob_app/home/navbar.dart';
import 'package:sahar_mob_app/models/user_model.dart';
import 'package:sahar_mob_app/pages/view_account.dart';
import 'package:sahar_mob_app/utils/color.dart';

import '../models/contact_us_model.dart';
import '../widgets/app_bar.dart';

class ContactUs extends StatefulWidget {
  @override
  ContactUsForm createState() => ContactUsForm();
}

final userEm = FirebaseAuth.instance.currentUser!.email;

class ContactUsForm extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
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
                return MyHomePage();
              }),
            );
          },
        ),
      ),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 32.0),
                  TextField(
                    controller: emaillController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: orangeColors,
                      hintText: userEm,
                      enabled: false,
                      border: InputBorder.none,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: messageController,
                    maxLines: 7,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: orangeColors,
                      hintText: "Message",
                      border: InputBorder.none,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  MaterialButton(
                    height: 60.0,
                    minWidth: double.infinity,
                    color: GreyColors,
                    onPressed: () {
                      userId = FirebaseAuth.instance.currentUser!.uid;
                      addMessages(userEm!, messageController.text, userId)
                          .then((value) {
                        print("Message Sent");
                        final snackBar =
                            SnackBar(content: Text("Message Sent.."));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      });
                    },
                    child: Text("SUBMIT",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: orangeColors,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
