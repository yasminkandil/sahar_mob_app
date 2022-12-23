import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sahar_mob_app/pages/admin.dart';
//import 'package:image_picker/image_picker.dart';

import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';
//import 'package:sahar_mob_app/widgets/header_container.dart';

class AddOfferPage extends StatefulWidget {
  @override
  _AddOfferPageState createState() => _AddOfferPageState();
}

class _AddOfferPageState extends State<AddOfferPage> {
  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Offer'),
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
                return Admin();
              }),
            );
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: GreyColors,
              ),
              onPressed: () {})
        ],
      ),
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
              child: SingleChildScrollView(
                child: IntrinsicHeight(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        _textInput(hint: "Offer Name", icon: Icons.edit),
                        _textInput(hint: "Description", icon: Icons.edit),
                        _textInput(hint: "Percentage", icon: Icons.percent),
                        TextField(
                          controller: dateInput,
                          //editing controller of this TextField
                          decoration: InputDecoration(
                              icon: Icon(
                                  color: Colors.orange,
                                  Icons.calendar_today), //icon of text field
                              labelText:
                                  "Enter Start Date" //label text of field
                              ),

                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              setState(() {
                                dateInput.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                        ),
                        TextField(
                          controller: dateInput,
                          //editing controller of this TextField
                          decoration: InputDecoration(
                              icon: Icon(
                                  color: Colors.orange,
                                  Icons.calendar_today), //icon of text field
                              labelText: "Enter End Date" //label text of field
                              ),

                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              setState(() {
                                dateInput.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                        ),
                        Expanded(
                          child: Center(
                            child: ButtonWidget(
                              btnText: "Add Offer",
                              onClick: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "want to edit offer ? ",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                                text: "Edit",
                                style: TextStyle(color: orangeColors)),
                          ]),
                        )
                      ],
                    ),
                  ),
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
}
