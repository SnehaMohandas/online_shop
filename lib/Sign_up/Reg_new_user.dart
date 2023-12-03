// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
//
//
// class RegistrationOtp extends StatefulWidget {
//   const RegistrationOtp({required Key key}) : super(key: key);

//   @override
//   _RegistrationOtpState createState() => _RegistrationOtpState();
// }

// class _RegistrationOtpState extends State<RegistrationOtp> {
//   final GlobalKey<FormState> _key = GlobalKey<FormState>();
//   var OTPController = TextEditingController();

//   @override

//   Widget build(BuildContext context) {
//     final width = MediaQuery
//         .of(context)
//         .size
//         .width;
//     // String defaultFontFamily = 'Roboto-Light.ttf';
//     double defaultFontSize = 14;
//     double defaultIconSize = 17;

//     return Scaffold(

//         body:
//         Form(
//           key: _key,
//           child: Column(
//             children: <Widget>[

//               Flexible(
//                   flex: 5,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Container(
//                           padding: EdgeInsets.only(left: 0, right: 0,),
//                           height: ScreenUtil().setHeight(400),
//                           child: Stack(
//                             children: <Widget>[
//                               Positioned(
//                                 top: ScreenUtil().setHeight(-40),
//                                 height: ScreenUtil().setHeight(400),
//                                 width: ScreenUtil().setWidth(width),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                           image: AssetImage(
//                                               'assets/images/background1.jpg'),
//                                           fit: BoxFit.fill
//                                       )
//                                   ),
//                                   //child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),)
//                                 ),
//                               ),

//                               Positioned(
//                                   height: ScreenUtil().setHeight(400),
//                                   width: ScreenUtil().setWidth(width + 60),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                             image: AssetImage(
//                                                 'assets/images/background1.jpg'),
//                                             fit: BoxFit.fill
//                                         )
//                                     ),
//                                   )),

//                               Positioned(
//                                 child: Container(
//                                     margin: EdgeInsets.only(
//                                         top: ScreenUtil().setHeight(50)),
//                                     child: Center(
//                                         child:
//                                         Image.asset(
//                                             "assets/icons/choose-icon.png")
//                                       // Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),

//                                     )),
//                               )
//                               ,
//                               Positioned(
//                                 child:  Container(
//                                   margin: EdgeInsets.only(top: ScreenUtil().setHeight(25)),

//                                   child:
//                                   IconButton(
//                                     icon: Icon(Icons.arrow_back_ios, color: Colors.black),
//                                     onPressed: () => Navigator.of(context).pop(),
//                                   ),
//                                   // Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),

//                                 ),
//                               ),
//                               Positioned(
//                                 child: Container(
//                                     margin: EdgeInsets.only(
//                                         top: ScreenUtil().setHeight(250)),
//                                     child: Center(
//                                       child:
//                                       Text("Confirm Registration",
//                                         style: TextStyle(color:Colors.black,
//                                             fontSize: ScreenUtil().setSp(20),
//                                             fontWeight: FontWeight.bold),),

//                                     )),
//                               )
//                               ,

//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: ScreenUtil().setHeight(15),
//                         ),
//                         Center(child: Text("Enter the OTP sent to your mobile number ending with ",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w700),)),

