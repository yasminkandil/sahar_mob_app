import 'package:flutter/material.dart';
import 'package:sahar_mob_app/utils/color.dart';
import 'package:sahar_mob_app/widgets/header_container.dart';


class EditProfileUI extends StatefulWidget {

  @override
  _EditProfileUIState createState() => _EditProfileUIState();
}
class _EditProfileUIState extends State<EditProfileUI>
{
  bool isObscurePassword =true;
  @override
  Widget build(BuildContext context) {
    
    
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title: Text('Edit Account'),
        backgroundColor: GreyColors,
       leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color:orangeColors,
       ), onPressed: () {  },
       ),
       actions: [
        IconButton(icon:Icon(
          Icons.settings,
          color: GreyColors,),
          onPressed: (){}
        ) 
      
       ], ) ,
       body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(onTap:() 
        {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
          Center(
          child:Stack(
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                border:Border.all(width: 4,color: Colors.white),
                boxShadow:[
                  BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.1)
                  )
                ],
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit:BoxFit.cover, 
                  image: NetworkImage(
                    'https://www.google.com/search?q=profile+photo+&tbm=isch&ved=2ahUKEwis27rOz_76AhVFexoKHU2PBGoQ2-cCegQIABAA&oq=profile+photo+&gs_lcp=CgNpbWcQAzIECAAQQzIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDoGCAAQBxAeULwEWLwEYKoIaABwAHgAgAGZAYgBkwKSAQMwLjKYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=d4lZY-zDCsX2ac2ektAG&bih=657&biw=1366#imgrc=nfkyptoYx2OzJM'
                  
                  )
                )

                ),
                 
                ),
         Positioned(
          bottom: 0,
          right: 0,
         child: Container(
          height:40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 4,
              color: Colors.white,
            ),
            color: Colors.orange),
            child:Icon(
              Icons.edit,
              color: Colors.white,
            )
          ),
          )
          
          ],
            ),
          ),
          SizedBox(height: 30),
          buildTextField("Full Name","Salma",false),
          buildTextField("Mail","balaa blaa",false),
          buildTextField("Password","#####",true),
          buildTextField("Location", "Cairo", false),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(onPressed: () {},
              child: Text("CANCEL",style: TextStyle(
                fontSize: 15,
                letterSpacing: 2,
                color: Colors.black)
              ),
              style: ElevatedButton.styleFrom(
                primary: orangeColors,
                padding: EdgeInsets.symmetric(horizontal: 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))

              ),
              ),
              ElevatedButton(onPressed: (){}, 
              child: Text("SAVE", style: TextStyle(
                fontSize: 15,
                letterSpacing: 2,
                color: Colors.white)
              ),
             
             style: ElevatedButton.styleFrom(
              primary: orangeColors,
              padding: EdgeInsets.symmetric(horizontal: 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))), 
              )
            ]
          )


          ],
       
        ),
        ),
        ),
    );
    throw UnimplementedError();
  }
  
Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField)
{
   return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
       child: TextFormField(autocorrect: isObscurePassword ? true:false,
 decoration:InputDecoration(
  suffixIcon: isPasswordTextField?
  IconButton(icon:Icon(Icons.remove_red_eye,color:Colors.grey),
    onPressed: () {} 
    ): null,
    contentPadding: EdgeInsets.only(bottom: 5),
    labelText: labelText,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintStyle: TextStyle(
      fontSize: 16,
                      letterSpacing: 2,

      fontWeight: FontWeight.bold,
      color: Colors.black

    )
 ) ,
  ),
  );
}



}