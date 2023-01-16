import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/utils/color.dart';

class FirebaseSearchScreen extends StatefulWidget {
  const FirebaseSearchScreen({Key? key}) : super(key: key);
  @override
  State<FirebaseSearchScreen> createState() => _FirebaseSearchScreenState();
}

class _FirebaseSearchScreenState extends State<FirebaseSearchScreen> {
  List searchResult = [];
  void searchForProduct(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('products')
        .where('name', isGreaterThanOrEqualTo: query)
        .get();
    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
          backgroundColor: GreyColors,
        title: const Text("Search"),
      ),
      body: Column(
        
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search Here",
              ),
              onChanged: (query) {
                searchForProduct(query);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResult[index]['brand']),
                  subtitle: Text(searchResult[index]['name']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  
}
