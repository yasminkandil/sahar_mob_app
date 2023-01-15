import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:sahar_mob_app/models/product_model.dart';

Widget orderStatus({icon, color, title, showdone}) {
  return ListTile(
      leading: const Icon(
        Icons.done,
        color: Colors.red,
      ),
      trailing: Row(
        children: [
          Text(
            "$title",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const Icon(
            Icons.done,
            color: Colors.red,
          )
        ],
      ));
}
