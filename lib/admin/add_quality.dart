import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/admin/add_product.dart';
import 'package:sahar_mob_app/admin/admin.dart';
//import 'package:image_picker/image_picker.dart';

import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';

import '../models/product_model.dart';
import '../widgets/app_bar.dart';
import '../widgets/reg_textinput.dart';
import '../widgets/textInput.dart';
//import 'package:sahar_mob_app/widgets/header_container.dart';

class AddQualityPage extends StatefulWidget {
  @override
  _AddQualityPageState createState() => _AddQualityPageState();
}

class _AddQualityPageState extends State<AddQualityPage> {
  final _nameController = TextEditingController();
  Future addQuality(String name) async {
    await FirebaseFirestore.instance.collection('qualties').doc().set({
      'name': name,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Add Quality"),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      RegTextInput(
                          controller: _nameController,
                          hint: "Quality",
                          icon: Icons.category,
                          torf: false,
                          errormssg: errormssg,
                          regexp: aregexp,
                          enable: true),
                      Center(
                        child: ListTile(
                          title: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(
                                child: ButtonWidget2(
                                  btnText: "Add Quality",
                                  onClick: () {
                                    if (formKey.currentState!.validate()) {
                                      addQuality(_nameController.text).then(
                                          (value) => Navigator.pop(context));
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
