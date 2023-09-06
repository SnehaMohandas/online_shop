import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wayelle/Anetwork/api.dart';

import '../Get_all_products/all_products.dart';

class EditaddadressPage extends StatefulWidget {
  const EditaddadressPage({Key? key, required this.switchLanguage})
      : super(key: key);
  final Function(String) switchLanguage;
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<EditaddadressPage> {
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

  late String _name;
  late String _name2;
  late String _adress1;
  String? _state;
  String? _city;
  String? _default;
  late String _adress2;
  late String _pin;
  late String _company;
  late String _place;

  List<String> _subjects = [
    '1',
  ];

  Future<void> _register() async {
    const url =
        'https://globosoft.org/2023/02/wayelle2/api/addaddress/key/123456789';

    final response = await http.post(Uri.parse(url), body: {
      'firstname': _name,
      'lastname': _name2,
      'address_1': _adress1,
      'address_2': _adress2,
      'postcode': _pin,
      'company': _company,
      'country_id': '2',
      'city': _place,
      'zone_id': '2',
      'set_ default': _default,
      'customer_id': customer_id,
      'address_id': '42',
    });

    if (response.statusCode == 200) {
      // Registration successful,navigate to home page
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => Getallproducts(id: '', vehile: null, switchLanguage: (String ) {  },)),
      // );
    } else {
      // Registration failed , show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: Color(0xFFF9F9F9),
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Edit Address',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  height: 64,
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _name = value!;
                        },
                        //show/hide password
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          labelStyle: TextStyle(color: Color(0xff9B9B9B)),
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(
                          //       10), //circular border for TextField.
                          // ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  height: 64,
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _name2 = value!;
                        },
                        //show/hide password
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          labelStyle: TextStyle(color: Color(0xff9B9B9B)),
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(
                          //       10), //circular border for TextField.
                          // ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  height: 64,
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _company = value!;
                        },
                        //show/hide password
                        decoration: InputDecoration(
                          labelText: 'Company',
                          labelStyle: TextStyle(color: Color(0xff9B9B9B)),
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(
                          //       10), //circular border for TextField.
                          // ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  height: 64,
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _adress1 = value!;
                        },
                        //show/hide password
                        decoration: InputDecoration(
                          labelText: 'Adress 1',
                          labelStyle: TextStyle(color: Color(0xff9B9B9B)),
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(
                          //       10), //circular border for TextField.
                          // ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  height: 64,
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _adress2 = value!;
                        },
                        //show/hide password
                        decoration: InputDecoration(
                          labelText: 'Adress 2',
                          labelStyle: TextStyle(color: Color(0xff9B9B9B)),
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  height: 64,
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _place = value!;
                        },
                        //show/hide password
                        decoration: InputDecoration(
                          labelText: 'Place',
                          labelStyle: TextStyle(color: Color(0xff9B9B9B)),
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(
                          //       10), //circular border for TextField.
                          // ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  height: 64,
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _pin = value!;
                        },
                        //show/hide password
                        decoration: InputDecoration(
                          labelText: 'Post code',
                          labelStyle: TextStyle(color: Color(0xff9B9B9B)),
                          filled: true, //<-- SEE HERE
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(
                          //       10), //circular border for TextField.
                          // ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //Dropdown Button

              //
              // SizedBox(height: 16,),
              //
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: const [
              //       Text(
              //         "*",
              //         style: TextStyle(color: Colors.deepOrangeAccent),
              //       ),
              //       Text(
              //         "Country",
              //         style: TextStyle(
              //           fontSize: 15,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              //
              // SizedBox(height: 6,),
              //
              //
              // // Padding(
              // //   padding: const EdgeInsets.only(left: 16,right: 16),
              // //   child: CitieListScreen(),
              // // ),
              //
              // // Padding(
              // //   padding: const EdgeInsets.only(left: 16,right: 16),
              // //   child: DropdownButtonFormField<String>(
              // //     decoration: InputDecoration(
              // //       labelText: '--Please Select--',
              // //       enabledBorder: OutlineInputBorder(
              // //         borderSide: const BorderSide(color: Colors.black54),
              // //         borderRadius: BorderRadius.circular(15),
              // //       ),
              // //       border: OutlineInputBorder(
              // //         borderRadius: BorderRadius.circular(15),
              // //       ),
              // //       fillColor: Colors.white,
              // //     ),
              // //     value: _city,
              // //     items: _subjects.map((String subject) {
              // //       return DropdownMenuItem<String>(
              // //         value: subject,
              // //         child: Text(subject),
              // //       );
              // //     }).toList(),
              // //     onChanged: (value) {
              // //       setState(() {
              // //         _city = value!;
              // //       });
              // //     },
              // //   ),
              // // ),
              //
              // SizedBox(height: 16,),
              //
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: const [
              //       Text(
              //         "*",
              //         style: TextStyle(color: Colors.deepOrangeAccent),
              //       ),
              //       Text(
              //         "Region / State",
              //         style: TextStyle(
              //           fontSize: 15,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              //
              // SizedBox(height: 6,),
              //
              // // Padding(
              // //   padding: const EdgeInsets.only(left: 16,right: 16),
              // //   child: StateListScreen(),
              // // ),
              //
              // // Padding(
              // //   padding: const EdgeInsets.only(left: 16,right: 16),
              // //   child: DropdownButtonFormField<String>(
              // //     decoration: InputDecoration(
              // //       labelText: '--Please Select--',
              // //       enabledBorder: OutlineInputBorder(
              // //         borderSide: const BorderSide(color: Colors.black54),
              // //         borderRadius: BorderRadius.circular(15),
              // //       ),
              // //       border: OutlineInputBorder(
              // //         borderRadius: BorderRadius.circular(15),
              // //       ),
              // //       fillColor: Colors.white,
              // //     ),
              // //     value: _state,
              // //     items: _subjects.map((String subject) {
              // //       return DropdownMenuItem<String>(
              // //         value: subject,
              // //         child: Text(subject),
              // //       );
              // //     }).toList(),
              // //     onChanged: (value) {
              // //       setState(() {
              // //         _state = value!;
              // //       });
              // //     },
              // //   ),
              // // ),

              //Radio Button

              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [Text('Default Adress'), Spacer()],
                ),
              ),

              SizedBox(
                height: 16,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Radio(
                      value: '0',
                      groupValue: _default,
                      onChanged: (value) {
                        setState(() {
                          _default = value as String?;
                        });
                      },
                    ),
                    Text('No'),
                    Radio(
                      value: '1',
                      groupValue: _default,
                      onChanged: (value) {
                        setState(() {
                          _default = value as String?;
                        });
                      },
                    ),
                    Text('Yes'),
                  ],
                ),
              ),

              SizedBox(
                height: 25,
              ),

              ///2
              SizedBox(
                height: 14,
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
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: Center(
                        child: Text(
                      'SAVE ADDRESS',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
                  ),
                ),
              ),

              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
