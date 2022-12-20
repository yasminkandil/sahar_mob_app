import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';

class CartItem extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int counter = 1;

  void incrementCounter() {
    setState(() {
      if (counter == 99) {
        return null;
      }
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter == 0) {
        return null;
      }
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HeaderContainer("My Cart"),
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://www.styleathome.com/assets/img/default.jpg?v=1522265967'))),
        ),
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('Essential Kits',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '\$',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: GestureDetector(
                        onTap: decrementCounter,
                        child: Icon(
                          Icons.remove_circle,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 6, right: 6),
                      child: Text(
                        '$counter',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: GestureDetector(
                        onTap: incrementCounter,
                        child: Icon(
                          Icons.add_circle,
                          color: Colors.white,
                          size: 30,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
    
  }
  /*ListView(
          children: const [
            ListTile(
              title: Text("Iphone case"),
              subtitle: Text("200 LE"),
              leading:
                  Icon(Icons.arrow_forward_ios_rounded), //icon in the beginning
            ),
            ListTile(
              title: Text("Airpodes"),
              subtitle: Text("2500"),
              trailing: Icon(Icons.auto_awesome), //icon in the end
            ),
            ListTile(
              title: Text("Headphones"),
              subtitle: Text("750"),
              trailing: Icon(Icons.audiotrack), //icon in the end
            ),
          ],
        ),*/
}
