import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wayelle/A_comman_widget/bottom%20navigationbar.dart';
import 'package:wayelle/Address_book/edit_address.dart';
import 'package:wayelle/Anetwork/api.dart';

import '../Home_screen/org_home.dart';
import '../Login_screen/login_screen.dart';
import '../Settings/Password_settings/updatepassword.dart';
import '../Settings/Update_user_details/update_user_details.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({Key? key, required this.switchLanguage}) : super(key: key);
  final Function(String) switchLanguage;
  @override
  State<Myprofile> createState() => _settingsState();
}

class _settingsState extends State<Myprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Bottomnavigation(
                    switchLanguage: widget.switchLanguage,
                  ),
                ),
              );
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 30,),
            // Row(
            //   children: [
            //     Text('My Profile',style: TextStyle(fontSize: 34,fontWeight: FontWeight.w700,color: Colors.black),)
            //   ],
            // ),
            Center(
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       userfirstName.toString(),
              //       style: TextStyle(color: Colors.black, fontSize: 30),
              //     ),
              //     Row(
              //       children: [
              //         Text(
              //           userEmail.toString(),
              //           style: TextStyle(color: Colors.black45),
              //         ),
              //         IconButton(onPressed: () {}, icon: Icon(Icons.edit))
              //       ],
              //     ),
              //   ],
              // ),
              child: ListTile(
                leading: Visibility(visible: false, child: Icon(Icons.person)),
                title: Center(
                  child: Text(
                    userfirstName.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ),
                subtitle: Center(
                  child: Text(
                    userEmail.toString(),
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ListTile(
              title: Text(
                "My orders",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing:
                  IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next)),
            ),
            //=====================================================
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => Updateuserdetails(
            //           switchLanguage: widget.switchLanguage,
            //         ),
            //       ),
            //     );
            //   },
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Personal Information',
            //         style: TextStyle(
            //             fontSize: 16,
            //             fontWeight: FontWeight.w600,
            //             color: Colors.black),
            //       ),
            //       Text(
            //         'Name,Date of Birth',
            //         style: TextStyle(
            //             fontSize: 12,
            //             fontWeight: FontWeight.w400,
            //             color: Color(0xFF9B9B9B)),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 18,
            // ),
            // //================================================
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditaddadressPage(
                            switchLanguage: widget.switchLanguage,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Addressbook',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    )),
                Text(
                  'Add new Address',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9B9B9B)),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Wallet',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Text(
                  'view your wallet',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9B9B9B)),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Downloads',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Text(
                  'Account Downloads',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9B9B9B)),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      logout(context, widget.switchLanguage);
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    )),
                Text(
                  'Account Logout',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9B9B9B)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> logout(
    BuildContext context, Function(String) switchLanguage) async {
  // Clear user data from shared preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();

  // Navigate to the login page
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => LoginScreen(switchLanguage: switchLanguage)),
  );
}
