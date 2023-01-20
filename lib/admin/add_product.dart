import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sahar_mob_app/admin/admin.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/alert.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';
import "package:path/path.dart" as p;
import 'package:sahar_mob_app/widgets/textInput.dart';
import '../models/product_model.dart' as pp;
import '../models/product_model.dart';
import '../widgets/app_bar.dart';
import '../widgets/reg_textinput.dart';

final formKey = GlobalKey<FormState>();
String mregexp = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile? image;

    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    //Select Image
    image = await _picker.getImage(source: ImageSource.gallery);
    var file = File(image!.path);

    if (image != null) {
      //Upload to Firebase
      var snapshot =
          await _storage.ref().child(p.basename(image.path)).putFile(file);

      var downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        pp.imageUrl = downloadUrl;
        pp.greyimage = pp.imageUrl;
        pp.setImage(pp.imageUrl);
        pp.getImage();
      });
    } else {
      print('No Path Received');
    }
  }

  uploadImage2() async {
    final _storage2 = FirebaseStorage.instance;
    final _picker2 = ImagePicker();
    PickedFile? image2;

    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    //Select Image
    image2 = await _picker2.getImage(source: ImageSource.gallery);
    var file = File(image2!.path);

    if (image2 != null) {
      //Upload to Firebase
      var snapshot =
          await _storage2.ref().child(p.basename(image2.path)).putFile(file);

      var downloadUrl2 = await snapshot.ref.getDownloadURL();

      setState(() {
        pp.imageUrl2 = downloadUrl2;
        pp.greyimage2 = pp.imageUrl2;
        pp.setImage2(pp.imageUrl2);
        pp.getImage2();
      });
    } else {
      print('No Path Received');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget colorr;
    Widget qualityy;
    Widget categoryy;
    return Scaffold(
      appBar: CustomAppBar(text: "Add Product"),
      body: Container(
        padding: EdgeInsets.only(bottom: 5),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                                  image: NetworkImage(pp.greyimage))),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                              height: 40,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                  color: orangeColors),
                              child: TextButton(
                                child: Center(
                                  child: Icon(
                                    Icons.upload,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  uploadImage();
                                },
                              )),
                        )
                      ],
                    ),
                  ),
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
                                  image: NetworkImage(pp.greyimage2))),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                              height: 40,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                  color: orangeColors),
                              child: TextButton(
                                child: Center(
                                  child: Icon(
                                    Icons.upload,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  uploadImage2();
                                },
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: formKey,
              child: Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: IntrinsicHeight(
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          RegTextInput(
                              controller: pp.nameController,
                              hint: "Product Name",
                              icon: Icons.edit_attributes_outlined,
                              torf: false,
                              errormssg: errormssg,
                              regexp: aregexp,
                              enable: true),
                          RegTextInput(
                              controller: pp.descriptionController,
                              hint: "Description",
                              icon: Icons.edit_attributes_outlined,
                              torf: false,
                              errormssg: errormssg,
                              regexp: aregexp,
                              enable: true),
                          RegTextInput(
                              controller: pp.aboutController,
                              hint: "Brand",
                              icon: Icons.edit_attributes_outlined,
                              torf: false,
                              errormssg: errormssg,
                              regexp: aregexp,
                              enable: true),
                          RegTextInput(
                              controller: pp.priceController,
                              hint: "Price",
                              icon: Icons.money,
                              torf: false,
                              errormssg: errormssg,
                              regexp: mregexp,
                              enable: true),
                          RegTextInput(
                              controller: pp.quantityController,
                              hint: "Quantity",
                              icon: Icons.numbers,
                              torf: false,
                              errormssg: errormssg,
                              regexp: mregexp,
                              enable: true),
                          RegTextInput(
                              controller: pp.colorController,
                              hint: "Colors",
                              icon: Icons.color_lens,
                              torf: false,
                              errormssg: errormssg,
                              regexp: aregexp,
                              enable: true),
                          RegTextInput(
                              controller: pp.qualityController,
                              hint: "Quality",
                              icon: Icons.category,
                              torf: false,
                              errormssg: errormssg,
                              regexp: aregexp,
                              enable: true),
                          DropdownButtonFormField(
                            value: pp.selectedValCat,
                            items: pp.ListCateg.map((e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                )).toList(),
                            onChanged: (val) {
                              setState(() {
                                pp.selectedValCat = val as String;
                                pp.Categvalue = pp.selectedValCat;
                                pp.getCategValue();
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down_circle,
                              color: Color.fromARGB(255, 249, 118, 3),
                            ),
                            dropdownColor: Color.fromARGB(255, 249, 118, 3),
                            decoration: const InputDecoration(
                                labelText: "Categories",
                                prefixIcon: Icon(
                                  Icons.category,
                                  color: Color.fromARGB(255, 249, 118, 3),
                                ),
                                border: UnderlineInputBorder()),
                          ),
                          Expanded(
                            child: Center(
                              child: ButtonWidget(
                                btnText: "Add Product",
                                onClick: () {
                                  if (formKey.currentState!.validate()) {
                                    if (pp.getCategValue() != null) {
                                      pp
                                          .addProduct(
                                        pp.nameController.text,
                                        pp.descriptionController.text,
                                        pp.aboutController.text,
                                        pp.qualityController.text,
                                        pp.colorController.text,
                                        pp.getCategValue(),
                                        pp.priceController.text,
                                        pp.quantityController.text,
                                        pp.greyimage,
                                        DateTime.now().toString(),
                                        pp.greyimage2,
                                      )
                                          .then((value) {
                                        Fluttertoast.showToast(
                                          msg: "Product addedd...",
                                          backgroundColor: orangeColors);
                                        Navigator.pop(context);
                                      });
                                    } else {
                                      return showAlertDialog(
                                          context, "Please choose category");
                                    }
                                  }
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
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
