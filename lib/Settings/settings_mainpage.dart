import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Home_screen/org_home.dart';
import '../Login_screen/login_screen.dart';
import 'Password_settings/updatepassword.dart';
import 'Update_user_details/update_user_details.dart';

class Settingsmain extends StatefulWidget{
  const Settingsmain({Key? key, required this.switchLanguage}) : super(key: key);
  final Function(String) switchLanguage;
  @override
  State<Settingsmain> createState() => _settingsState();
}

class _settingsState extends State<Settingsmain> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Orghome(switchLanguage: widget.switchLanguage,),
                ),
              );
            },
            child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,)),
        actions: [Icon(Icons.search,color: Colors.black,)],
      ),
     body: Padding(
       padding: const EdgeInsets.only(left: 16,right: 16),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(height: 30,),
           Row(
             children: [
               Text('Settings',style: TextStyle(fontSize: 34,fontWeight: FontWeight.w700,color: Colors.black),)
             ],
           ),
           SizedBox(height: 28,),

           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               GestureDetector(
                   onTap: (){
                     Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => Updatepass(switchLanguage: widget.switchLanguage,),
                     ),
                   );
                     },
                   child: Text('Password',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black),)),
               Text('Password Settings',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xFF9B9B9B)),),
             ],
           ),
           SizedBox(height: 18,),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               GestureDetector(
                   onTap: (){logout(context, widget.switchLanguage);},
                   child: Text('Logout',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black),)),
               Text('Account Logout',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xFF9B9B9B)),),
             ],
           ),
         ],
       ),
     ),
   );
  }
}

Future<void> logout(BuildContext context, Function(String) switchLanguage) async {
  // Clear user data from shared preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();

  // Navigate to the login page
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginScreen(switchLanguage: switchLanguage)),
  );
}