import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wayelle/A_comman_widget/bottom%20navigationbar.dart';
import 'package:wayelle/Anetwork/api.dart';
import 'package:wayelle/My_orders/my_order_screen.dart';
import 'package:wayelle/My_profile/my_profile.dart';
import 'package:wayelle/controllers/my_order_controller.dart';

import '../Home_screen/org_home.dart';
import '../Login_screen/login_screen.dart';
import 'Password_settings/updatepassword.dart';
import 'Update_user_details/update_user_details.dart';

class Settingsmain extends StatefulWidget {
  const Settingsmain({Key? key, required this.switchLanguage})
      : super(key: key);
  final Function(String) switchLanguage;
  @override
  State<Settingsmain> createState() => _settingsState();
}

class _settingsState extends State<Settingsmain> {
  @override
  Widget build(BuildContext context) {
    var orderController = Get.find<MyOrderController>();
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
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),

          ListTile(
            // leading: Visibility(visible: false, child: Icon(Icons.person)),
            title: Text(
              userfirstName.toString(),
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            subtitle: Text(
              userEmail.toString(),
              style: TextStyle(color: Colors.black45),
            ),
            trailing: IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Updateuserdetails(
                      switchLanguage: widget.switchLanguage,
                    );
                  }));
                },
                icon: Icon(Icons.edit)),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     GestureDetector(
          //         onTap: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => Updatepass(
          //                 switchLanguage: widget.switchLanguage,
          //               ),
          //             ),
          //           );
          //         },
          //         child: Text(
          //           'Password',
          //           style: TextStyle(
          //               fontSize: 16,
          //               fontWeight: FontWeight.w600,
          //               color: Colors.black),
          //         )),
          //     Text(
          //       'Password Settings',
          //       style: TextStyle(
          //           fontSize: 12,
          //           fontWeight: FontWeight.w400,
          //           color: Color(0xFF9B9B9B)),
          //     ),
          //   ],
          // ),
          ListTile(
            leading: Icon(Icons.shopping_bag_outlined),
            onTap: () {
              Get.to(() => MyOrders(switchLanguage: widget.switchLanguage));
            },
            title: Text(
              "My orders",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            subtitle: Text(orderController.myOrders == null ||
                    orderController.emptyOrder == true ||
                    orderController.isLoading.value == true
                ? "You have no orders yet"
                : "Already have ${orderController.myOrders!.orders.length} orders"),
            trailing:
                IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next)),
          ),
          ListTile(
            leading: Icon(Icons.lock),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Updatepass(
                    switchLanguage: widget.switchLanguage,
                  ),
                ),
              );
            },
            title: Text(
              "Password",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            subtitle: Text("Password settings"),
            trailing:
                IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next)),
          ),

          //  Column(
          //    crossAxisAlignment: CrossAxisAlignment.start,
          //    children: [
          //      GestureDetector(
          //          onTap: (){logout(context, widget.switchLanguage);},
          //          child: Text('Logout',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black),)),
          //      Text('Account Logout',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xFF9B9B9B)),),
          //    ],
          //  ),
          ListTile(
            leading: Icon(Icons.logout),
            onTap: () {
              logout(context, widget.switchLanguage);
            },
            title: Text(
              "Logout",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            subtitle: Text("Account Logout"),
            trailing:
                IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next)),
          ),
          // ListTile(
          //   onTap: () {
          //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //       return Myprofile(
          //         switchLanguage: widget.switchLanguage,
          //       );
          //     }));
          //   },
          //   title: Text(
          //     "My Profile",
          //     style: TextStyle(
          //         fontSize: 16,
          //         fontWeight: FontWeight.w600,
          //         color: Colors.black),
          //   ),
          //   subtitle: Text("Personal information"),
          // )
        ],
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
