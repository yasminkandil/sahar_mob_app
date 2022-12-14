import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/admin/admin.dart';
import 'package:sahar_mob_app/admin/order_details.dart';
import 'package:sahar_mob_app/pages/view_order_user.dart';
import 'package:sahar_mob_app/read%20data/get_orders.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';
import '../widgets/app_bar.dart';
import '../widgets/btn_widget.dart';

class ViewOrdersPage extends StatelessWidget {
  final pro = FirebaseFirestore.instance.collection('orderucts');

  List<String> order = [];

  Future getDocorder() async {
    await FirebaseFirestore.instance.collection('orders').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            order.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppBar(text: "Orders List"),
      body: FutureBuilder(
        future: getDocorder(),
        builder: (context, snapshot) {
          Map<String, dynamic> data = snapshot.data?.data() != null
              ? snapshot.data!.data()! as Map<String, dynamic>
              : <String, dynamic>{};
          return ListView.builder(
            itemCount: order.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: orangeColors,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderDetailsPage(
                              orderss: order[index],
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            // <-- Icon
                            Icons.remove_red_eye,
                            size: 20.0,
                          ),
                          Text('View Order ${order[index]}'), // <-- Text
                          SizedBox(
                            width: 2,
                          ),
                        ],
                      ),
                    ),
                    ListTile(title: GetOrders(orderss: order[index])),
                    Divider(
                      color: orangeColors, //color of divider
                      height: 10, //height spacing of divider
                      thickness: 3, //thickness of divier line
                      indent: 25, //spacing at the start of divider
                      endIndent: 25, //spacing at the end of divider
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
