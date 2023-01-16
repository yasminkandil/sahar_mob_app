import 'package:flutter/material.dart';
import 'package:sahar_mob_app/home/home_button.dart';
import 'package:sahar_mob_app/read%20data/get_home_data.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final pro = FirebaseFirestore.instance.collection('gallery');

class HomeScreen extends StatefulWidget {
  final String salma;
  const HomeScreen({super.key, required this.salma});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
//Connection to Gallery
    List<String> imageList = [];
    Future getDocImage() async {
      await FirebaseFirestore.instance.collection('gallery').get().then(
            (snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              imageList.add(document.reference.id);
            }),
          );
    }

//Connection to offers
    CollectionReference off = FirebaseFirestore.instance.collection('products');
    Future<QuerySnapshot> retrieveLastFiveItems() async {
      return await FirebaseFirestore.instance
          .collection("products")
          .orderBy("Date", descending: true)
          .limit(5)
          .get();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(children: <Widget>[
          VxSwiper.builder(
            aspectRatio: 16 / 5,
            autoPlay: true,
            height: 150,
            enlargeCenterPage: true,
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              getDocImage();
              builder:
              (context, snapshot) {
                Map<String, dynamic> data = snapshot.data?.data() != null
                    ? snapshot.data!.data()! as Map<String, dynamic>
                    : <String, dynamic>{};
              };
              return Container(
                  child: GetHomePhoto(homeimage: imageList[index]));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              1,
              (index) => homeButton(
                width: context.screenWidth / 1.5,
                height: context.screenHeight * 0.12,
                icon: Icons.new_releases_sharp,
                title: 'New Arrival',
              ),
            ),
          ),
          Container(
//3shan yeb2oo fe center
            width: double.infinity,
            decoration: BoxDecoration(color: orangeColors),
            padding: const EdgeInsets.all(12),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  /*Text('NEW COLLECTIONS ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),*/
                  SizedBox(
                      child: Stack(children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.01),
                      padding: EdgeInsets.only(
                          top: size.height * 0.000001, left: 10, right: 10),
                      height: 500,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // children: <Widget>[],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        
                          FutureBuilder(
                              future: retrieveLastFiveItems(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                return Expanded(
                                  child: ListView.builder(
                                      itemCount: snapshot.data?.docs.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    35),
                                                            height: 200,
                                                            width: 200,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              //borderRadius: BorderRadius.circular(16)
                                                            ),
                                                            child: Image(
                                                                fit: BoxFit
                                                                    .fitWidth,
                                                                image: NetworkImage(
                                                                    "${snapshot.data?.docs[index].get('image')}")),
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    35),
                                                            width: 200,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            child: Text(
                                                                snapshot
                                                                        .data
                                                                        ?.docs[
                                                                            index]
                                                                        .get(
                                                                            'name') +
                                                                    snapshot
                                                                        .data
                                                                        ?.docs[
                                                                            index]
                                                                        .get(
                                                                            'brand'),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                          SizedBox(
                                                            width: 3,
                                                            height: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ]),
                                        );
                                      }),
                                );
                              })
                        ],
                      ),
                    )
                  ])),
                ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              1,
              (index) => homeButton(
                width: context.screenWidth / 1.5,
                height: context.screenHeight * 0.12,
                icon: Icons.new_releases_sharp,
                title: 'Flash Sales',
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
