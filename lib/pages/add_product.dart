import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';
//import 'package:sahar_mob_app/widgets/header_container.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  String selectedValC = 'black';
  String selectedValQ = 'Original';
  String selectedValCat = 'Headphones';

  List Listcolors = ['black', 'blue'];
  List ListCateg = [
    'Headphones',
    'PowerBank',
    'Speakers',
    'Chargers',
    'Cables',
    'Memory',
    'Maintanance'
  ];
  List ListQuality = ['Original', 'HighCopy'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          children: <Widget>[
            // HeaderContainer("Register"),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 140,
                    height: 110,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://www.google.com/search?q=profile+photo+&tbm=isch&ved=2ahUKEwis27rOz_76AhVFexoKHU2PBGoQ2-cCegQIABAA&oq=profile+photo+&gs_lcp=CgNpbWcQAzIECAAQQzIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDoGCAAQBxAeULwEWLwEYKoIaABwAHgAgAGZAYgBkwKSAQMwLjKYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=d4lZY-zDCsX2ac2ektAG&bih=657&biw=1366#imgrc=nfkyptoYx2OzJM'))),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            ),
                            color: Colors.orange),
                        child: Icon(
                          Icons.upload,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(hint: "Product Name", icon: Icons.person),
                    _textInput(hint: "Description", icon: Icons.person),
                    _textInput(hint: "About", icon: Icons.email),
                    _textInput(hint: "Price", icon: Icons.call),
                    _textInput(hint: "Quantity", icon: Icons.location_city),
                    _dropDown(
                      hint: "colors",
                      icon: Icons.border_color,
                      listt: Listcolors,
                      select: "black",
                    ),
                    _dropDown(
                      hint: "Quality",
                      icon: Icons.high_quality,
                      listt: ListQuality,
                      select: "Original",
                    ),
                    _dropDown(
                      hint: "Category",
                      icon: Icons.category,
                      listt: ListCateg,
                      select: "Headphones",
                    ),
                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          btnText: "Add Product",
                          onClick: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "want to edit product ? ",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: "Edit",
                            
                            style: TextStyle(color: orangeColors)),
                            
                      ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: Color.fromARGB(255, 249, 118, 3),
          ),
        ),
      ),
    );
  }

  Widget _dropDown({hint, icon, required List listt, required String select}) {
    return DropdownButtonFormField(
      value: select,
      items: listt
          .map((e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ))
          .toList(),
      onChanged: (val) {
        setState(() {
          select = val as String;
        });
      },
      icon: const Icon(
        Icons.arrow_drop_down_circle,
        color: Color.fromARGB(255, 249, 118, 3),
      ),
      dropdownColor: Color.fromARGB(255, 249, 118, 3),
      decoration: InputDecoration(
          labelText: hint,
          prefixIcon: Icon(
            icon,
            color: Color.fromARGB(255, 249, 118, 3),
          ),
          border: UnderlineInputBorder()),
    );
  }
}
