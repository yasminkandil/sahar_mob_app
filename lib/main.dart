import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahar_mob_app/admin/add_category.dart';
import 'package:sahar_mob_app/admin/add_color.dart';
import 'package:sahar_mob_app/admin/add_gallery.dart';
import 'package:sahar_mob_app/admin/add_homePageImage.dart';
import 'package:sahar_mob_app/admin/add_offer.dart';
import 'package:sahar_mob_app/admin/add_quality.dart';
import 'package:sahar_mob_app/admin/admin.dart';
import 'package:sahar_mob_app/admin/orders_admin.dart';
import 'package:sahar_mob_app/admin/users_admin.dart';
import 'package:sahar_mob_app/admin/view_product.dart';
import 'package:sahar_mob_app/controllers/search_product.dart';
import 'package:sahar_mob_app/home/home_page.dart';

import 'package:sahar_mob_app/home/navbar.dart';
import 'package:sahar_mob_app/pages/cart.dart';
import 'package:sahar_mob_app/pages/contact_us.dart';
import 'package:sahar_mob_app/pages/gallary.dart';
import 'package:sahar_mob_app/pages/login_page.dart';
import 'package:sahar_mob_app/pages/must_have_account.dart';
import 'package:sahar_mob_app/pages/order_history.dart';
import 'package:sahar_mob_app/pages/products_all.dart';
import 'package:sahar_mob_app/pages/regi_page.dart';
import 'package:sahar_mob_app/pages/view_account.dart';
import 'package:sahar_mob_app/pages/view_messages.dart';
import 'package:sahar_mob_app/screens/details/order_screen.dart';

import 'admin/add_product.dart';
import 'admin/search_user.dart';
import 'admin/view_categories.dart';
import 'admin/view_colors.dart';
import 'admin/view_offers.dart';
import 'admin/view_qualties.dart';
import 'pages/forgot_pass.dart';

//import 'pages/cart_view.dart';
//import 'pages/calendar.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sahar',
      initialRoute: "homepage",
      routes: {
        "homepage": (context) => const MyHomePage(),
        "navbar": (context) => Navigation_bar(),
        'login': (context) => LoginPage(),
        'register': (context) => RegisterPage(),
        'dashboard': (context) => const Admin(),
        'profile': (context) => const ViewAccountPage(),
        'cart': (context) => CartItem(),
        'shop': (context) => Products(cat: 'Cables'),
        'contact_us': (context) => ContactUs(),
        'gallery': (context) => gallery(),
        'must_have_account': (context) => MustHaveAccountPage(),
        'order_history': (context) => OrderScreen(salma: 'salma'),
        'view_users': (context) => ViewUsersPage(),
        'view_orders': (context) => ViewOrdersPage(),
        'view_messages': (context) => ViewMessagesPage(),
        'view_products': (context) => const ViewProductPage(),
        'view_colors': (context) => const ViewcolorsPage(),
        'view_qualties': (context) => const ViewQualitiesPage(),
        'view_offers': (context) => const ViewOffersPage(),
        'view_categories': (context) => const ViewCategoriesPage(),
        'add_product': (context) => AddProductPage(),
        'add_color': (context) => AddColorPage(),
        'add_quality': (context) => AddQualityPage(),
        'add_category': (context) => AddCategPage(),
        'add_offer': (context) => AddOfferPage(),
        'add_homeimage': (context) => const AddGalleryhome(),
        'add_gallery': (context) => const AddGallery(),
        'search_users': (context) => const FirebaseSearchUserScreen(),
        'search_products': (context) => const FirebaseSearchScreen(),
        'forgot_pass': (context) => const ForgotPass(),
      },
    );
  }
}
