import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wayelle/Anetwork/api.dart';

import '../../Home_screen/home_screen.dart';
import '../../Login_screen/login_screen.dart';
import '../../main.dart';
import '../settings_mainpage.dart';

class Updateuserdetails extends StatefulWidget {
  const Updateuserdetails({Key? key, required this.switchLanguage})
      : super(key: key);
  final Function(String) switchLanguage;

  @override
  State<Updateuserdetails> createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Updateuserdetails> {
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
  late String _firstname;
  late String _lastname;
  late String _telephone;
  late String _fax;

  Future<void> _register() async {
    final User_ID = user_id ?? customer_id!;
    final url =
        'https://globosoft.org/2023/02/wayelle2/api/editCustomer/key/123456789';

    final response = await http.post(Uri.parse(url), body: {
      'email': _email,
      'firstname': _firstname,
      'lastname': _lastname,
      'telephone': _telephone,
      'fax': _fax,
      'customer_id': User_ID,
      //User_ID.toString()
    });

    // Assuming you have the API response stored in a variable called 'apiResponse'
    final apiResponse = json.decode(response.body.toString());
    if (apiResponse["success"] == true) {
      // Registration successful, navigate to home page
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => HomePage(
      //       switchLanguage: widget.switchLanguage,
      //     ),
      //   ),
      // );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Your account has been successfully updated.'),
        ),
      );
    } else {
      // Registration failed, show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Old Password Wrong'),
        ),
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
                            builder: (context) => Settingsmain(
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
                    'My Profile',
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
                child: Row(
                  children: [
                    Text(
                      'Update User Details',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF222222)),
                    ),
                  ],
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
                  onSaved: (value) {
                    _firstname = value!;
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
                      hintText: "First Name",
                      helperStyle: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontWeight: FontWeight.w300,
                          fontSize: 12)),
                ),
              ),

              ///

              SizedBox(
                height: 16,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  /* autovalidate is disabled */
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (val) {},
                  maxLines: 1,
                  onSaved: (value) {
                    _lastname = value!;
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
                      hintText: "Last Name",
                      helperStyle: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontWeight: FontWeight.w300,
                          fontSize: 12)),
                ),
              ),

              SizedBox(
                height: 16,
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

              ///

              SizedBox(
                height: 16,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  /* autovalidate is disabled */
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (val) {},
                  maxLines: 1,
                  onSaved: (value) {
                    _telephone = value!;
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
                      hintText: "Telephone",
                      helperStyle: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontWeight: FontWeight.w300,
                          fontSize: 12)),
                ),
              ),

              SizedBox(
                height: 16,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  /* autovalidate is disabled */
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (val) {},
                  maxLines: 1,
                  onSaved: (value) {
                    _fax = value!;
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
                      hintText: "Fax",
                      helperStyle: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontWeight: FontWeight.w300,
                          fontSize: 12)),
                ),
              ),

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
