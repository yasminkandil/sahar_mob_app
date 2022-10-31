import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/admin.dart';
//import 'package:image_picker/image_picker.dart';

import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';
//import 'package:sahar_mob_app/widgets/header_container.dart';

class AddQualityPage extends StatefulWidget {
  @override
  _AddQualityPageState createState() => _AddQualityPageState();
}

class _AddQualityPageState extends State<AddQualityPage> {
  List ListQuality = ['Original', 'HighCopy'];
  String selectedValQ = 'Original';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Account'),
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
                    _dropDown(
                      hint: "Quality",
                      icon: Icons.high_quality,
                      listt: ListQuality,
                      select: "Original",
                    ),
                    ListTile(
                      title: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            child: ButtonWidget2(
                              btnText: "Add Quality",
                              onClick: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Expanded(
                            child: ButtonWidgetdelete(
                              btnText: "Delete Quality",
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

  Widget _dropDown({hint, icon, required List listt, required String select}) {
    return DropdownButtonFormField(
      value: select,
      items: listt
          .map((e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ))
          .toList(),
      onChanged: (val) {
        setState(() {
          select = val as String;
        });
      },
      icon: const Icon(
        Icons.arrow_drop_down_circle,
        color: Color.fromARGB(255, 249, 118, 3),
      ),
      dropdownColor: Color.fromARGB(255, 249, 118, 3),
      decoration: InputDecoration(
          labelText: hint,
          prefixIcon: Icon(
            icon,
            color: Color.fromARGB(255, 249, 118, 3),
          ),
          border: UnderlineInputBorder()),
    );
  }
}
