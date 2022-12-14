import 'package:flutter/material.dart';
import 'package:sahar_mob_app/controllers/search_delegate.dart';
import 'package:sahar_mob_app/utils/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String text;
  CustomAppBar({Key? key, required this.text})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: GreyColors,
      title: Text(text),
      actions: [
        IconButton(
          onPressed: () {
            // method to show the search bar
            //context: context, delegate:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FirebaseSearchScreen()),
            );
          },
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {
            // method to show the search bar
          },
          icon: const Icon(Icons.notifications),
        ),
        IconButton(
          onPressed: () {
            // method to show the search bar
          },
          icon: const Icon(Icons.shopping_bag),
        )
      ],
    );
  }
}
