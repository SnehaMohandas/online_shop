import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:wayelle/Checkout_screen/add_address_screen.dart';
import 'package:wayelle/Checkout_screen/checkout_screen.dart';
import 'package:wayelle/controllers/user_controller.dart';
import 'package:wayelle/skelton_drawer/skelton_shippingaddress.dart';

class Shippingaddress extends StatelessWidget {
  Shippingaddress({Key? key, required this.userController}) : super(key: key);
  final UserController userController;
  TextEditingController nameController = TextEditingController();

  TextEditingController addresssController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  TextEditingController postCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var usercntroller = Get.put(UserController());
    print("object");
    print("length${usercntroller.userAddress!.addressesdata.length}");
    for (int i = 0; i < userController.userAddress!.addressesdata.length; i++) {
      userController.checkboxStates.add(false);
    }
    // userController.checkboxStates.forEach(
    //   (element) {
    //     element == false;
    //   },
    // );
    print(usercntroller.checkboxStates);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Shipping Address",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          ),
          leading: GestureDetector(
              onTap: () {
                Get.back();
                //userController.fetchUserAddress();
                // Get.offAll(()=>CheckoutScreen(switchLanguage: switchLanguage, quantity: quantity, totalAmount: totalAmount))
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => AddAddressScreen());
            // Add your action here
          },
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
        ),
        body:
            //  GetBuilder<UserController>(
            //   builder: (controller) {
            // return
            Obx(
          () => usercntroller.isLoading.value
              ? SkeltonAddress()
              : Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
                  child: ListView.builder(
                    //  shrinkWrap: true,
                    itemCount: userController.userAddress!.addressesdata.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          print(usercntroller
                              .userAddress!.addressesdata[index].addressId);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 9),
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 5,
                                  offset: Offset(0, 3))
                            ],
                            color: Colors.white,
                          ),

                          //----------------------------------------------------------------------------------------
                          // child: ListTile(
                          //   leading: Obx(
                          //       //----------------------------------------------
                          //       // () => Checkbox(
                          //       //   // title: Text('Item $index'),
                          //       //   value: userController.isCheckedList[index],
                          //       //   onChanged: (value) async {
                          //       //     await userController.toggleCheckbox(index);
                          //       //     userController.shippingName =
                          //       //         await userController.userAddress!
                          //       //             .addressesdata[index].firstname;
                          //       //     userController.shippingAddress =
                          //       //         await userController.userAddress!
                          //       //             .addressesdata[index].address1;
                          //       //     // .addressesdata[index].firstname;
                          //       //     print(userController.shippingAddress);
                          //       //     // await userController.fetchUserAddress();
                          //       //   },
                          //       // ),
                          //       //--------------------------------
                          //       () => Column(
                          //             mainAxisAlignment: MainAxisAlignment.end,
                          //             // crossAxisAlignment: CrossAxisAlignment.end,
                          //             children: [
                          //               Checkbox(
                          //                 // title: Text('Checkbox $i'),
                          //                 value: userController
                          //                     .checkboxStates[index],
                          //                 onChanged: (value) async {
                          //                   await userController
                          //                       .toggleCheckbox(index);
                          //                   userController.shippingName.value =
                          //                       await userController
                          //                           .userAddress!
                          //                           .addressesdata[index]
                          //                           .firstname;
                          //                   userController.shippingAddress.value =
                          //                       await userController
                          //                           .userAddress!
                          //                           .addressesdata[index]
                          //                           .address1;
                          //                   print(userController.shippingName);
                          //                 },
                          //               ),
                          //             ],
                          //           )),
                          //   title: Text(
                          //     userController
                          //         .userAddress!.addressesdata[index].firstname,
                          //     style: TextStyle(fontSize: 17),
                          //   ),
                          //   subtitle: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         userController
                          //             .userAddress!.addressesdata[index].address1,
                          //         style: TextStyle(fontSize: 16),
                          //       ),
                          //       Text(userController
                          //           .userAddress!.addressesdata[index].postcode),
                          //       Text(userController
                          //           .userAddress!.addressesdata[index].city)
                          //     ],
                          //   ),
                          //   trailing: TextButton(
                          //       onPressed: () {
                          //         nameController.text = usercntroller.userAddress!
                          //             .addressesdata[index].firstname;
                          //         addresssController.text = usercntroller
                          //             .userAddress!.addressesdata[index].address1;
                          //         postCodeController.text = usercntroller
                          //             .userAddress!.addressesdata[index].postcode;
                          //         cityController.text = usercntroller
                          //             .userAddress!.addressesdata[index].city;

                          //         _showBottomSheet(
                          //             context,
                          //             userController.userAddress!
                          //                 .addressesdata[index].addressId);
                          //       },
                          //       child: Text(
                          //         "Edit",
                          //         style: TextStyle(color: Colors.red),
                          //       )),
                          // ),
                          //--------------------------------------
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.35,
                                      // height: double.infinity,
                                      // color: Colors.amber,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 7),
                                            child: Text(
                                              userController
                                                  .userAddress!
                                                  .addressesdata[index]
                                                  .firstname,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 7, top: 3, bottom: 3),
                                            child: Text(
                                              userController
                                                  .userAddress!
                                                  .addressesdata[index]
                                                  .address1,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 7, bottom: 3),
                                            child: Text(
                                              userController
                                                  .userAddress!
                                                  .addressesdata[index]
                                                  .postcode,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 7, bottom: 3),
                                              child: Text(
                                                userController.userAddress!
                                                    .addressesdata[index].city,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Colors.black54),
                                              )),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Obx(
                                                () => Checkbox(
                                                  checkColor: Colors.white,
                                                  fillColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.black),
                                                  // hoverColor: Colors.black,
                                                  // title: Text('Checkbox $i'),
                                                  value: userController
                                                      .checkboxStates[index],
                                                  onChanged: (value) async {
                                                    await userController
                                                        .toggleCheckbox(index);
                                                    print(usercntroller
                                                        .checkboxStates.value);
                                                    userController.shippingName
                                                            .value =
                                                        await userController
                                                            .userAddress!
                                                            .addressesdata[
                                                                index]
                                                            .firstname;
                                                    userController
                                                            .shippingAddress
                                                            .value =
                                                        await userController
                                                            .userAddress!
                                                            .addressesdata[
                                                                index]
                                                            .address1;
                                                    print(userController
                                                        .shippingName);
                                                    userController.shippingCity
                                                            .value =
                                                        await userController
                                                            .userAddress!
                                                            .addressesdata[
                                                                index]
                                                            .city;
                                                    userController
                                                            .shippingPostcode
                                                            .value =
                                                        await userController
                                                            .userAddress!
                                                            .addressesdata[
                                                                index]
                                                            .postcode;
                                                  },
                                                ),
                                              ),
                                              Text(
                                                  "use as the shipping address"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Expanded(
                                    //     child: Column(
                                    //   children: [
                                    //     TextButton(
                                    //       onPressed: () {
                                    //         nameController.text = usercntroller
                                    //             .userAddress!
                                    //             .addressesdata[index]
                                    //             .firstname;
                                    //         addresssController.text =
                                    //             usercntroller
                                    //                 .userAddress!
                                    //                 .addressesdata[index]
                                    //                 .address1;
                                    //         postCodeController.text =
                                    //             usercntroller
                                    //                 .userAddress!
                                    //                 .addressesdata[index]
                                    //                 .postcode;
                                    //         cityController.text = usercntroller
                                    //             .userAddress!
                                    //             .addressesdata[index]
                                    //             .city;

                                    //         _showBottomSheet(
                                    //             context,
                                    //             userController
                                    //                 .userAddress!
                                    //                 .addressesdata[index]
                                    //                 .addressId);
                                    //       },
                                    //       // child: Text(
                                    //       //   "Edit",
                                    //       //   style:
                                    //       //       TextStyle(color: Colors.red),
                                    //       // )
                                    //       child: Icon(
                                    //         Icons.edit,
                                    //         color: Colors.black45,
                                    //       ),
                                    //     ),

                                    //   ],
                                    // ))
                                  ],
                                ),
                                Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 26,
                                      width: 90,
                                      child: ElevatedButton(
                                          style: const ButtonStyle(
                                              // fixedSize: MaterialStatePropertyAll(siz)
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.black)),
                                          onPressed: () {
                                            nameController.text = usercntroller
                                                .userAddress!
                                                .addressesdata[index]
                                                .firstname;
                                            addresssController.text =
                                                usercntroller
                                                    .userAddress!
                                                    .addressesdata[index]
                                                    .address1;
                                            postCodeController.text =
                                                usercntroller
                                                    .userAddress!
                                                    .addressesdata[index]
                                                    .postcode;
                                            cityController.text = usercntroller
                                                .userAddress!
                                                .addressesdata[index]
                                                .city;

                                            _showBottomSheet(
                                                context,
                                                userController
                                                    .userAddress!
                                                    .addressesdata[index]
                                                    .addressId);
                                          },
                                          child: Text("Edit")),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      height: 26,
                                      width: 90,
                                      child: usercntroller.userAddress!
                                                  .addressesdata.length ==
                                              1
                                          ? ElevatedButton(
                                              style: ButtonStyle(
                                                  // fixedSize: MaterialStatePropertyAll(siz)
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.black12)),
                                              onPressed: () {},
                                              child: Text("Delete"),
                                            )
                                          : ElevatedButton(
                                              style: ButtonStyle(
                                                  // fixedSize: MaterialStatePropertyAll(siz)
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.black)),
                                              onPressed: () {
                                                userController.deleteaddress(
                                                    usercntroller
                                                        .userAddress!
                                                        .addressesdata[index]
                                                        .addressId);
                                              },
                                              child: Text("Delete")),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );

                      //---------------------------------------------------------
                    },
                  ),
                ),
        )
        // },
        // ),
        );
  }

  void _showBottomSheet(BuildContext context, String id) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 90),
          //   child: Container(
          //  height: 450,
          //color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4, right: 1),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Edit Address",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
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
                            addresssController.text = value;
                          },
                          controller: addresssController,
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
                            postCodeController.text = value;
                          },
                          controller: postCodeController,
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
                        Get.back();

                        await userController.updateAddress(
                            nameController.text,
                            addresssController.text,
                            cityController.text,
                            postCodeController.text,
                            id);

                        // userController.shippingName.value =
                        //     nameController.text;
                        // userController.shippingAddress.value =
                        //     addresssController.text;

                        userController.dropdownItems = [];

                        // await Get.put(UserController());

                        await userController.fetchUserAddress();
                        //userController.checkboxStates[0] == false;
                        // print(userController
                        //     .userAddress!.addressesdata[0].firstname);
                        print(userController.shippingName);
                        for (int i = 0;
                            i < userController.checkboxStates.length;
                            i++) {
                          userController.checkboxStates[i] = false;
                        }
                        print(userController.checkboxStates.value);
                      },
                      child: Text("Submit"))
                ],
              ),
            ),
            // )
          ),
        );
      },
    );
  }
}
