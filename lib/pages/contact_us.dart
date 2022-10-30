import 'package:flutter/material.dart';
import 'package:sahar_mob_app/utils/color.dart';

class ContactUs extends StatefulWidget {
  @override
  ContactUsForm createState() => ContactUsForm();
  
}
class ContactUsForm extends State<ContactUs>
{ 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 240, 255, 255),
       body: Column(             
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget> [
          Text("Contact",
          
          style: TextStyle(
            fontSize:32.0,
          fontWeight: FontWeight.bold,
          ),
          ),
          Text("Blaa blaaa blaaa"),
          Padding(
            padding: const EdgeInsets.symmetric(
            horizontal:16.0),
          
          child:Column(
            children:<Widget> [
                 SizedBox(height: 32.0),

              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor:Colors.white  ,
                  hintText: "Email",
                  border: InputBorder.none,
                ),
              ),
              
              SizedBox(height: 8.0),
        TextField(
           maxLines: 7,
                decoration: InputDecoration(
                  filled: true,
                                    fillColor:Colors.white  ,

                  hintText: "Message",
                  border: InputBorder.none,
                ),
              ),
                            SizedBox(height: 8.0),
                            MaterialButton(
                              height: 60.0,
                              minWidth: double.infinity,
                              color:GreyColors,
                              onPressed:(){},
                          child: Text("SUBMIT",style: TextStyle(
                          fontWeight:FontWeight.bold,
                          color:orangeColors, )),
                          ),

            ],
            
          ), 
          ),
      
        ],
      ),
      );
 
    
  }

}