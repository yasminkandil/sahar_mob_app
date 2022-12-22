import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/login_page.dart';
import 'package:sahar_mob_app/pages/navbar.dart';
import 'package:sahar_mob_app/pages/products_powerbank.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late DatabaseReference dbRef;
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child("Users");
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
            Expanded(
              flex: 1,
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
                            Map<String, String> users = {
                              "Firstname": _fisrtController.text,
                              "Lastname": _lastController.text,
                              "Email": _emailController.text,
                              "Address": _addrController.text,
                              "Mobile": _mobileController.text
                            };
                            dbRef.push().set(users);
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
                                        builder: (context) => PowerBank()));
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Already a member ? ",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            text: "Login",
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
