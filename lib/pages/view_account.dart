import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/edit_account.dart';
import 'package:sahar_mob_app/pages/navbar.dart';
import 'package:sahar_mob_app/pages/regi_page.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';

import '../widgets/btn_widget.dart';

class ViewAccountPage extends StatefulWidget {
  const ViewAccountPage({super.key});

  @override
  State<ViewAccountPage> createState() => _ViewAccountPageState();
}

final user = FirebaseAuth.instance.currentUser!;
String userId = user.uid;

class _ViewAccountPageState extends State<ViewAccountPage> {
  final _emailController = TextEditingController();
  final _fisrtController = TextEditingController();
  final _lastController = TextEditingController();
  final _mobileController = TextEditingController();
  final _addrController = TextEditingController();
  //final userr = FirebaseAuth.instance.currentUser!;
  //String myDocId = userr.uid;
  Future updateUserDetails(String firstname, String lastname,
      String useraddress, String userPhoneNumber, String userImage) async {
    final updateUser =
        FirebaseFirestore.instance.collection('users').doc(userId);
    updateUser.update(
      {
        'firstname': firstname.trim(),
        'lastname': lastname.trim(),
        'mobile': int.parse(userPhoneNumber.trim()),
        'address': useraddress.trim(),
        'image': userImage,
      },
    );

    print('NEW USER REGISTERED WITH ID:');
  }

  @override
  Widget build(BuildContext context) {
    final userr = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Account'),
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
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: GreyColors,
              ),
              onPressed: () {})
        ],
      ),
      body: Container(
        child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where('email', isEqualTo: userr.email)
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data!.docs[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 110,
                                      height: 110,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 4, color: Colors.white),
                                          boxShadow: [
                                            BoxShadow(
                                                spreadRadius: 2,
                                                blurRadius: 10,
                                                color: Colors.black
                                                    .withOpacity(0.1))
                                          ],
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  '${data['image']}'))),
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
                                              Icons.edit,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              //uploadImage();
                                            },
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
// -- IMAGE with ICON
                              const SizedBox(height: 50),
                              Form(
                                child: Column(children: [
                                  Text(
                                    "First Name:",
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),

                                        //labelText: "First Name : ",
                                        hintText: '${data['firstname']}'),
                                    controller: _fisrtController,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Last Name:",
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        //   labelText: "Last Name",
                                        hintText: '${data['lastname']}\n'),
                                    controller: _lastController,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Email:",
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        // labelText: "Email : ",
                                        hintText: '${data['email']}\n'),
                                    controller: _emailController,
                                    enabled: false,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Address:",
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        // border: InputBorder.none,
                                        border: OutlineInputBorder(),
                                        //labelText: "Address",
                                        hintText: '${data['address']}\n'),
                                    controller: _addrController,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Mobile:",
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        // border: InputBorder.none,
                                        border: OutlineInputBorder(),
                                        //labelText: "Address",
                                        hintText: '${data['mobile']}\n'),
                                    controller: _mobileController,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  /*ButtonWidget(
                                    btnText: "Edit account",
                                    onClick: () {
                                      updateUserDetails(
                                              _fisrtController.text,
                                              _lastController.text,
                                              _addrController.text,
                                              _mobileController.text,
                                              '${data['image']}')
                                          .then(
                                        (value) {
                                          print("updated account");
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Navigation_bar()));
                                        },
                                      );
                                     
                                    },
                                  ),*/
                                  ListTile(
                                    title: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: ButtonWidget2(
                                            btnText: "Edit Account",
                                            onClick: () {
                                              updateUserDetails(
                                                      _fisrtController.text,
                                                      _lastController.text,
                                                      _addrController.text,
                                                      _mobileController.text,
                                                      '${data['image']}')
                                                  .then(
                                                (value) {
                                                  print("updated account");
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
                                        Expanded(
                                          child: ButtonWidgetdelete(
                                            btnText: "Delete Account",
                                            onClick: () {
                                              final deleteprod =
                                                  FirebaseFirestore.instance
                                                      .collection('users')
                                                      .doc(userId)
                                                      .delete()
                                                      .then((value) => Navigator
                                                          .pop(context));
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          );
                        });
                  } else {
                    return Text('loading..');
                  }
                })),
      ),
    );
  }
}
