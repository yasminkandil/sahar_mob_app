import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class GetHomePhoto extends StatelessWidget {
  final String homeimage;
  GetHomePhoto({required this.homeimage});

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('homePage');
    return FutureBuilder<DocumentSnapshot>(
      future: products.doc(homeimage).get(),
      builder: ((context, snapshot) {
        // if (snapshot.hasError) {
        //   return Center(child: CircularProgressIndicator());
        // }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
       
       else if (snapshot.connectionState == ConnectionState.done) {
          
          Map<String, dynamic> data = snapshot.data?.data() != null
              ? snapshot.data!.data()! as Map<String, dynamic>
              : <String, dynamic>{};
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(data['image']),
                fit: BoxFit.cover,
              ),
            ),
          );
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}

//Class to get offers data
class GetOfferPage extends StatefulWidget {
  //final Function press;
  GetOfferPage();
  @override
  _GetOfferPageState createState() => _GetOfferPageState();
}

class _GetOfferPageState extends State<GetOfferPage> {
  @override
  Widget build(BuildContext context) {
    List<String> OfferImageList = [];

    return Scaffold(
        body: FutureBuilder(
            future: retrieveLastFiveItems(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(35),
                                        height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          //borderRadius: BorderRadius.circular(16)
                                        ),
                                        child: Image(
                                            fit: BoxFit.fitWidth,
                                            image: NetworkImage(
                                                "${snapshot.data?.docs[index].get('image')}")),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(35),
                                        width: 200,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                        ),
                                        child: Text(
                                            snapshot.data?.docs[index]
                                                    .get('name') +
                                                snapshot.data?.docs[index]
                                                    .get('brand'),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
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
                  });
            }));
  }
}

CollectionReference offproduct =
    FirebaseFirestore.instance.collection('products');
Future<QuerySnapshot> retrieveLastFiveItems() async {
  return await FirebaseFirestore.instance
      .collection("products")
      .orderBy("Date", descending: true)
      .limit(5)
      .get();
}
