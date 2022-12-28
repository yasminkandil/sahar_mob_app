// ignore_for_file: dead_code

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/models/auth_service.dart';
import 'package:sahar_mob_app/pages/admin.dart';
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
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
        final snackBar = SnackBar(content: const Text('No user found!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'wrong-password') {
        print("wrong password");
        final snackBar = SnackBar(content: const Text('Wrong Password!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
      key: _scaffoldKey,
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
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              HeaderContainer("Login"),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: IntrinsicHeight(
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          textInput(
                              controller: emailController,
                              hint: "Email",
                              icon: Icons.email,
                              torf: false),
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
                                    passwordController.text.length < 6) {
                                  return "Password must not be less than 6 characters";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                child: const Text(
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 232, 127, 14)),
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
                                  if (user != null &&
                                      emailController.text ==
                                          "sahar@gmail.com") {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => Admin()));
                                  } else if (user != null) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Navigation_bar()));
                                  }
                                  if (formKey.currentState!.validate()) {
                                    final snackBar =
                                        SnackBar(content: Text("Logging in.."));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                },
                                btnText: "LOGIN",
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: orangeLightColors,
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 64, 64, 64),
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              AuthService().signInWithGoogle();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Navigation_bar()));
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Login with Google'),
                                SizedBox(
                                  width: 2,
                                ),
                                const Image(
                                  image: NetworkImage(
                                      'https://image.similarpng.com/very-thumbnail/2020/12/Colorful-google-logo-design-on-transparent-PNG-1.png'),
                                  width: 20,
                                  height: 20,
                                ),
                              ],
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
      ),
    );
  }

  Widget textInput({controller, hint, icon, torf}) {
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
        validator: (value) {
          bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value!);
          if (value.isEmpty || !emailValid) {
            return "Enter Email Correctly";
          } else {
            return null;
          }
        },
      ),
    );
  }
}
