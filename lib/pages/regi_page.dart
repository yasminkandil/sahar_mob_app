import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sahar_mob_app/models/uploadimage.dart';
import 'package:sahar_mob_app/pages/login_page.dart';
import 'package:sahar_mob_app/pages/navbar.dart';
import 'package:sahar_mob_app/pages/products_powerbank.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';
import 'package:path/path.dart' as p;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late DatabaseReference dbRef;
  var imageUrl;
  var downloadUrl;
  var imagee;
  var greyimage =
      'https://www.google.com/search?q=profile+photo+&tbm=isch&ved=2ahUKEwis27rOz_76AhVFexoKHU2PBGoQ2-cCegQIABAA&oq=profile+photo+&gs_lcp=CgNpbWcQAzIECAAQQzIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDoGCAAQBxAeULwEWLwEYKoIaABwAHgAgAGZAYgBkwKSAQMwLjKYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=d4lZY-zDCsX2ac2ektAG&bih=657&biw=1366#imgrc=nfkyptoYx2OzJM';
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child("users");
    //greyimage = imageUrl;
    //uploadImage();
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

      downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        imageUrl = downloadUrl;
        greyimage = imageUrl;
        setImage(imageUrl);
      });
    } else {
      print('No Path Received');
    }
  }

  Future addUserDetails(String firstname, String lastname, String userEmail,
      String useraddress, String userPhoneNumber, String userImage) async {
    await FirebaseFirestore.instance.collection('users').add(
      {
        'firstname': firstname,
        'lastname': lastname,
        'email': userEmail,
        'mobile': int.parse(userPhoneNumber),
        'address': useraddress,
        'image': userImage,
      },
    );

    print('NEW USER REGISTERED WITH ID:');
  }

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _fisrtController = TextEditingController();
    final _lastController = TextEditingController();
    final _confirmPassController = TextEditingController();
    final _mobileController = TextEditingController();
    final _addrController = TextEditingController();

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
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          children: <Widget>[
            HeaderContainer("Register"),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 110,
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
                    bottom: 0,
                    right: 0,
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.white,
                            ),
                            color: Colors.orange),
                        child: TextButton(
                          child: const Icon(
                            Icons.upload,
                            color: Colors.white,
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
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        _textInput(
                            controller: _fisrtController,
                            hint: "First Name",
                            icon: Icons.person,
                            torf: false),
                        _textInput(
                            controller: _lastController,
                            hint: "Last Name",
                            icon: Icons.person,
                            torf: false),
                        _textInput(
                            controller: _emailController,
                            hint: "Email",
                            icon: Icons.email,
                            torf: false),
                        _textInput(
                            controller: _mobileController,
                            hint: "Phone Number",
                            icon: Icons.call,
                            torf: false),
                        _textInput(
                            controller: _addrController,
                            hint: "Address",
                            icon: Icons.location_city,
                            torf: false),
                        _textInput(
                            controller: _passwordController,
                            hint: "Password",
                            icon: Icons.vpn_key,
                            torf: true),
                        _textInput(
                            controller: _confirmPassController,
                            hint: "Confirm Password",
                            icon: Icons.vpn_key,
                            torf: true),
                        Expanded(
                          child: Center(
                            child: ButtonWidget(
                              btnText: "REGISTER",
                              onClick: () {
                                addUserDetails(
                                    _fisrtController.text,
                                    _lastController.text,
                                    _emailController.text,
                                    _addrController.text,
                                    _mobileController.text,
                                    imageUrl);
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text)
                                    .then(
                                  (value) {
                                    print("Created new account");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Navigation_bar()));
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        InkWell(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Already a member ? ",
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                    color: orangeColors,
                                  )),
                            ]),
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => LoginPage())),
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

Widget _textInput({controller, hint, icon, torf}) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.white,
    ),
    padding: EdgeInsets.only(left: 10),
    child: TextFormField(
      obscureText: torf,
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        prefixIcon: Icon(icon),
      ),
    ),
  );
}
