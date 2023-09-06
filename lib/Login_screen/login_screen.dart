import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:form_validator/form_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wayelle/Anetwork/api.dart';
import 'package:wayelle/Sign_up/Reg_new_user.dart';
import '../A_comman_widget/bottom navigationbar.dart';
import '../Forgot_password/forgotpassword.dart';
import '../Home_screen/home_screen.dart';
import '../Home_screen/org_home.dart';
import '../Onboarding_screens/Screen_1.dart';

late final jsonResponse;
int? user_id;
String? jsontoken;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.switchLanguage}) : super(key: key);
  final Function(String) switchLanguage;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailFocus = FocusNode();
  final FocusNode pswdFocus = FocusNode();

  final _validationKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _validate = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    // final String email = userNameController.text.trim();
    // final String password = passWordController.text.trim();
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    final response = await http.post(
      Uri.parse(
          'https://globosoft.org/2023/02/wayelle2/api/login/key/123456789'),
      // headers: <String, String>{'Content-Type': 'application/json'},
      body: {'email': email, 'password': password},
    );

    final jsonResponse = json.decode(response.body.toString());
    if (jsonResponse['success'] == "true") {
      // print("userdattaaa${jsonResponse["customer_id"]}");
      final pref = await SharedPreferences.getInstance();
      pref.setString("customer_Id", jsonResponse["userdata"]["customer_id"]);
      customer_id = pref.getString("customer_Id");
      print("cus_id is${customer_id}");
      pref.setString("email", jsonResponse["userdata"]["email"]);
      userEmail = pref.getString("email");
      print("user email${userEmail}");
      pref.setString("password", jsonResponse["userdata"]["password"]);
      userPassword = pref.getString("password");
      print("user password${userPassword}");

      // customer_id = jsonResponse["userdata"]["customer_id"];
      // print("cus id${customer_id}");
      final prefs = await SharedPreferences.getInstance();
      // Login successful, navigate to home screen
      prefs.setString("token", "token");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (_) => Bottomnavigation(
                  switchLanguage: widget.switchLanguage,
                )),
      );
      final userData = jsonResponse['userdata'];
      if (userData != null) {
        user_id = int.parse(userData["customer_id"]);
        prefs.setInt('customer_id', user_id!);
        jsontoken = userData['token'];
        prefs.setString("token", jsontoken!);
      }
      print("234== ${user_id}");
    } else {
      // Login failed, show error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Invalid email or password'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int validateEmail(String emailAddress) {
    String patttern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = new RegExp(patttern);
    if (emailAddress.isEmpty || emailAddress.length == 0) {
      return 1;
    } else if (!regExp.hasMatch(emailAddress)) {
      return 2;
    } else {
      return 0;
    }
  }

  int validatePassword(String pswd) {
    if (pswd.isEmpty || pswd.length == 0) {
      return 1;
    } else if (pswd != null && pswd.isNotEmpty && pswd.length <= 2) {
      return 2;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            "Sign in",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SignUpScreen(switchLanguage: widget.switchLanguage),
                  ),
                );
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.02,
                  // ),
                  // Row(
                  //   children: [
                  //     // SizedBox(
                  //     //   width: 16,
                  //     // ),
                  // Text(
                  //   'Sign in',
                  //   style: TextStyle(
                  //       fontSize: 28,
                  //       fontWeight: FontWeight.w700,
                  //       color: Colors.black),
                  // ),
                  //   ],
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Form(
                          key: _validationKey,
                          child: Column(
                            children: [
                              /* Email */
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                /* autovalidate is disabled */
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (val) {},
                                maxLines: 1,
                                validator: (value) {
                                  int res = validateEmail(value!);
                                  if (res == 1) {
                                    return "Please  fill email address";
                                  } else if (res == 2) {
                                    return "Please enter valid email address";
                                  } else {
                                    return null;
                                  }
                                },
                                focusNode: emailFocus,
                                autofocus: false,
                                decoration: const InputDecoration(
                                    errorMaxLines: 3,
                                    counterText: "",
                                    filled: true,
                                    fillColor: Color(0xFFEEEEEE),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                        width: 1,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.red,
                                        )),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.red,
                                      ),
                                    ),
                                    hintText: "Enter email address",
                                    helperStyle: TextStyle(
                                        color: Color(0xFF9B9B9B),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12)),
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              /* Password */
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                /* autovalidate is disabled */
                                controller: passwordController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r"\s\s")),
                                  FilteringTextInputFormatter.deny(RegExp(
                                      r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
                                ],
                                keyboardType: TextInputType.text,
                                maxLength: 160,
                                onChanged: (val) {},
                                obscureText: true,
                                maxLines: 1,
                                validator: (value) {
                                  int res = validatePassword(value!);
                                  if (res == 1) {
                                    return "Please enter password";
                                  } else if (res == 2) {
                                    return "Please enter minimum 3 characters";
                                  } else {
                                    return null;
                                  }
                                },
                                focusNode: pswdFocus,
                                autofocus: false,
                                decoration: InputDecoration(
                                    errorMaxLines: 3,
                                    counterText: "",
                                    filled: true,
                                    fillColor: Color(0xFFEEEEEE),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                        width: 1,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.red,
                                        )),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                        width: 1,
                                        color: Colors.red,
                                      ),
                                    ),
                                    hintText: "Enter password",
                                    helperStyle: TextStyle(
                                        color: Color(0xFF9B9B9B),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 11.0,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Forgotpass(
                                          switchLanguage:
                                              widget.switchLanguage),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Colors.black),
                                )),
                            Icon(
                              Icons.arrow_right_alt,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        GestureDetector(
                          onTap: _login,
                          child: Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black),
                              child: Center(
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 41.96,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Text(
                              'or',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                            Spacer()
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Stack(
                        //   alignment: Alignment.center,
                        //   children: [
                        //     Container(
                        //       height: 55,
                        //       width: double.infinity,
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(5),
                        //           color: Color(0xFFEEEEEE)),
                        //       child: Row(
                        //         children: [
                        //           SizedBox(
                        //             width: 15,
                        //           ),
                        //           Container(
                        //             height: 25,
                        //             width: 25,
                        //             child: Image(
                        //               image: NetworkImage(
                        //                   'https://cdn-icons-png.flaticon.com/512/2875/2875331.png'),
                        //               fit: BoxFit.fill,
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //     Text(
                        //       'Sign in with Google',
                        //       style: TextStyle(
                        //           color: Colors.black,
                        //           fontWeight: FontWeight.w400,
                        //           fontSize: 14),
                        //     )
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 9,
                        // ),
                        // Stack(
                        //   alignment: Alignment.center,
                        //   children: [
                        //     Container(
                        //       height: 55,
                        //       width: double.infinity,
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(5),
                        //           color: Color(0xFFEEEEEE)),
                        //       child: Row(
                        //         children: [
                        //           SizedBox(
                        //             width: 15,
                        //           ),
                        //           Container(
                        //             height: 25,
                        //             width: 25,
                        //             child: Image(
                        //               image: NetworkImage(
                        //                   'https://globosoft.org/2023/6c52e75b3cc482a23f9977632ce9936a.png'),
                        //               fit: BoxFit.fill,
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //     Text(
                        //       'Sign in with Apple',
                        //       style: TextStyle(
                        //           color: Colors.black,
                        //           fontWeight: FontWeight.w400,
                        //           fontSize: 14),
                        //     )
                        //   ],
                        // ),
                        Center(
                          child: Container(
                            height: 50,
                            width: 200,
                            // color: Colors.amber,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  //color: Colors.green,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/logo/google-logo.png"))),
                                ),
                                Text(
                                  "Sign in with google",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            height: 50,
                            width: 200,
                            // color: Colors.amber,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  //color: Colors.green,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/logo/apple-logo.png"))),
                                ),
                                Text(
                                  "Sign in with apple",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
