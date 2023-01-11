import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/admin/admin.dart';
//import 'package:image_picker/image_picker.dart';

import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';

import '../widgets/app_bar.dart';
import '../widgets/textInput.dart';
//import 'package:sahar_mob_app/widgets/header_container.dart';

class AddColorPage extends StatefulWidget {
  @override
  _AddColorPageState createState() => _AddColorPageState();
}

class _AddColorPageState extends State<AddColorPage> {
  final _colorController = TextEditingController();
  Future addColor(String color) async {
    await FirebaseFirestore.instance.collection('colors').doc().set({
      'color': color,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Add Color"),
      body: Container(
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
                    TextInput(
                        controller: _colorController,
                        hint: "Color Name",
                        icon: Icons.category),
                    ListTile(
                      title: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: ButtonWidget2(
                              btnText: "Add Color",
                              onClick: () {
                                addColor(_colorController.text);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Expanded(
                            child: ButtonWidgetdelete(
                              btnText: "Delete Color",
                              onClick: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
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
}
