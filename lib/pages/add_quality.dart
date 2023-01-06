import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/admin.dart';
//import 'package:image_picker/image_picker.dart';

import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';

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
      appBar: AppBar(
        title: Text('Add Quality'),
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
                return Admin();
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
                        controller: _nameController,
                        hint: "Quality",
                        icon: Icons.category),
                    ListTile(
                      title: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: ButtonWidget2(
                              btnText: "Add Color",
                              onClick: () {
                                addQuality(_nameController.text);
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
