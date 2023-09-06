// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';
// import 'package:get/route_manager.dart';
// import 'package:wayelle/controllers/user_controller.dart';

// class PaymentMethodScreen extends StatelessWidget {
//   const PaymentMethodScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.find<UserController>();
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: true,
//         leading: GestureDetector(
//             onTap: () {
//               Get.back();
//             },
//             child: Icon(
//               Icons.arrow_back_ios,
//               color: Colors.black,
//             )),
//         title: Text(
//           'Payment Methods',
//           style: TextStyle(
//               fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text("Select Payment Method",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//               SizedBox(
//                 height: 20,
//               ),
//               // ListView.builder(
//               //     shrinkWrap: true,
//               //     itemCount: controller.payment!.paymentMethod.length,
//               //     itemBuilder: (context, index) {
//               //       return Container(
//               //           margin: EdgeInsets.only(top: 8, bottom: 8),
//               //           height: MediaQuery.of(context).size.height * 0.083,
//               //           width: double.infinity,
//               //           decoration: BoxDecoration(
//               //             boxShadow: [
//               //               BoxShadow(
//               //                   color: Colors.grey.withOpacity(0.3),
//               //                   blurRadius: 5,
//               //                   offset: Offset(0, 3))
//               //             ],
//               //             color: Colors.white70,
//               //           ),
//               //           child: ListTile(
//               //             title: Text(
//               //               controller.payment!.paymentMethod[index].code,
//               //               style: TextStyle(fontSize: 16),
//               //             ),
//               //             trailing: Icon(
//               //               Icons.keyboard_arrow_down,
//               //               color: Colors.black,
//               //             ),
//               //           ));
//               //     })
//               Container(
//                 margin: EdgeInsets.only(top: 8, bottom: 8),
//                 height: MediaQuery.of(context).size.height * 0.083,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey.withOpacity(0.3),
//                         blurRadius: 5,
//                         offset: Offset(0, 3))
//                   ],
//                   color: Colors.white70,
//                 ),
//                 child: ListTile(
//                   title: Text(
//                     controller.payment!.paymentMethod[0].code,
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   onTap: () {
//                     controller.toggleCheckbox();
//                     //print(controller.payment!.paymentMethod[1].code);
//                   },
//                   trailing: Obx(
//                     () => Visibility(
//                       visible: controller.isChecked.value,
//                       child: Checkbox(
//                         value: controller.isChecked.value,
//                         onChanged: (value) {
//                           controller.toggleCheckbox();
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Center(
//                   child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                       ),
//                       onPressed: () {
//                         controller.isPaymentSelect(true);
//                         Get.back(
//                             result: controller.payment!.paymentMethod[0].code
//                                 .toString());
//                       },
//                       child: Text("Submit"))),

//               // Obx(
//               //   () => Center(
//               //     child: AnimatedOpacity(
//               //       opacity: controller.isTickVisible.value ? 1 : 0,
//               //       duration: Duration(milliseconds: 500),
//               //       child: Column(
//               //         children: [
//               //           Icon(
//               //             Icons.check_circle,
//               //             size: 44,
//               //             color: Colors.green,
//               //           ),
//               //           Text(
//               //             "Done",
//               //             style: TextStyle(color: Colors.green),
//               //           )
//               //         ],
//               //       ),
//               //     ),
//               //   ),
//               //),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
