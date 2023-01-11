import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sahar_mob_app/home/home_page.dart';
import 'package:sahar_mob_app/models/uploadimage.dart';
import 'package:sahar_mob_app/pages/login_page.dart';
import 'package:sahar_mob_app/home/navbar.dart';
import 'package:sahar_mob_app/pages/view_account.dart';
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
  late String fnameerrormssg = "Enter First Name";
  late String lnameerrormssg = "Enter Last Name";
  late String emailerrormssg = "Enter Email Correctly";
  late String addrerrormssg = "Enter Address";
  late String mobileerrormssg = "Enter Mobile Number Correctly";
  late String eregexp =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  late String aregexp = r'^[a-z A-Z]+$';
  late String mregexp = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$';
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  Future addUserDetails(
      String firstname,
      String lastname,
      String userEmail,
      String useraddress,
      String userPhoneNumber,
      String userImage,
      String id) async {
    await FirebaseFirestore.instance.collection('users').doc(id).set(
      {
        'firstname': firstname,
        'lastname': lastname,
        'email': userEmail,
        'mobile': int.parse(userPhoneNumber),
        'address': useraddress,
        'image': userImage,
        'id': id,
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

    bool obscureText = true;
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
                  return MyHomePage();
                }),
              );
            }),
      ),
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
                              torf: false,
                              errormssg: fnameerrormssg,
                              regexp: aregexp),
                          _textInput(
                              controller: _lastController,
                              hint: "Last Name",
                              icon: Icons.person,
                              torf: false,
                              errormssg: lnameerrormssg,
                              regexp: aregexp),
                          _textInput(
                              controller: _emailController,
                              hint: "Email",
                              icon: Icons.email,
                              torf: false,
                              errormssg: emailerrormssg,
                              regexp: eregexp),
                          _textInput(
                              controller: _mobileController,
                              hint: "Phone Number",
                              icon: Icons.call,
                              torf: false,
                              errormssg: mobileerrormssg,
                              regexp: mregexp),
                          _textInput(
                              controller: _addrController,
                              hint: "Address",
                              icon: Icons.location_city,
                              torf: false,
                              errormssg: addrerrormssg,
                              regexp: aregexp),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: obscureText,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  prefixIcon: const Icon(Icons.vpn_key),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        obscureText = !obscureText;
                                      });
                                    },
                                    child: Icon(obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    _passwordController.text.length < 6) {
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
                              controller: _confirmPassController,
                              obscureText: obscureText,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  prefixIcon: const Icon(Icons.vpn_key),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        obscureText = !obscureText;
                                      });
                                    },
                                    child: Icon(obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    _passwordController.text !=
                                        _confirmPassController.text) {
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
                                  if (formKey.currentState!.validate()) {
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: _emailController.text,
                                            password: _passwordController.text);
                                    //var uId = userr.uid;
                                    addUserDetails(
                                            _fisrtController.text,
                                            _lastController.text,
                                            _emailController.text,
                                            _addrController.text,
                                            _mobileController.text,
                                            greyimage,
                                            userId)
                                        .then((value) {
                                      print("Created new account");
                                      final snackBar = SnackBar(
                                          content: Text("Account Created.."));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyHomePage()));
                                    });
                                  }
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
      ),
    );
  }
}

Widget _textInput({controller, hint, icon, torf, errormssg, regexp}) {
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
      validator: (value) {
        bool Valid = RegExp(regexp).hasMatch(value!);
        if (value.isEmpty || !Valid) {
          return errormssg;
        } else {
          return null;
        }
      },
    ),
  );
}
