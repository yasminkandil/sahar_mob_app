import 'package:flutter/material.dart';
import 'package:sahar_mob_app/controllers/search_product.dart';
import 'package:sahar_mob_app/utils/color.dart';

import '../admin/search_order.dart';

class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  String text;
  AdminAppBar({Key? key, required this.text})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    Future<void> OrdSearch() async {
      await showSearch(
        context: context,
        delegate: OrderSearch(),
      );
    }

    return AppBar(
      backgroundColor: GreyColors,
      title: Text(text),
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: orangeColors,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      actions: [
        IconButton(
          onPressed: () {
            OrdSearch();
          },
          icon: const Icon(Icons.search),
        ),
       
      ],
    );
  }
}
