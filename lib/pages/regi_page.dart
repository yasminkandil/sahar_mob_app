import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sahar_mob_app/models/user_model.dart';
import 'package:sahar_mob_app/pages/view_account.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';
import 'package:path/path.dart' as p;
import 'package:sahar_mob_app/widgets/reg_textinput.dart';

import '../widgets/alert.dart';
import '../widgets/app_bar.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

var imageUrl;
var downloadUrl;
var imagee;
var greyimage =
    'https://www.google.com/search?q=profile+photo+&tbm=isch&ved=2ahUKEwis27rOz_76AhVFexoKHU2PBGoQ2-cCegQIABAA&oq=profile+photo+&gs_lcp=CgNpbWcQAzIECAAQQzIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDoGCAAQBxAeULwEWLwEYKoIaABwAHgAgAGZAYgBkwKSAQMwLjKYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=d4lZY-zDCsX2ac2ektAG&bih=657&biw=1366#imgrc=nfkyptoYx2OzJM';

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child("users");
  }

  int randomm() {
    var rng = Random();
    int num = 0;
    for (var i = 0; i < 10; i++) {
      num = rng.nextInt(100);
    }
    return num;
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

  /*@override
  void dispose() {
    // * TextEditingControllers should be always disposed
    emailController.dispose();
    passwordController.dispose();
    fisrtController.dispose();
    mobileController.dispose();
    addrController.dispose();
    lastController.dispose();
    confirmPassController.dispose();

    super.dispose();
  }*/
  bool _obscureText = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: ""),
      body: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Form(
          key: formKey,
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
                              fit: BoxFit.cover,
                              image: NetworkImage(greyimage))),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          height: 40,
                          width: 50,
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
                          RegTextInput(
                            controller: fisrtController,
                            hint: "First Name",
                            icon: Icons.person,
                            torf: false,
                            errormssg: fnameerrormssg,
                            regexp: aregexp,
                            enable: true,
                          ),
                          RegTextInput(
                            controller: lastController,
                            hint: "Last Name",
                            icon: Icons.person,
                            torf: false,
                            errormssg: lnameerrormssg,
                            regexp: aregexp,
                            enable: true,
                          ),
                          RegTextInput(
                            controller: emailController,
                            hint: "Email",
                            icon: Icons.email,
                            torf: false,
                            errormssg: emailerrormssg,
                            regexp: eregexp,
                            enable: true,
                          ),
                          RegTextInput(
                            controller: mobileController,
                            hint: "Phone Number",
                            icon: Icons.call,
                            torf: false,
                            errormssg: mobileerrormssg,
                            regexp: mregexp,
                            enable: true,
                          ),
                          RegTextInput(
                            controller: addrController,
                            hint: "Address",
                            icon: Icons.location_city,
                            torf: false,
                            errormssg: addrerrormssg,
                            regexp: aregexp,
                            enable: true,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  prefixIcon: const Icon(
                                    Icons.vpn_key,
                                    color: Color.fromARGB(255, 249, 118, 3),
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Icon(_obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    passwordController.text.length < 6) {
                                  return "Password must not be less than 6 characters";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: confirmPassController,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Confirm Password",
                                prefixIcon: const Icon(
                                  Icons.vpn_key,
                                  color: Color.fromARGB(255, 249, 118, 3),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: _togglePasswordVisibility,
                                  child: _obscureText
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    passwordController.text !=
                                        confirmPassController.text) {
                                  return "Password and Confirm Password Don't Match";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: ButtonWidget(
                                btnText: "REGISTER",
                                onClick: () async {
                                  try {
                                    if (formKey.currentState!.validate()) {
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);

                                      String email =
                                          emailController.text.trim();
                                      final userr = await FirebaseAuth.instance
                                          .fetchSignInMethodsForEmail(email);
                                      addUserDetails(
                                              fisrtController.text,
                                              lastController.text,
                                              emailController.text,
                                              addrController.text,
                                              mobileController.text,
                                              greyimage,
                                              userId)
                                          .then((value) {
                                        print("Created new account");
                                        Fluttertoast.showToast(
                                          msg: "Account created...",
                                          backgroundColor: orangeColors);
                                        Navigator.pushNamed(context, 'home');
                                      });
                                      //}
                                    }
                                  } catch (e) {
                                    if (e is FirebaseAuthException) {
                                      if (e.code == 'weak-password') {
                                        showAlertDialog(context,
                                            "The password provided is too weak.");
                                      } else if (e.code ==
                                          'email-already-in-use') {
                                        showAlertDialog(context,
                                            "Account already exists for that email.");
                                      }
                                    } else {
                                      print(e);
                                    }
                                  }
                                },
                              ),
                            ),
                          ),
                          InkWell(
                            child: RichText(
                              text: TextSpan(children: [
                                const TextSpan(
                                    text: "Already a member ? ",
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: "Login",
                                    style: TextStyle(
                                      color: orangeColors,
                                    )),
                              ]),
                            ),
                            onTap: () => Navigator.pushNamed(context, 'login'),
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
      ),
    );
  }
}
