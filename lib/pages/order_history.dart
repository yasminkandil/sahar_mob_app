import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sahar_mob_app/utils/color.dart';

class order_history extends StatelessWidget {
  const order_history({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order History'),
          backgroundColor: orangeColors,
        ),
        body: Center(),
      ),
    );
  }
}
