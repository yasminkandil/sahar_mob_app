import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:sahar_mob_app/admin/add_category.dart';
import 'package:sahar_mob_app/admin/add_color.dart';
import 'package:sahar_mob_app/admin/add_gallery.dart';
import 'package:sahar_mob_app/admin/add_homePageImage.dart';
import 'package:sahar_mob_app/admin/add_offer.dart';
import 'package:sahar_mob_app/admin/add_product.dart';
import 'package:sahar_mob_app/admin/add_quality.dart';
import 'package:sahar_mob_app/admin/orders_admin.dart';
import 'package:sahar_mob_app/admin/view_categories.dart';
import 'package:sahar_mob_app/admin/view_colors.dart';
import 'package:sahar_mob_app/admin/view_offers.dart';
import 'package:sahar_mob_app/admin/view_qualties.dart';
//import 'package:sahar_mob_app/pages/products_powerbank.dart';
import 'package:sahar_mob_app/admin/users_admin.dart';
import 'package:sahar_mob_app/admin/view_product.dart';
import 'package:sahar_mob_app/pages/products_all.dart';
=======
>>>>>>> 82b03952b86d220d374927e934dcfccc8f32cecc
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/home/home_page.dart';

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.orange;
  MaterialColor notActive = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: GreyColors,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: orangeColors,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const MyHomePage();
                  }),
                );
              }),

          title: Row(
            children: <Widget>[
              Expanded(
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 234, 119, 18)),
                      ),
                      onPressed: () {
                        setState(() => _selectedPage = Page.dashboard);
                      },
                      icon: const Icon(Icons.dashboard, color: Colors.white),
                      label: const Text('Dashboard'))),
              Expanded(
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 234, 119, 18)),
                      ),
                      onPressed: () {
                        setState(() => _selectedPage = Page.manage);
                      },
                      icon: const Icon(Icons.sort, color: Colors.white),
                      label: const Text('Manage'))),
            ],
          ),
          //elevation: 0.0,
          //backgroundColor: Colors.white,
        ),
        body: _loadScreen());
  }

  Widget _loadScreen() {
    switch (_selectedPage) {
      case Page.dashboard:
        return Column(
          children: <Widget>[
            ListTile(
              subtitle: ElevatedButton.icon(
                onPressed: null,
                icon: const Icon(
                  Icons.attach_money,
                  size: 30.0,
                  color: Colors.black,
                ),
                label: Text('12,000',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0, color: orangeColors)),
              ),
              title: const Text(
                'Revenue',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, color: Colors.black),
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                          title: ElevatedButton.icon(
                              onPressed: null,
                              icon: const Icon(Icons.people_outline),
                              label: const Text("Users")),
                          subtitle: Text(
                            '700',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: orangeColors, fontSize: 50.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                          title: ElevatedButton.icon(
                              onPressed: null,
                              icon: const Icon(Icons.category),
                              label: const Text("Categorie")),
                          subtitle: Text(
                            '23',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: orangeColors, fontSize: 50.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: ListTile(
                          title: ElevatedButton.icon(
                              onPressed: null,
                              icon: const Icon(Icons.track_changes),
                              label: const Text("Products")),
                          subtitle: Text(
                            '120',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: orangeColors, fontSize: 50.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: ListTile(
                          title: ElevatedButton.icon(
                              onPressed: null,
                              icon: const Icon(Icons.date_range),
                              label: const Text("In Fix")),
                          subtitle: Text(
                            '13',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: orangeColors, fontSize: 50.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: ListTile(
                          title: ElevatedButton.icon(
                              onPressed: null,
                              icon: const Icon(Icons.shopping_cart),
                              label: const Text("Orders")),
                          subtitle: Text(
                            '500',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: orangeColors, fontSize: 50.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Card(
                      child: ListTile(
                          title: ElevatedButton.icon(
                              onPressed: null,
                              icon: const Icon(Icons.close),
                              label: const Text("Messages")),
                          subtitle: Text(
                            '20',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: orangeColors, fontSize: 50.0),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      case Page.manage:
        return ListView(
          children: <Widget>[
            ListTile(
                leading: const Icon(Icons.add_circle_outline),
                title: const Text("Add product"),
                onTap: () => Navigator.pushNamed(context, 'add_product')),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text("Products list"),
                onTap: () => Navigator.pushNamed(context, 'view_products')),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.add_circle_outline),
                title: const Text("Add category"),
                onTap: () => Navigator.pushNamed(context, 'add_category')),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text("Category list"),
                onTap: () => Navigator.pushNamed(context, 'view_categories')),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.add_circle_outline),
                title: const Text("Add Color"),
                onTap: () => Navigator.pushNamed(context, 'add_color')),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text("Colors List"),
                onTap: () => Navigator.pushNamed(context, 'view_colors')),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.add_circle_outline),
                title: const Text("Add Offer"),
                onTap: () => Navigator.pushNamed(context, 'add_offer')),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.library_books),
              title: const Text("Offers List"),
              onTap: () => Navigator.pushNamed(context, 'view_offers'),
            ),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.add_circle_outline),
                title: const Text("Add Quality"),
                onTap: () => Navigator.pushNamed(context, 'add_quality')),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text("Qualities List"),
                onTap: () => Navigator.pushNamed(context, 'view_qualties')),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.add_circle_outline),
                title: const Text("Add in gallery"),
                onTap: () => Navigator.pushNamed(context, 'add_gallery')),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.add_circle_outline),
                title: const Text("Add in homepage images"),
                onTap: () => Navigator.pushNamed(context, 'add_homeimage')),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text("Orders List"),
                onTap: () => Navigator.pushNamed(context, 'view_orders')),
            const Divider(),
            ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text("Users List"),
                onTap: () => Navigator.pushNamed(context, 'view_users')),
            const Divider(),
            ListTile(
<<<<<<< HEAD
                leading: Icon(Icons.add_circle_outline),
                title: Text("Add Quality"),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddQualityPage()),
                    )),
            Divider(),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text("Qualities List"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewQualitiesPage()),
              ),
            ),
            Divider(),
            ListTile(
                leading: Icon(Icons.add_circle_outline),
                title: Text("Add in gallery"),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddGallery()),
                    )),
            Divider(),
            ListTile(
                leading: Icon(Icons.add_circle_outline),
                title: Text("Add in homepage images"),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddGalleryhome()),
                    )),
            Divider(),
            ListTile(
                leading: Icon(Icons.library_books),
                title: Text("Orders List"),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewOrdersPage()),
                    )),
            Divider(),
            ListTile(
                leading: Icon(Icons.library_books),
                title: Text("Users List"),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewUsersPage()),
                    )),
=======
                leading: const Icon(Icons.library_books),
                title: const Text("Messages List"),
                onTap: () => Navigator.pushNamed(context, 'view_messages')),
>>>>>>> 82b03952b86d220d374927e934dcfccc8f32cecc
          ],
        );
    }
  }
}