//                         Container(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: ScreenUtil().setWidth(20),vertical: ScreenUtil().setHeight(10)),
//                           child: TextFormField(
//                             controller: OTPController,
//                             keyboardType: TextInputType.number,
//                             style: TextStyle(fontSize: ScreenUtil().setSp(
//                                 defaultFontSize)),
//                             showCursor: true,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(
//                                     Radius.circular(10.0)),
//                                 borderSide: BorderSide(
//                                   width: 0,
//                                   style: BorderStyle.none,
//                                 ),
//                               ),
//                               filled: true,
//                               prefixIcon: Icon(
//                                 Icons.phone_android,
//                                 color: Color(0xFF666666),
//                                 size: ScreenUtil().setSp(defaultIconSize),
//                               ),
//                               fillColor: Color(0xFFF2F3F5),
//                               hintStyle: TextStyle(
//                                   color: Color(0xFF666666),
//                                   //fontFamily: defaultFontFamily,
//                                   fontSize: ScreenUtil().setSp(defaultFontSize)
//                               ),
//                               hintText: "  Enter OTP",
//                             ),
//                             // validator: (String value) {
//                             //   String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
//                             //   RegExp regExp = new RegExp(patttern);
//                             //   if (value.length != 5) {
//                             //     return 'Please enter five number otp';
//                             //   }
//                             //   // else if (!regExp.hasMatch(value)) {
//                             //   //   return 'your OTP is incorrect';
//                             //   // }
//                             //   return null;
//                             // },
//                             // onSaved: (String value) {
//                             //   OTPController = value as TextEditingController;
//                             // },
//                           ),
//                         ),
//                         SizedBox(
//                           height: ScreenUtil().setHeight(250),
//                         ),

//                         Container(

//                           padding: EdgeInsets.symmetric(
//                               horizontal: ScreenUtil().setWidth(20)),
//                           width: double.infinity,
//                           child: RaisedButton(
//                             padding: EdgeInsets.all(17.0),
//                             onPressed: () {
//                               if (_key.currentState.validate()) {
//                                 print("Form was Submitted Successfully");
//                                 if (OTPController.text != OTP.toString()) {
//                                   Fluttertoast.showToast(
//                                     msg: "OTP is incorrect",
//                                     gravity: ToastGravity.BOTTOM,
//                                     toastLength: Toast.LENGTH_SHORT,
//                                   );
//                                 }
//                                 else {
//                                   Register(
//                                       RegFirstNameController.text,
//                                       RegLastNameController.text,
//                                       RegMobileNoController.text,
//                                       RegEmailController.text,
//                                       RegConfirmPasswordController.text,
//                                       RegAddressController.text,
//                                       RegCityController.text,
//                                       RegpostcodeController.text);
//                                 }
//                               }
//                             },
//                             child: Text(
//                               "Confirm Your Registration",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: ScreenUtil().setSp(18),
//                                 fontFamily: 'Poppins-Medium.ttf',
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             color: Colors.black,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: new BorderRadius.circular(15.0),
//                                 side: BorderSide(color: Colors.black)),
//                           ),
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
//                         ),
//                         SizedBox(
//                           height: ScreenUtil().setHeight(15),
//                         ),

//                         SizedBox(
//                           height: ScreenUtil().setHeight(15),
//                         ),
//                       ],
//                     ),
//                   )
//               ),

//             ],
//           ),

//         )
//     );
//   }

//   Future Register(String first, String last, String mobile, String email,
//       String password, String Address, String city, String postcode) async {
//     print("https://globosoft.co.uk/myFitBuddy/api/register/key/123456789");
//     http.post(
//       Uri.parse(
//           "https://globosoft.co.uk/myFitBuddy/api/new_register/key/123456789"),
//       body: {
//         "customer_group_id": "1",
//         "firstname": first,
//         "lastname": last,
//         "email": email,
//         "telephone": mobile,
//         "fax": "",
//         "company": "",
//         "address_1": Address,
//         "address_2": "",
//         "city": city,
//         "postcode": postcode,
//         "country_id": "",
//         "zone_id": "",
//         "password": password,
//         "newsletter": "1"
//       },

//     ).then((response) async {
//       print('Response status : ${response.statusCode}');
//       print('Response body : ${response.body}');

//       if (response.statusCode == 200) {
//         final prefs = await SharedPreferences.getInstance();
//         if (json.decode(response.body)["userdata"] ==
//             "email \/ contact exist") {
//           print("1233");
//           Fluttertoast.showToast(
//             msg: "Contact already exists",
//             gravity: ToastGravity.BOTTOM,
//             toastLength: Toast.LENGTH_SHORT,
//           );
//         }

