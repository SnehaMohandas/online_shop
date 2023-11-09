import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:wayelle/controllers/user_controller.dart';

class AddAddressScreen extends StatelessWidget {
  AddAddressScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  TextEditingController postcodeController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userController = Get.find<UserController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Add Address",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4, right: 6),
              child: Container(
                margin: EdgeInsets.only(bottom: 5),
                height: MediaQuery.of(context).size.height * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ],
                  color: Colors.white70,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextFormField(
                    onFieldSubmitted: (value) {
                      nameController.text = value;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "First name",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4, right: 6),
              child: Container(
                margin: EdgeInsets.only(bottom: 5),
                height: MediaQuery.of(context).size.height * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ],
                  color: Colors.white70,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextFormField(
                    onFieldSubmitted: (value) {
                      addressController.text = value;
                    },
                    controller: addressController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Address",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4, right: 6),
              child: Container(
                margin: EdgeInsets.only(bottom: 5),
                height: MediaQuery.of(context).size.height * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ],
                  color: Colors.white70,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextFormField(
                    onFieldSubmitted: (value) {
                      postcodeController.text = value;
                    },
                    controller: postcodeController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Post code",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4, right: 6),
              child: Container(
                margin: EdgeInsets.only(bottom: 5),
                height: MediaQuery.of(context).size.height * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ],
                  color: Colors.white70,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TextFormField(
                    onFieldSubmitted: (value) {
                      cityController.text = value;
                    },
                    // expands: true,
                    controller: cityController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "City",
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () async {
                  await userController.addAddress(
                    nameController.text,
                    addressController.text,
                    cityController.text,
                    postcodeController.text,
                  );
                  Get.back();

                  print("address aded");
                  userController.dropdownItems = [];

                  await userController.fetchUserAddress();
                  for (int i = 0;
                      i < userController.checkboxStates.length;
                      i++) {
                    userController.checkboxStates[i] = false;
                  }
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
