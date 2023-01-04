import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sahar_mob_app/pages/admin.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';
import "package:path/path.dart" as p;
import 'package:sahar_mob_app/widgets/textInput.dart';
import '../models/product_model.dart' as pp;

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

  @override
  Widget build(BuildContext context) {
    Widget colorr;
    Widget qualityy;
    Widget categoryy;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
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
            }),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 5),
        child: Column(
          children: <Widget>[
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
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            ),
                            color: Colors.orange),
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
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: IntrinsicHeight(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        TextInput(
                            controller: pp.nameController,
                            hint: "Product Name",
                            icon: Icons.edit_attributes_outlined),
                        TextInput(
                            controller: pp.descriptionController,
                            hint: "Description",
                            icon: Icons.edit_attributes_outlined),
                        TextInput(
                            controller: pp.aboutController,
                            hint: "Brand",
                            icon: Icons.edit_attributes_outlined),
                        TextInput(
                            controller: pp.priceController,
                            hint: "Price",
                            icon: Icons.money),
                        TextInput(
                            controller: pp.quantityController,
                            hint: "Quantity",
                            icon: Icons.numbers),
                        DropdownButtonFormField(
                          value: pp.selectedValC,
                          items: pp.Listcolors.map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              )).toList(),
                          onChanged: (val) {
                            setState(() {
                              pp.selectedValC = val as String;
                              pp.Cvalue = pp.selectedValC;
                              pp.getCValue();
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down_circle,
                            color: Color.fromARGB(255, 249, 118, 3),
                          ),
                          dropdownColor: Color.fromARGB(255, 249, 118, 3),
                          decoration: const InputDecoration(
                              labelText: "Colors",
                              prefixIcon: Icon(
                                Icons.color_lens,
                                color: Color.fromARGB(255, 249, 118, 3),
                              ),
                              border: UnderlineInputBorder()),
                        ),
                        DropdownButtonFormField(
                          value: pp.selectedValQ,
                          items: pp.ListQuality.map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              )).toList(),
                          onChanged: (val) {
                            setState(() {
                              pp.selectedValQ = val as String;
                              pp.Qvalue = pp.selectedValQ;
                              pp.getQValue();
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down_circle,
                            color: Color.fromARGB(255, 249, 118, 3),
                          ),
                          dropdownColor: Color.fromARGB(255, 249, 118, 3),
                          decoration: const InputDecoration(
                              labelText: "Quality",
                              prefixIcon: Icon(
                                Icons.high_quality,
                                color: Color.fromARGB(255, 249, 118, 3),
                              ),
                              border: UnderlineInputBorder()),
                        ),
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
                                pp.addProduct(
                                    pp.nameController.text,
                                    pp.descriptionController.text,
                                    pp.aboutController.text,
                                    pp.getQValue(),
                                    pp.getCValue(),
                                    pp.getCategValue(),
                                    pp.priceController.text,
                                    pp.quantityController.text,
                                    pp.greyimage);
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
