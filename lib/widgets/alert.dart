import 'package:flutter/material.dart';
import 'package:sahar_mob_app/utils/color.dart';

showAlertDialog(BuildContext context, text) {
  Widget okButton = ElevatedButton(
    child: Text("OK"),
    style: ElevatedButton.styleFrom(
      primary: orangeColors,
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text(text),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
