// ignore_for_file: dead_code

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/forgot_pass.dart';
import 'package:sahar_mob_app/pages/products_powerbank.dart';
import 'package:sahar_mob_app/pages/regi_page.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';
import 'package:sahar_mob_app/pages/navbar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
                  return Navigation_bar();
                }),
              );
            }),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Login"),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: IntrinsicHeight(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        _textInput(
                            controller: emailController,
                            hint: "Email",
                            icon: Icons.email,
                            torf: false),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: obscureText,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                prefixIcon: const Icon(Icons.vpn_key),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                  child: obscureText
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                )),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              child: const Text(
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 232, 127, 14)),
                                  "Forgot Password?"),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return const ForgotPass();
                                  }),
                                );
                              }),
                        ),
                        Expanded(
                          child: Center(
                            child: ButtonWidget(
                              onClick: () async {
                                User? user = await loginUsingEmailPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    context: context);
                                print(user);
                                if (user != null) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Navigation_bar()));
                                }
                              },
                              btnText: "LOGIN",
                            ),
                          ),
                        ),
                        InkWell(
                          child: RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                  text: "Don't have an account ? ",
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: "Register",
                                  style: TextStyle(color: orangeColors)),
                            ]),
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage())),
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

  Widget _textInput({controller, hint, icon, torf}) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 10),
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
}
