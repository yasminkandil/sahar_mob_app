import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/add_category.dart';
import 'package:sahar_mob_app/pages/add_color.dart';
import 'package:sahar_mob_app/pages/add_offer.dart';
import 'package:sahar_mob_app/pages/add_product.dart';
import 'package:sahar_mob_app/pages/add_quality.dart';
import 'package:sahar_mob_app/pages/calendar.dart';
import 'package:sahar_mob_app/pages/orders_admin.dart';
import 'package:sahar_mob_app/pages/products_powerbank.dart';
import 'package:sahar_mob_app/pages/view_product.dart';
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
                              label: Text("Categories")),
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
                            '5',
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
                leading: Icon(Icons.add),
                title: Text("Add product"),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddProductPage()),
                    )),
            Divider(),
            ListTile(
              leading: Icon(Icons.change_history),
              title: Text("Products list"),
              onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ViewProductPage())
              ),
            ),
            Divider(),
            ListTile(
                leading: Icon(Icons.add_circle),
                title: Text("Add category"),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCategPage()),
                    )),
            Divider(),
            ListTile(
              leading: Icon(Icons.category),
              title: Text("Category list"),
              onTap: () {},
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
              onTap: () {},
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
              title: Text("offers List"),
              onTap: () {},
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
              onTap: () {},
            ),
            Divider(),
            ListTile(
                leading: Icon(Icons.date_range),
                title: Text("In Fix"),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PowerBank()),
                    )),
            Divider(),
            ListTile(
                leading: Icon(Icons.library_books),
                title: Text("Orders"),
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewOrdersPage()),
                    )),
          ],
        );
    }
  }
}
