
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/view_account.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:velocity_x/velocity_x.dart';

import '../read data/get_home_data.dart';
import 'home_screen.dart';

Widget homeButton({ width,height,icon,String? title,onPress})
{
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
    Icon(icon, size: 30,color:orangeColors,),
    HeightBox(6),
    Text(title!, style: 
    TextStyle(fontSize: 24,
     color:Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold,))

         
        ],
      
    ).box.rounded.white.size(width, height).color(Colors.white30).shadowSm.make(),
  );
}
