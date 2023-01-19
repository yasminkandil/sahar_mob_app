import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/admin/add_product.dart';
import 'package:sahar_mob_app/widgets/app_bar.dart';
import 'package:sahar_mob_app/widgets/btn_widget.dart';
import '../models/product_model.dart';
import '../widgets/reg_textinput.dart';
//import 'package:sahar_mob_app/widgets/header_container.dart';

class AddCategPage extends StatefulWidget {
  @override
  _AddCategPageState createState() => _AddCategPageState();
}

class _AddCategPageState extends State<AddCategPage> {
  final _nameController = TextEditingController();
  final _subtitleController = TextEditingController();
  Future addCategory(String name, String subtitle) async {
    await FirebaseFirestore.instance.collection('categories').doc().set({
      'name': name,
      'subtitle': subtitle,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Add Category"),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            children: <Widget>[
              // HeaderContainer("Register"),
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
                              image: NetworkImage(
                                  'https://www.google.com/search?q=profile+photo+&tbm=isch&ved=2ahUKEwis27rOz_76AhVFexoKHU2PBGoQ2-cCegQIABAA&oq=profile+photo+&gs_lcp=CgNpbWcQAzIECAAQQzIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDoGCAAQBxAeULwEWLwEYKoIaABwAHgAgAGZAYgBkwKSAQMwLjKYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=d4lZY-zDCsX2ac2ektAG&bih=657&biw=1366#imgrc=nfkyptoYx2OzJM'))),
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
                          child: Icon(
                            Icons.upload,
                            color: Colors.white,
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
                          RegTextInput(
                              controller: _nameController,
                              hint: "Category Name",
                              icon: Icons.category,
                              torf: false,
                              errormssg: errormssg,
                              regexp: aregexp,
                              enable: true),
                          RegTextInput(
                              controller: _subtitleController,
                              hint: "Category Subtitle",
                              icon: Icons.category,
                              torf: false,
                              errormssg: errormssg,
                              regexp: aregexp,
                              enable: true),
                          Center(
                            child: ListTile(
                              title: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Expanded(
                                    child: ButtonWidget2(
                                      btnText: "Add Category",
                                      onClick: () {
                                        if (formKey.currentState!.validate()) {
                                          addCategory(_nameController.text,
                                                  _subtitleController.text)
                                              .then((value) {
                                            final snackBar = SnackBar(
                                                content:
                                                    Text("Category added.."));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                            Navigator.pop(context);
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
