import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/models/checkout_model.dart';
import 'package:sahar_mob_app/pages/regi_page.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';

import '../widgets/app_bar.dart';

class checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<checkout> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child("orders");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Checkout"),
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Checkout"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(hint: "Name", icon: Icons.person),
                    _textInput(hint: "Phone Number", icon: Icons.phone),
                    _textInput(hint: "Address", icon: Icons.home),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.orange,
                      ),
                      onPressed: () {},
                      child: Text('In case of visa fill this'),
                    ),
                    _textInput(
                        hint: "Credit Card Number", icon: Icons.credit_card),
                    _textInput(hint: "Expiry Date", icon: Icons.date_range),
                    _textInput(hint: "CCV", icon: Icons.credit_card_sharp),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Color.fromARGB(255, 8, 2, 2),
                        ),
                        onPressed: () {
/*
orders(namesController.text,
 addressController.text,
  phoneController.text,
   paymentMController.text,
    ccnController.text, ccvController.text, expdateController.text).then((value) {
      print("Order placed succesfully");
      final SnackBar=SnackBar(content: Text("Order Placed"));
      
    }*/
                        },
                        child: Text('Checkout'),
                      ),
                    ),
                    Expanded(
                      child: Center(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}

class _MyAppState extends State<MaterialApp> {
  bool _myBoolean = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Checkbox(
        value: _myBoolean,
        onChanged: (bool? value) {
          setState(() {
            _myBoolean = value!; // WILL rebuild
          });
        },
      ),
    );
  }
}
