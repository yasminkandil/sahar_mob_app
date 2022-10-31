import 'package:flutter/material.dart';
import 'package:sahar_mob_app/pages/admin.dart';
import 'package:sahar_mob_app/pages/cart.dart';
import 'package:sahar_mob_app/pages/category.dart';
import 'package:sahar_mob_app/pages/contact_us.dart';
import 'package:sahar_mob_app/pages/edit_account.dart';
import 'package:sahar_mob_app/pages/regi_page.dart';
import 'package:sahar_mob_app/pages/view_account.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';
import 'package:sahar_mob_app/pages/components/body.dart';

import 'my_drawer_header.dart';

class Navigation_bar extends StatefulWidget {  
    @override
    HomeNavbar createState() => HomeNavbar();
    // TODO: implement createState
  }

 class HomeNavbar extends State<Navigation_bar>
 {
  var currentPage = Sections.Dashboard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(backgroundColor: Colors.grey[700],
      title: Text("Menu"),),
      body: Container( 
        child:Column(
        children: <Widget>[
            HeaderContainer("Login"),
            ]
            
            ),
            
      ) ,
      drawer: Drawer(
        child: SingleChildScrollView(
        child: Container(child: 
        Column(children: [
          MyHeaderDrawer(),
          MyDrawerList(),
        ]),)
      ),),
    );
    // TODO: implement build
  }
Widget MyDrawerList()
{
  return Container(
  padding: EdgeInsets.only(top: 15,),
  child:Column(
children: [
  menuItem(8,"Cart", Icons.shop_two_outlined,
  currentPage==Sections.Cart?true:false),
   menuItem(7,"Sign Up", Icons.login_rounded,
  currentPage==Sections.Sign_Up?true:false),
  menuItem(1,"DashBoard", Icons.dashboard_outlined,
  currentPage==Sections.Dashboard?true:false),
  menuItem(2,"Contact US", Icons.people_alt_outlined,
  currentPage==Sections.contacts?true:false),
  menuItem(3,"Categories", Icons.category_rounded,
  currentPage==Sections.Categories?true:false),
  menuItem(4," Profile", Icons.edit_attributes_rounded,
  currentPage==Sections.Edit_Profile?true:false),
  menuItem(5,"Notifications", Icons.notification_add_rounded,
  currentPage==Sections.Notifications?true:false),
  menuItem(6,"Log Out", Icons.logout_rounded,
  currentPage==Sections.Log_Out?true:false),
  

],
  ),
  );
}
Widget menuItem(int id,String title,IconData icon, bool selected)
{
  return Material(
    color: selected? Colors.grey: Colors.transparent,
    child: InkWell(
      onTap: () {



        if(id == 1)
        {
          Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Admin()),
                    );
          currentPage=Sections.Dashboard;

        }
        else if(id == 2)
        {
          Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactUs()),
                    );
                    currentPage=Sections.contacts;

        }

        else if(id == 3)
        {
          Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CategoryPage()),
                    );
                    currentPage=Sections.Categories;

        }else if(id == 4)
        {
          Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewAccountPage()),
                    );
                    currentPage=Sections.Notifications;

        }
        else if(id == 5)
        {
          Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfileUI()),
                    );
                    currentPage=Sections.Edit_Profile;

        }
        else if(id == 6)
        {
          Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Navigation_bar()),
                    );
                    currentPage=Sections.Log_Out;

        }
        else if(id == 7)
        {
          Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                    currentPage=Sections.Sign_Up;

        }
        else if(id == 8)
        {
          Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartItem()),
                    );
                    currentPage=Sections.Cart;

        }
      },
      child:Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(children: 
      [Expanded(
        child: Icon(
icon      
     ,size: 20,
      color: Colors.grey,),
      ),
      Expanded(flex: 3,
      child: Text(title,style:TextStyle(
        
        color: Colors.black,fontSize: 16,
      ) ,))
      ]
      ),) ,),
  );
}
 }
enum Sections{
  Dashboard,
  contacts,
  Notifications,
  Sign_Up,
  Categories,
  Edit_Profile,
  Log_Out,
  Cart
}