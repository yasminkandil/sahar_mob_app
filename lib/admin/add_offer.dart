import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sahar_mob_app/admin/add_product.dart';
import 'package:sahar_mob_app/widgets/app_bar.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';
import 'package:sahar_mob_app/widgets/reg_textinput.dart';
import '../models/product_model.dart';
import '../widgets/textInput.dart';

class AddOfferPage extends StatefulWidget {
  const AddOfferPage({super.key, required this.prodid});
  final String prodid;
  @override
  _AddOfferPageState createState() => _AddOfferPageState();
}

class _AddOfferPageState extends State<AddOfferPage> {
  TextEditingController dateIn = TextEditingController();
  TextEditingController dateOut = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _percentageController = TextEditingController();
  String mregexp = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$';

  Future addOffer(String name, String productId, String description,
      String percentage, String datein, String dateout) async {
    await FirebaseFirestore.instance.collection('offers').doc().set({
      'name': name,
      'productId': productId,
      'description': description,
      'percentage': int.parse(percentage),
      'datein': datein,
      'dateout': dateout,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Add Category"),
      body: Form(
        key: formKey,
        child: Container(
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
                          RegTextInput(
                              controller: _nameController,
                              hint: "Offer Name",
                              icon: Icons.edit,
                              torf: false,
                              errormssg: errormssg,
                              regexp: aregexp,
                              enable: true),
                          RegTextInput(
                              controller: _descriptionController,
                              hint: "Description",
                              icon: Icons.edit,
                              torf: false,
                              errormssg: errormssg,
                              regexp: aregexp,
                              enable: true),
                          RegTextInput(
                              controller: _percentageController,
                              hint: "Percentage",
                              icon: Icons.percent,
                              torf: false,
                              errormssg: errormssg,
                              regexp: mregexp,
                              enable: true),
                          TextField(
                            controller: dateIn,
                            //editing controller of this TextField
                            decoration: const InputDecoration(
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
                                  dateIn.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            },
                          ),
                          TextField(
                            controller: dateOut,
                            //editing controller of this TextField
                            decoration: InputDecoration(
                                icon: Icon(
                                    color: Colors.orange,
                                    Icons.calendar_today), //icon of text field
                                labelText:
                                    "Enter End Date" //label text of field
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
                                  dateOut.text =
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
                                  if (formKey.currentState!.validate()) {
                                    addOffer(
                                            _nameController.text,
                                            widget.prodid,
                                            _descriptionController.text,
                                            _percentageController.text,
                                            dateIn.text,
                                            dateOut.text)
                                        .then(
                                            (value) => Navigator.pop(context));
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
