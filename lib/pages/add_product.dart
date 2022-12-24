import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:sahar_mob_app/pages/admin.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';
import "package:path/path.dart" as p;
//import 'package:sahar_mob_app/widgets/header_container.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  String selectedValC = 'Black';
  String selectedValQ = 'Original';
  String selectedValCat = 'Headphones';
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _aboutController = TextEditingController();
  final _priceController = TextEditingController();
  final _qualityController = TextEditingController();
  final _quantityController = TextEditingController();
  final _colorController = TextEditingController();
  final _categController = TextEditingController();

  List Listcolors = ['Black', 'Blue'];
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
  var imageUrl;
  var downloadUrl;
  var imagee;
  var greyimage =
      'https://www.google.com/search?q=profile+photo+&tbm=isch&ved=2ahUKEwis27rOz_76AhVFexoKHU2PBGoQ2-cCegQIABAA&oq=profile+photo+&gs_lcp=CgNpbWcQAzIECAAQQzIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDoGCAAQBxAeULwEWLwEYKoIaABwAHgAgAGZAYgBkwKSAQMwLjKYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=d4lZY-zDCsX2ac2ektAG&bih=657&biw=1366#imgrc=nfkyptoYx2OzJM';
  Future addProduct(
      String name,
      String description,
      String about,
      String quality,
      String color,
      String category,
      String price,
      String quantity,
      String prodimage) async {
    await FirebaseFirestore.instance.collection('products').doc().set({
      'name': name,
      'description': description,
      'about': about,
      'quality': quality,
      'color': color,
      'category': category,
      'price': int.parse(price),
      'quantity': int.parse(quantity),
      'image': prodimage,
    });
  }

  late String Cvalue;

  String getCValue() {
    return Cvalue;
  }

  late String Categvalue;

  String getCategValue() {
    return Categvalue;
  }

  late String Qvalue;

  String getQValue() {
    return Qvalue;
  }

  setImage(String imagee) {
    imagee = imagee;
  }

  getImage() {
    return imagee;
  }

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
        imageUrl = downloadUrl;
        greyimage = imageUrl;
        setImage(imageUrl);
        getImage();
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
                            fit: BoxFit.cover, image: NetworkImage(greyimage))),
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
                        _textInput(
                            controller: _nameController,
                            hint: "Product Name",
                            icon: Icons.edit_attributes_outlined),
                        _textInput(
                            controller: _descriptionController,
                            hint: "Description",
                            icon: Icons.edit_attributes_outlined),
                        _textInput(
                            controller: _aboutController,
                            hint: "About",
                            icon: Icons.edit_attributes_outlined),
                        _textInput(
                            controller: _priceController,
                            hint: "Price",
                            icon: Icons.money),
                        _textInput(
                            controller: _quantityController,
                            hint: "Quantity",
                            icon: Icons.numbers),
                        DropdownButtonFormField(
                          value: selectedValC,
                          items: Listcolors.map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              )).toList(),
                          onChanged: (val) {
                            setState(() {
                              selectedValC = val as String;
                              Cvalue = selectedValC;
                              getCValue();
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
                          value: selectedValQ,
                          items: ListQuality.map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              )).toList(),
                          onChanged: (val) {
                            setState(() {
                              selectedValQ = val as String;
                              Qvalue = selectedValQ;
                              getQValue();
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
                          value: selectedValCat,
                          items: ListCateg.map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              )).toList(),
                          onChanged: (val) {
                            setState(() {
                              selectedValCat = val as String;
                              Categvalue = selectedValCat;
                              getCategValue();
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
                                addProduct(
                                    _nameController.text,
                                    _descriptionController.text,
                                    _aboutController.text,
                                    getQValue(),
                                    getCValue(),
                                    getCategValue(),
                                    _priceController.text,
                                    _quantityController.text,
                                    greyimage);
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

  Widget _textInput({controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 2),
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
