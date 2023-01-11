import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sahar_mob_app/models/product_model.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';
import 'package:sahar_mob_app/widgets/textInput.dart';

import '../widgets/app_bar.dart';

class EditOfferPage extends StatelessWidget {
  final String offer;
  EditOfferPage({required this.offer});
  TextEditingController dateIn = TextEditingController();
  TextEditingController dateOut = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _percentageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('offers');

    return FutureBuilder<DocumentSnapshot>(
      future: products.doc(offer).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data?.data() != null
              ? snapshot.data!.data()! as Map<String, dynamic>
              : <String, dynamic>{};
          return Scaffold(
            appBar: CustomAppBar(text: "Edit Offer"),
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
                          margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              _textInput(
                                  controller: _nameController,
                                  hint: "${data['name']}",
                                  icon: Icons.edit,
                                  label: "Name"),
                              _textInput(
                                  controller: _descriptionController,
                                  hint: "${data['description']}",
                                  icon: Icons.edit,
                                  label: "Description"),
                              _textInput(
                                  controller: _percentageController,
                                  hint: "${data['percentage']}",
                                  icon: Icons.percent,
                                  label: "Percentage"),
                              _textInput(
                                  controller: dateOut,
                                  hint: "${data['dateout']}",
                                  icon: Icons.date_range,
                                  label: "End Date"),
                              ListTile(
                                title: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: ButtonWidget2(
                                        btnText: "Edit Offer",
                                        onClick: () {
                                          final updateprod = FirebaseFirestore
                                              .instance
                                              .collection('offers')
                                              .doc(offer)
                                              .update(
                                            {
                                              'name': _nameController.text,
                                              'dateout': dateOut.text,
                                              'description':
                                                  _descriptionController.text,
                                              'percentage': int.parse(
                                                  _percentageController.text),
                                            },
                                          ).then((value) =>
                                                  Navigator.pop(context));
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: ButtonWidgetdelete(
                                        btnText: "Delete Offer",
                                        onClick: () {
                                          final deleteprod = FirebaseFirestore
                                              .instance
                                              .collection('offers')
                                              .doc(offer)
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
