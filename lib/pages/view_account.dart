import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/edit_account.dart';
import 'package:sahar_mob_app/read%20data/get_user_name.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';

class ViewAccountPage extends StatefulWidget {
  const ViewAccountPage({super.key});

  @override
  _ViewAccountPageState createState() => _ViewAccountPageState();
}

class _ViewAccountPageState extends State<ViewAccountPage> {
  //final FirebaseAuth _auth = FirebaseAuth.instance;
 
  final userr =FirebaseAuth.instance.currentUser!;
  // bashoof ehh el user el online 3shan a select data beta3to mn database
  /*
  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance.collection('users')
        .doc(FirebaseAuth.instance.currentUser!.email)
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
  }*/
List<String> docIDs = [];
Future getDocId() async{
  await FirebaseFirestore.instance.collection('users').get().
  then((snapshot) => snapshot.docs.forEach((document) {
    print(document.reference);
    docIDs.add(document.reference.id);
  }),
  );
}
 /* @override
  void initState() {
    super.initState();
    setState(() {});
    //getData();
  }
*/
 /* void getData() async {
    User? user = _auth.currentUser;
    _uid = user?.uid;
    print('user.email ${user?.email}');
   final DocumentSnapshot userDoc = (user!.isAnonymous
        ? null
        : await FirebaseFirestore.instance.collection('users').doc(_uid).get()) as DocumentSnapshot<Object?>;

      setState(() {
      _firstname = userDoc.get('firstname');
      _lastname = userDoc.get('lastname');
      _email = user.email;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Account'),
        backgroundColor: GreyColors,
        centerTitle: true,
      ),
      body: Center(
        child:
       Column( 
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
      /*  Text('Signed in as:${userr.email}',
        style: TextStyle(fontSize: 20),),
        MaterialButton(onPressed: (){
          FirebaseAuth.instance.signOut();

        },
        color: Colors.deepPurple,
        child: Text('sign out'),),*/
        Expanded(
          child: 
          FutureBuilder(
                        future: getDocId(),
            builder: (context, snapshot)
           {
           return ListView.builder(
          itemCount: docIDs.length,
          itemBuilder:
         (context, index) {

          return ListTile(
            title: GetUserName(documentId: docIDs[index],)
         // Text(docIDs[index]),
          ); 
          },
        
        );
           },
        ),
        ),
      ],
      ),
      ),
     /* body: Column(
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
              userListTile('Email', _email ?? '', 0, context),
              /*
              Text(
                'Email:'_email ?? '',
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
                'First Name:' + _firstname!,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),  */
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
        ],
      ),*/
    );
  }
/*
  List<IconData> _userTileIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded
  ];

  Widget userListTile(
      String title, String subTitle, int index, BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      leading: Icon(_userTileIcons[index]),
    );
  }*/
}
