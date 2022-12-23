import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/edit_account.dart';
import 'package:sahar_mob_app/pages/navbar.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';

class ViewAccountPage extends StatefulWidget {
  @override
  _ViewAccountPageState createState() => _ViewAccountPageState();
}
class _ViewAccountPageState extends State<ViewAccountPage> {
  String? firstname = '';
  String? email = '';
  String? lastname = '';
  String? address = '';
  String? mobile = '';
  // bashoof ehh el user el online 3shan a select data beta3to mn database
  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance.collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get().then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          // bakhod data mn database w store it
                    address = snapshot.data()!['address'];
          email = snapshot.data()!['email'];

          firstname = snapshot.data()!['firstname'];
          lastname = snapshot.data()!['lastname'];
          mobile = snapshot.data()!['mobile'];
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Account'),
        backgroundColor: GreyColors,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: Colors.white,
              minRadius: 60.0,
              child: CircleAvatar(
                radius: 50.0,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Email:${email!}',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              IconButton(
                  onPressed: (){
  
                       }, 
                       icon: const Icon(Icons.edit),),
          ], ),

              const SizedBox(
                height: 10.0,
              ),
              Text(
                'First Name:' + firstname!,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),  
              IconButton(
                  onPressed: (){
  
                       }, 
                       icon: const Icon(Icons.edit),),
          ],
          
       
      ),
    );
  }
}
