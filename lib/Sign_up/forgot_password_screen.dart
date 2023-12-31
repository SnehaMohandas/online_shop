import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wayelle/Anetwork/api.dart';

import '../Login_screen/login_screen.dart';

class Userregg extends StatefulWidget {
  const Userregg({Key? key, required this.switchLanguage}) : super(key: key);

  final Function(String) switchLanguage;

  @override
  State<Userregg> createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Userregg> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("New Order"), value: "New Order"),
      const DropdownMenuItem(
          child: Text("Order Delivery"), value: "Order Delivery"),
      const DropdownMenuItem(
          child: Text("Retrun and Refund"), value: "Retrun and Refund"),
    ];
    return menuItems;
  }

  String selectedValue = "New Order";
  bool hidePassword = true;

  final _formKey = GlobalKey<FormState>();

  late String _email;

  Future<void> _register() async {
    final url = '${baseurl}api/forgotten/key/123456789';

    final response = await http.post(Uri.parse(url), body: {
      'telephone': _email,
    });

    if (response.statusCode == 200) {
      // Registration successful, navigate to home page

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginScreen(
                  switchLanguage: widget.switchLanguage,
                )),
      );
    } else {
      // Registration failed, show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'The E-Mail Address was not found in our records, please try again!')),
      );
    }
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 66,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(
                                switchLanguage: widget.switchLanguage),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ))
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Forgot password',
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  )
                ],
              ),
              SizedBox(
                height: 21,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  'Please, enter your email address. You will receive a link to create a new password via email.',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF222222)),
                ),
              ),
              SizedBox(
                height: 26,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  /* autovalidate is disabled */
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
                  onSaved: (value) {
                    _email = value!;
                  },
                  autofocus: false,
                  decoration: InputDecoration(
                      errorMaxLines: 3,
                      counterText: "",
                      filled: true,
                      fillColor: Color(0xFFEEEEEE),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          )),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
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
              ),

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: const [
              //       Text(
              //         "*",
              //         style: TextStyle(color: Colors.deepOrangeAccent),
              //       ),
              //       Text(
              //         "E-Mail",
              //         style: TextStyle(
              //           fontSize: 15,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 16,left: 16),
              //   child: TextFormField(
              //     validator: (value) {
              //       if (value!.isEmpty) {
              //         return 'Please enter your email';
              //       }
              //       return null;
              //     },
              //     onSaved: (value) {
              //       _email = value!;
              //     },
              //     decoration: InputDecoration(
              //       border: InputBorder.none,
              //       filled: true, //<-- SEE HERE
              //       fillColor: Color(0xFFEEEEEE),
              //
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    _register();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                    ),
                    child: Center(
                        child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
