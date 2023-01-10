import 'package:flutter/material.dart';
import 'package:sahar_mob_app/admin/add_category.dart';
import 'package:sahar_mob_app/admin/add_color.dart';
import 'package:sahar_mob_app/admin/add_gallery.dart';
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
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/pages/navbar.dart';

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
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
                    return Navigation_bar();
                  }),
                );
              }),

          title: Row(
            children: <Widget>[
              Expanded(
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 234, 119, 18)),
                      ),
                      onPressed: () {
                        setState(() => _selectedPage = Page.dashboard);
                      },
                      icon: Icon(Icons.dashboard, color: Colors.white),
                      label: Text('Dashboard'))),
              Expanded(
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 234, 119, 18)),
                      ),
                      onPressed: () {
                        setState(() => _selectedPage = Page.manage);
                      },
                      icon: Icon(Icons.sort, color: Colors.white),
                      label: Text('Manage'))),
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
                icon: Icon(
                  Icons.attach_money,
                  size: 30.0,
                  color: Colors.black,
                ),
                label: Text('12,000',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0, color: orangeColors)),
              ),
              title: Text(
                'Revenue',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, color: Colors.black),
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: ListTile(
                          title: ElevatedButton.icon(
                              onPressed: null,
                              icon: Icon(Icons.people_outline),
                              label: Text("Users")),
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
                              icon: Icon(Icons.category),
                              label: Text("Categorie")),
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
                              icon: Icon(Icons.track_changes),
                              label: Text("Products")),
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
                              icon: Icon(Icons.date_range),
                              label: Text("In Fix")),
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
                              icon: Icon(Icons.shopping_cart),
                              label: Text("Orders")),
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
                              icon: Icon(Icons.close),
                              label: Text("Return")),
                          subtitle: Text(
                            '0',
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
                leading: Icon(Icons.add_circle_outline),
                title: Text("Add product"),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddProductPage()),
                    )),
            Divider(),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text("Products list"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ViewProductPage())),
            ),
            Divider(),
            ListTile(
                leading: Icon(Icons.add_circle_outline),
                title: Text("Add category"),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCategPage()),
                    )),
            Divider(),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text("Category list"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewCategoriesPage()),
              ),
            ),
            Divider(),
            ListTile(
                leading: Icon(Icons.add_circle_outline),
                title: Text("Add Color"),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddColorPage()),
                    )),
            Divider(),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text("Colors List"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewcolorsPage()),
              ),
            ),
            Divider(),
            ListTile(
                leading: Icon(Icons.add_circle_outline),
                title: Text("Add Offer"),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddOfferPage()),
                    )),
            Divider(),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text("Offers List"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ViewOffersPage())),
            ),
            Divider(),
            ListTile(
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
          ],
        );
    }
  }
}