//         else {
//           jsonResponse2 = json.decode(response.body.toString())["userdata"];
//           print('jsonResponse2 == ${jsonResponse2}');

//           if (jsonResponse2 != "Email Alredy Exist") {
//             CustomerId = jsonResponse2["customer_id"];
//             String name = jsonResponse2["firstname"];
//             String email = jsonResponse2["email"];
//             String lastname = jsonResponse2["lastname"];
//             String customer_group_id = jsonResponse2["customer_group_id"];
//             String telephone = jsonResponse2["telephone"];

//             prefs.setString('customer_id', CustomerId);
//             prefs.setString('name', name);
//             prefs.setString('lastname', lastname);
//             prefs.setString('email', email);
//             prefs.setString('customer_group_id', customer_group_id);
//             prefs.setString('telephone', telephone);
//             Fluttertoast.showToast(
//               msg: "Account Created Successfully",
//               gravity: ToastGravity.BOTTOM,
//               toastLength: Toast.LENGTH_SHORT,
//             );
//             Navigator.of(context).pop();
//             return jsonResponse2;
//           }
//         }
//       }
//     }

//     );
//   }
// }

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayelle/Login_screen/login_screen.dart';
import 'package:wayelle/controllers/user_register_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key, required this.switchLanguage}) : super(key: key);
  final Function(String) switchLanguage;

  List<String> country = ['Canada'];
  List<String> canadastate = [
    'Alberta',
    'British Coloumbia',
    'Nunavut',
    'Ontario',
    'Saskatchewan',
    'Yukon Territory'
  ];
  List<String> indianStates = ['Kerala'];

  String? selectedItem;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController postcodeController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController cityController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var regController = Get.put(RegisterController(switchLanguage));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign up",
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty || value == '') {
                              return 'Please enter first nanme';
                            }
                          },
                          controller: firstNameController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: "First name",
                              hintStyle: TextStyle(fontSize: 15),
                              border: InputBorder.none,
                              suffixIconColor: Colors.black54)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Expanded(
                      child: TextFormField(
                          controller: lastNameController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: "Last name",
                              hintStyle: TextStyle(fontSize: 15),
                              border: InputBorder.none,
                              suffixIconColor: Colors.black54)),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value == '') {
                        return 'Please enter your e-mail';
                      }
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: "E-mail",
                        hintStyle: TextStyle(fontSize: 15),
                        border: InputBorder.none,
                        suffixIconColor: Colors.black54)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value == '') {
                        return 'Please enter mobile number';
                      }
                    },
                    controller: mobileController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: "Mobile",
                        hintStyle: TextStyle(fontSize: 15),
                        border: InputBorder.none,
                        suffixIconColor: Colors.black54)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value == '') {
                        return 'Please enter your address';
                      }
                    },
                    controller: addressController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: "Address",
                        hintStyle: TextStyle(fontSize: 15),
                        border: InputBorder.none,
                        suffixIconColor: Colors.black54)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty || value == '') {
                              return 'Please enter you city';
                            }
                          },
                          controller: cityController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: "City",
                              hintStyle: TextStyle(fontSize: 15),
                              border: InputBorder.none,
                              suffixIconColor: Colors.black54)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Expanded(
                      child: TextFormField(
                          controller: postcodeController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: "Post code",
                              hintStyle: TextStyle(fontSize: 15),
                              border: InputBorder.none,
                              suffixIconColor: Colors.black54)),
                    ),
                  ],
                ),
                // TextFormField(
                //     controller: postcodeController,
                //     decoration: InputDecoration(
                //         filled: true,
                //         fillColor: Colors.grey[200],
                //         hintText: "Post code",
                //         hintStyle: TextStyle(fontSize: 15),
                //         border: InputBorder.none,
                //         suffixIconColor: Colors.black54)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 46,
                        width: 140,
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: DropdownButtonFormField(
                            hint: Text(
                              "Country",
                              style: TextStyle(fontSize: 15),
                            ),
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            value: selectedItem,
                            items: country.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Expanded(
                      child: Container(
                        height: 46,
                        width: 140,
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: DropdownButtonFormField(
                            hint: Text(
                              "State",
                              style: TextStyle(fontSize: 15),
                            ),
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            value: selectedItem,
                            items: canadastate.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Obx(
                  () => TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || value == '') {
                          return 'Please enter your password';
                        }
                      },
                      obscureText: regController.obscureText.value,
                      controller: passwordController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "Password",
                          hintStyle: TextStyle(fontSize: 15),
                          border: InputBorder.none,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              regController.togglePasswordVisibility();
                            },
                            child: Icon(regController.obscureText.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          suffixIconColor: Colors.black54)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Obx(
                  () => TextFormField(
                      controller: confirmPasswordController,
                      obscureText: regController.confrirmobscure.value,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: "Confirm password",
                          hintStyle: TextStyle(fontSize: 15),
                          border: InputBorder.none,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              regController.toggleconfirmPasswordVisibility();
                            },
                            child: Icon(regController.confrirmobscure.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          suffixIconColor: Colors.black54)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 13),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return LoginScreen(switchLanguage: switchLanguage);
                          }));
                        },
                        icon: Icon(Icons.arrow_forward))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .black // Change this color to the desired background color
                            ),
                        onPressed: () {
                          print("regstr");
                          // if(postcodeController.text==""){
                          //   postcodeController.text
                          // }
                          //  print(postcodeController.text.toString());
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, save the input and perform other actions
                            _formKey.currentState!.save();
                            // Handle the valid input here
                            regController.registerNewUser(
                                firstNameController.text,
                                lastNameController.text,
                                emailController.text,
                                mobileController.text,
                                "",
                                "",
                                addressController.text,
                                "",
                                cityController.text,
                                postcodeController.text,
                                "1",
                                "1",
                                passwordController.text,
                                "1");
                          }
                        },
                        child: Text("SIGN UP")),
                  ),
                ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.01,
                // ),
                // Center(
                //   child: Text(
                //     'or',
                //     style: TextStyle(fontSize: 16),
                //   ),
                // ),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.01,
                // ),
                // Center(
                //   child: Container(
                //     height: 30,
                //     width: 200,
                //     // color: Colors.amber,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: [
                //         Container(
                //           width: 20,
                //           height: 30,
                //           //color: Colors.green,
                //           decoration: BoxDecoration(
                //               image: DecorationImage(
                //                   image: AssetImage(
                //                       "assets/logo/google-logo.png"))),
                //         ),
                //         Text(
                //           "Sign in with google",
                //           style: TextStyle(fontSize: 16, color: Colors.black54),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Center(
                //   child: Container(
                //     height: 30,
                //     width: 200,
                //     // color: Colors.amber,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: [
                //         Container(
                //           width: 20,
                //           height: 30,
                //           //color: Colors.green,
                //           decoration: BoxDecoration(
                //               image: DecorationImage(
                //                   image: AssetImage(
                //                       "assets/logo/apple-logo.png"))),
                //         ),
                //         Text(
                //           "Sign in with apple",
                //           style: TextStyle(fontSize: 16, color: Colors.black54),
                //         )
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//SizedBox(
                //   height: 48,
                //   child: Obx(()=>
                //       TextFormField(
                //         obscureText: loginController.obscureText.value,
                //         controller: passwordController,
                //         decoration: InputDecoration(
                //           suffixIcon: GestureDetector(
                //             onTap: () {
                //               loginController.togglePasswordVisibility();
                //             },
                //             child: Icon(loginController.obscureText.value
                //                 ? Icons.visibility
                //                 : Icons.visibility_off),
                //           ),
                //           labelText: 'Password',
                //           border: const OutlineInputBorder(),
                //         ),
                //       ),
                //   ),
                // ),