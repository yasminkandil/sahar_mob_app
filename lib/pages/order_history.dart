import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sahar_mob_app/utils/color.dart';

import '../widgets/app_bar.dart';

class order_history extends StatelessWidget {
  const order_history({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(text: "Order History"),
        body: Center(),
      ),
    );
  }
}
