import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:sahar_mob_app/pages/navbar.dart';


//import 'pages/cart_view.dart';
//import 'pages/calendar.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sahar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // home: SafeArea(child: RegisterPage()),
      //home: SafeArea(child: Navigation_bar()),

      // home: PowerBank(),
      //home: SafeArea(child: LoginPage()),
      // home: SafeArea(child: Admin()),
      // home: Shop(),
      // home: AddProductPage(),
      //home: CategoryPage(),
      //home: SafeArea(child: RegisterPage()),
      //home: SafeArea(child: ViewAccountPage()),
      home: const SafeArea(child: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Navigation_bar();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
