import 'package:flutter/material.dart';
import 'package:sahar_mob_app/add_screen.dart';

class TopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Top Navigation"),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.shopping_cart),
                text: 'Cart',
              ),
              Tab(
                icon: Icon(Icons.person),
                text: 'Account',
              ),
              Tab(
                icon: Icon(Icons.category_outlined),
                text: 'Categories',
              ),
            ]),
          ),
          body: TabBarView(children: [
            AddScreen(),
            MaterialApp(home: Center(child: Text('Cart'))),
            MaterialApp(home: Center(child: Text('Account'))),
            MaterialApp(home: Center(child: Text('Categories')))
          ]),
        ));
    throw UnimplementedError();
  }
}
