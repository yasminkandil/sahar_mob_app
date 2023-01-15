import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sahar_mob_app/screens/order_status.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key, this.data});
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("My Orders Details"),
        ),
        body: Column(
          children: [
            orderStatus(
                color: Colors.orange,
                icon: Icons.done,
                title: "Order Placed",
                showdone: data['orderStatus']),
          ],
        ));
  }
}
