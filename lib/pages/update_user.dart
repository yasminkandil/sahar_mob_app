import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sahar_mob_app/models/user_model.dart';
import 'package:sahar_mob_app/pages/view_account.dart';
import 'package:sahar_mob_app/user_auth.dart';
import 'package:sahar_mob_app/utils/color.dart';
import '../controllers/user_controller.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({super.key});
  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    //final userr = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.search),
        ),
      ), // AppBar
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder(
                future: controller.getUsers(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      UserModel users = snapshot.data as UserModel;
                      final firstname =
                          TextEditingController(text: users.firstname);
                      final lastname =
                          TextEditingController(text: users.lastname);
                      final email = TextEditingController(text: users.email);
                      final address =
                          TextEditingController(text: users.address);
                      return Column(
                        children: [
// -- IMAGE with ICON
                          const SizedBox(height: 50),
                          Form(
                            child: Column(
                              children: [
                                TextFormField(
                                  //TextEditingController(text: users.firstname);
                                  controller: firstname,
                                  //    initialValue: prods.capacity,
                                  // InputDecorati
                                ), // TextFormField const SizedBox(height: tFormHeight - 20), TextFormField(...), // TextFormField

                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: lastname,
                                  //   initialValue: prods.capacity,
//decoration: const InputDecoration(
                                  //Label: Text (tEna1l), prefixIcon: Icon(LineAwesomeIcons.envelope_1)), // Inputbecoration
                                ), // /7 TextFornField
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: email,
// decoration: const InputDecoration(
                                  //Label: Text (PhoneNo), prefixIcon: Icon(LineAwesomeIcons.phone)
                                ),
                                // InputDecoration ), // TextFornField
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: address,
// decoration: InputDecoration(
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      final userData = UserModel(
                                        firstname: firstname.text.trim(),
                                        lastname: lastname.text.trim(),
                                        email: email.text.trim(),
                                        address: address.text.trim(),
                                      ); // UserModel

                                      await controller.updateRecord(users);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: GreyColors,
                                      side: BorderSide.none,
                                    ),
                                    child: const Text(
                                      "edit",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Text('Salma..');
                    }
                  } else {
                    return Text('loading..');
                  }
                })),
      ),
    );
  }

  // TODO: implement createStat
}
