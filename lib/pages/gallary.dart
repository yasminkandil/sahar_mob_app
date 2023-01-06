import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/navbar.dart';
import 'package:sahar_mob_app/read%20data/get_gallery_data.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'gallery_details_page.dart';

final pro = FirebaseFirestore.instance.collection('gallery');

List<String> _imagess = [];

Future getDocImage() async {
  await FirebaseFirestore.instance.collection('gallery').get().then(
        (snapshot) => snapshot.docs.forEach((document) {
          print(document.reference);
          _imagess.add(document.reference.id);
        }),
      );
}

class gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      backgroundColor: orangeColors,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              'Gallery',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: FutureBuilder(
                  future: getDocImage(),
                  builder: (context, snapshot) {
                    Map<String, dynamic> data = snapshot.data?.data() != null
                        ? snapshot.data!.data()! as Map<String, dynamic>
                        : <String, dynamic>{};
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return RawMaterialButton(
                            onPressed: () {},
                            child: Hero(
                                tag: 'logo',
                                child: GetGallery(imagee: _imagess[index])),
                          );
                        },
                        itemCount: _imagess.length,
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
