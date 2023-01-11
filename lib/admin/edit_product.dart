import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/models/product_model.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';

import '../widgets/app_bar.dart';

class EditProductPage extends StatelessWidget {
  final String salma;
  EditProductPage({required this.salma});

  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');

    return FutureBuilder<DocumentSnapshot>(
      future: products.doc(salma).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data?.data() != null
              ? snapshot.data!.data()! as Map<String, dynamic>
              : <String, dynamic>{};
          return Scaffold(
            appBar: CustomAppBar(text: "Edit Product"),
            //backgroundColor: Color.fromARGB(255, 103, 101, 101),
            body: Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Column(
                children: <Widget>[
                  // HeaderContainer("Register"),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 90,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Color.fromARGB(255, 103, 101, 101)),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage("${data['image']}"))),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                  color: Colors.orange),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: IntrinsicHeight(
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              _textInput(
                                  controller: nameeController,
                                  hint: "${data['name']}",
                                  icon: Icons.edit,
                                  label: "Product Name"),
                              _textInput(
                                  controller: descriptionnController,
                                  hint: "${data['description']}",
                                  icon: Icons.edit,
                                  label: "Description"),
                              _textInput(
                                  controller: abouttController,
                                  hint: "${data['brand']}",
                                  icon: Icons.edit,
                                  label: "Brand"),
                              _textInput(
                                  controller: priceeController,
                                  hint: "${data['price']}",
                                  icon: Icons.money,
                                  label: "Price"),
                              _textInput(
                                  controller: quantityyController,
                                  hint: "${data['quantity']}",
                                  icon: Icons.numbers,
                                  label: "Quantity"),
                              ListTile(
                                title: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: ButtonWidget2(
                                        btnText: "Edit Product",
                                        onClick: () {
                                          final updateprod = FirebaseFirestore
                                              .instance
                                              .collection('products')
                                              .doc(salma)
                                              .update(
                                            {
                                              'name': nameeController.text,
                                              'brand': abouttController.text,
                                              'description':
                                                  descriptionnController.text,
                                              'price': int.parse(
                                                  priceeController.text),
                                              'quantity': int.parse(
                                                  quantityController.text),
                                            },
                                          ).then((value) =>
                                                  Navigator.pop(context));
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: ButtonWidgetdelete(
                                        btnText: "Delete Product",
                                        onClick: () {
                                          final deleteprod = FirebaseFirestore
                                              .instance
                                              .collection('products')
                                              .doc(salma)
                                              .delete()
                                              .then((value) =>
                                                  Navigator.pop(context));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Text('loading..');
      }),
    );
  }

  Widget _textInput({controller, hint, icon, label}) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          prefixIcon: Icon(
            icon,
            color: Color.fromARGB(255, 249, 118, 3),
          ),
        ),
      ),
    );
  }
}
