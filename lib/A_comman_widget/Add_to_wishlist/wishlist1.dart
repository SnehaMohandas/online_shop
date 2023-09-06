// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:flutter_screenutil/screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// // import 'package:grocery_app/Shimmer/wishListShimmer.dart';
// // import 'package:grocery_app/common_widgets/Toast.dart';
// // import 'package:grocery_app/common_widgets/app_button.dart';
// // import 'package:grocery_app/models/Cart_id.dart';
// // import 'package:grocery_app/models/wishlist_id.dart';
// // import 'package:grocery_app/screens/account/Login.dart';
// // import 'package:grocery_app/screens/account/account_screen.dart';
// // import 'package:grocery_app/screens/cart/AddCart.dart';
// // import 'package:grocery_app/screens/cart/cart_screen.dart';
// // import 'package:grocery_app/screens/cart/checkout_bottom_sheet.dart';
// // import 'package:grocery_app/screens/dashboard/dashboard_screen.dart';
// // import 'package:grocery_app/screens/dashboard/navigator_item.dart';
// // import 'package:grocery_app/screens/explore_screen.dart';
// // import 'package:grocery_app/styles/colors.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:wayelle/A_comman_widget/Add_to_wishlist/wish.dart';
// import '../../Anetwork/api.dart';
// // import '../../constant.dart';
// import 'package:http/http.dart' as http;
// // import 'WishScreen.dart';
//
//
//
//
// Map <String,dynamic> jsonResponse3 ;
// List<cartproduct> cart1;
// class WishlistList extends StatefulWidget{
//
//
//
//   @override
//   WishlistList1 createState() => WishlistList1();
// }
// class WishlistList1 extends State<WishlistList> {
//
//   int currentIndex = 1;
//   @override
//   Widget build(BuildContext context) {
//     //print("item==${item}");
//     return Container(
//         child: FutureBuilder(
//             future: _fetchJobs(),
//             builder: (context, snapshot) {
//               print("holooo${snapshot.data}");
//               if (snapshot.hasData) {
//                 List<wishList> cart = snapshot.data[0];
//                 //  cart1 = snapshot.data[0];
//                 print("pro==${cart}");
//                 return Scaffold(
//                   appBar: AppBar(
//                     centerTitle: true,
//                     title: Text("Wish List",style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.primaryColor,fontSize: ScreenUtil().setSp(16)),),
//                     leading: IconButton(
//                       onPressed: () {
//                         // Navigator.of(context).pushReplacement(
//                         //   MaterialPageRoute(builder: (context) =>DashboardScreen()),
//                         // );
//                       },
//                       icon: Icon(Icons.arrow_back,color: Colors.yellow ,size:ScreenUtil().setSp(20)),
//                     ),actions: [
//                     Container(margin: EdgeInsets.only(right: 10),
//                         child: Icon(Icons.favorite,color:Colors.yellow ,size: ScreenUtil().setSp(25),)
//                     ),
//                   ],
//                     backgroundColor: Colors.white,
//                   ),
//                   body:Container(height:MediaQuery.of(context).size.height,
//                     child:SingleChildScrollView(
//
//                       child:
//                       Column(mainAxisAlignment: MainAxisAlignment.start,
//                           children:[
//                             CartProuct(cart),
//
//
//
//
//
//                           ]),
//                     ),
//
//
//                   ),
//                 );
//               } else if (snapshot.hasError) {
//                 print(snapshot.error);
//                 return Scaffold(
//                   body:Container( width: MediaQuery
//                       .of(context)
//                       .size
//                       .width,
//                       height: MediaQuery
//                           .of(context)
//                           .size
//                           .height,
//                       color: Colors.white,
//                       child: Center(
//                           child:Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children:[
//                                 Image.asset("assets/images/WISHLIST EMPTY.png"),
//                               ]
//                           )
//                       )
//                   ),
//                   appBar: AppBar(
//                     centerTitle: true,
//                     title: Text("Add To Wishlist",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.yellow ,fontSize: ScreenUtil().setSp(16)),),
//                     leading: IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: Icon(Icons.arrow_back,color: Colors.yellow ,size: ScreenUtil().setSp(20)),
//                     ),actions: [
//                     // Container(margin: EdgeInsets.only(right: 10),
//                     //     child: Icon(Icons.shopping_cart_sharp,color: AppColors.primaryColor,size: ScreenUtil().setSp(20),)
//                     // ),
//                   ],
//                     backgroundColor: Colors.white,
//                   ),
//
//                 );
//
//
//               }
//               else {
//                 // return WishListShimmer();
//               }
//             }
//         )
//
//     );
//   }
//
//   BottomNavigationBarItem getNavigationBarItem(
//       {required String label, required String iconPath, required int index}) {
//     Color iconColor =
//     index == currentIndex ?Colors.yellow  :  Colors.yellow ;
//     // print("count90-09===${cart_customer_count}");
//     return BottomNavigationBarItem(
//       label: label,
//       icon: iconPath == "assets/icons/cart_icon.svg"&& cart_customer_count != 0&& cart_customer_count != null?new Stack(
//           children: <Widget>[
//             (SvgPicture.asset(
//               iconPath,
//               color: iconColor,
//             )),
//             new Positioned(  // draw a red marble
//               top: 0.0,
//               right: 0.0,
//               child: new Icon(Icons.brightness_1, size: 10.0,
//                   color: Colors.red),
//             )
//           ]
//       ):SvgPicture.asset(
//         iconPath,
//         color: iconColor,
//       ),
//
//     );
//   }
//
//   Widget CartProuct(items) {
//     print("item==");
//
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
//
//       // width: 100,
//       // color: Colors.grey,
//       child: ListView.separated(
//         padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
//         itemCount: items.length,
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         scrollDirection: Axis.vertical,
//         itemBuilder: (context, index) {
//           print("item00000==${items.length}");
//           print("price098===${items[index].price}");
//           return  Dismissible(
//             background: Container(color: Colors.red,
//
//                 child:Container(
//                     padding: EdgeInsets.only(left: MediaQuery.of(context).size.width - 80),
//                     child:Icon(Icons.delete,color: Colors.white,))
//             ),
//             // Each Dismissible must contain a Key. Keys allow Flutter to
//             // uniquely identify widgets.
//             key: UniqueKey(),
//             // Provide a function that tells the app
//             // what to do after an item has been swiped away.
//             onDismissed: (direction) {
//               // Remove the item from the data source.
//               fetchRemove(index,items,items[index].id);
//               setState(() {
//
//
//               });
//
//               // Then show a snackbar.
//               ScaffoldMessenger.of(context)
//                   .showSnackBar(SnackBar(content: Text('${items[index].name} dismissed')));
//             },
//             // child:
//             // WishScreen(
//             //
//             //   item: items[index],
//             //   Index: index,
//             //   // color: gridColors[index % gridColors.length],
//             // ),
//
//
//
//           );
//
//         },
//         separatorBuilder: (BuildContext context, int index) {
//           return SizedBox(
//             width: 20,
//           );
//         },
//       ),
//     );
//   }
//   Widget getCheckoutButton(BuildContext context) {
//     return Container(margin: EdgeInsets.only(top:5),width: 330,
//       height: 40,decoration: BoxDecoration(border: Border.all(color:Colors.yellow ),borderRadius: BorderRadius.circular(10)),
//       // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//       child:FlatButton(
//         child:Text( "Check Out ",style: TextStyle(color: Colors.yellow ,fontWeight: FontWeight.w600,fontSize: 17),),
//         // fontWeight: FontWeight.w600,
//         padding: EdgeInsets.symmetric(vertical: 5),
//         // trailingWidget: getButtonPriceWidget(),
//         onPressed: () {
//           _calculateTotalPrice(cart1);
//           // showBottomSheet(context: context, builder: (BuildContext context) {  }, context: null);
//         },
//       ),
//     );
//   }
//   Widget getPromoButton(BuildContext context) {
//     return Container(margin: EdgeInsets.only(top:5),width: 330,
//       height: 40,decoration: BoxDecoration(border: Border.all(color: Colors.yellow ),borderRadius: BorderRadius.circular(10)),
//       // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//       child:FlatButton(
//         child:Text( "Apply Promo Code ",style: TextStyle(color: Colors.yellow ,fontWeight: FontWeight.w600,fontSize: 17),),
//         // fontWeight: FontWeight.w600,
//         padding: EdgeInsets.symmetric(vertical: 5),
//         // trailingWidget: getButtonPriceWidget(),
//         onPressed: (){
//           showDialog(
//               context: context,
//               builder: (BuildContext context){
//                 return AlertDialog(
//                     contentPadding: EdgeInsets.only(bottom: 0,left: 0,right: 0,top: 0),
//                     actionsPadding:EdgeInsets.only(top: 0,left: 10,right: 10) ,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(32.0))),
//                     // contentPadding: EdgeInsets.only(top: 10.0),
//                     content: Container(
//                       height: 291,
//                       width:300,
//                       child:Column(children:[
//
//                         Container(
//                           height: 150,
//                           child: Image.asset("assets/images/PROMOCODE (1).jpg",),
//                         ),
//                         //SizedBox(height: 10,),
//                         Container(
//                             margin:EdgeInsets.symmetric(horizontal: 10) ,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               border: Border.all(color:Colors.yellow ),
//                             ),
//                             child:Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 10),
//                                 child: TextField(
//                                   decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     hintText: "Enter your Promo Code",
//                                     hintStyle: TextStyle(color: Colors.grey),
//                                   ),
//                                 )
//                             )
//                         ),
//
//                         SizedBox(height: 25,),
//
//                         InkWell(
//                             child:Container(
//                                 width: 450,
//                                 height: 65,
//                                 padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
//                                 decoration: BoxDecoration(
//                                   color: Colors.yellow ,
//                                   borderRadius: BorderRadius.only(
//                                       bottomLeft: Radius.circular(32.0),
//                                       bottomRight: Radius.circular(32.0)),
//                                 ),
//
//                                 child: FlatButton(
//                                     child:const
//                                     Text(
//                                       "Apply",
//                                       style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
//                                       textAlign: TextAlign.center,
//                                     ),
//                                     onPressed: ()=>{
//                                       Fluttertoast.showToast(
//                                         msg: "Promo Code Applied",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT,
//                                       ),}
//                                 )
//                             )
//                         ),
//
//                       ],
//                       ),
//                     )
//                 );
//               });
//         },
//       ),
//     );
//   }
//   static double _calculateTotalPrice(List<cartproduct> items) {
//
//     final double price = items.fold(
//         0, (accumulator, item) =>
//
//     accumulator + ( double.parse(item.quantity)* double.parse(item.price1.substring(1))));
//     print("price123456789===${price}");
//
//     return double.parse(price.toStringAsFixed(2));
//   }
//
//   // void showBottomSheet(context) {
//   //   showModalBottomSheet(
//   //       context: context,
//   //       isScrollControlled: true,
//   //       backgroundColor: Colors.transparent,
//   //       builder: (BuildContext bc) {
//   //         return CheckoutBottomSheet();
//   //       });
//   // }
// }
// Future  fetchRemove(int index,item, String WishId) async {
//   //print("berin===${Cartid}");
//   print("api====${baseUrl}/removeWishlist/key/123456789'");
//
//   var response = await http.post(
//       Uri.parse('${baseUrl}/removeWishlist/key/123456789'),
//       body: {
//         'customer_id':Cus_id == null?CustomerId:Cus_id,'product_id':WishId
//       });
//
//   print("hi====${response.statusCode}");
//
//   if (response.statusCode == 200) {
//     Map<String,dynamic> jsonResponse = json.decode(response.body);
//     print(jsonResponse);
//     print("index=====${index}");
//     item.removeAt(index);
//
//
//     return jsonResponse ;
//
//
//   } else {
//     print(response.statusCode);
//     throw 'Problem with the get request';
//   }
// }
//
// Future _fetchJobs() async {
//   // print("berin");
//   // print('cutomerid09==${CustomerId}');
//   // print("cus090${Cus_id}");
//
//   String customerId = Cus_id == null?CustomerId:Cus_id;
//
//   print("customer===>..${customerId}");
//   var response = await http.post(
//       Uri.parse('${baseUrl}/wishlist/key/123456789'),
//
//       body: {
//         'customer_id': customerId,
//       });
//   if (response.statusCode == 200) {
//
//     List jsonResponse = json.decode(response.body)['wishlist'];
//     print(jsonResponse);
//     return [jsonResponse.map((cartpro) => new wishList.fromJson(cartpro)).toList()];
//   } else {
//     print(response.statusCode);
//     throw 'Problem with the get request';
//   }
// }