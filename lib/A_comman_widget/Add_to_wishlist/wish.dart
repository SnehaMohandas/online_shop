// import 'dart:convert';
// import 'package:http/http.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import '../../Home_screen/org_home.dart';
// import '../../Login_screen/login_screen.dart';
// import 'add_to_wishlist.dart';

// class wishList {
//   final String name;
//   final String thumb;
//   final String price;
//   final String id;
//   final String Special;
//   final String Stock;

//   wishList({required this.name, required this.thumb,required this.price,required this.id,required this.Special,required this.Stock});
//   factory wishList.fromJson(Map<String, dynamic> json) {

//     return wishList(
//         name:json['name'],
//         thumb: json['thumb'],
//         price: json['price'],
//         id: json['product_id'],
//         Special:json['special'].toString(),
//         Stock: json['stock']
//     );
//   }
// }

// Future fetchJobs() async {
//   print("berin");


//   String customerId = user_id as String;

//   print("customer===>..${customerId}");
//   var response = await http.post(
//       Uri.parse('https://globosoft.org/2023/02/wayelle2/api/wishlist/key/123456789'),

//       body: {
//         'customer_id': '10',
//       });
//   if (response.statusCode == 200) {
//     List jsonResponse = json.decode(response.body)['wishlist'];
//     print(jsonResponse);
//     return [jsonResponse.map((cartpro) => new wishList.fromJson(cartpro)).toList()];
//   } else {
//     print(response.statusCode);
//     throw 'Problem with the get request';
//   }
// }


// class ProductDetaiiil extends StatelessWidget {
//   const ProductDetaiiil({Key? key, required this.switchLanguage}) : super(key: key);
//   final Function(String) switchLanguage;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFFF9F9F9),
//         elevation: 0,
//         centerTitle: true,
//         leading: GestureDetector(
//             onTap: (){
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Orghome(switchLanguage: (String ) {  },),
//                 ),
//               );
//             },
//             child: Icon(Icons.arrow_back_ios,color: Colors.black,)
//         ),
//         // title: Text('SHORT DRESS',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),),
//         actions: [
//           Icon(Icons.share,color: Colors.black,),
//           SizedBox(width: 8,)
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: FutureBuilder<wishList>(
//           // future: fetchJobs(),
//           builder: (context, snapshot) {
//             print("Snapshot: $snapshot");


//             if (snapshot.hasData) {
//               wishList post = snapshot.data!;
//               print("Post Name: ${post.name}");
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Stack(
//                     alignment: Alignment.bottomRight,
//                     children: [
//                       Container(
//                         height: 410,
//                         width: double.infinity,
//                         color: Colors.blue,
//                         child: Image(image: NetworkImage(post.thumb),fit: BoxFit.cover,),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(14.0),
//                         child: Container(
//                           width: 36, // Diameter = radius * 2
//                           height: 36, // Diameter = radius * 2
//                           decoration: BoxDecoration(
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 5,
//                                 blurRadius: 10,
//                                 offset: Offset(0, 3),
//                               ),
//                             ],
//                             shape: BoxShape.circle,
//                             color: Colors.white, // Customize the color as per your requirement
//                           ),
//                           child: FavoriteToggleIcon(),
//                         ),
//                       )
//                     ],
//                   ),

//                   SizedBox(height: 10,),

//                   Row(
//                     children: [

//                       Spacer(),

//                       Container(
//                         height: 7,
//                         width: 18,
//                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),color: Colors.black),
//                       ),

//                       SizedBox(width: 5,),

//                       Container(
//                         height: 7,
//                         width: 18,
//                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),color: Colors.black38),
//                       ),

//                       SizedBox(width: 5,),

//                       Container(
//                         height: 7,
//                         width: 18,
//                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(3),color: Colors.black38),
//                       ),
//                       Spacer(),
//                     ],
//                   ),

//                   SizedBox(height: 10,),

//                   Row(
//                     children: [
//                       SizedBox(width: 16,),
//                       Text(post.name,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.black),)
//                     ],
//                   ),

//                   SizedBox(height: 7,),

//                   Row(
//                     children: [
//                       SizedBox(width: 14,),
//                       Icon(Icons.star,color: Color(0xFFFFBA49),size: 18,),
//                       Icon(Icons.star,color: Color(0xFFFFBA49),size: 18,),
//                       Icon(Icons.star,color: Color(0xFFFFBA49),size: 18,),
//                       Icon(Icons.star,color: Color(0xFFFFBA49),size: 18,),
//                       Icon(Icons.star_border,color: Colors.black38,size: 18,),
//                     ],
//                   ),

//                   ///Size list

//                   SizedBox(height: 16,),

//                   Padding(
//                     padding: const EdgeInsets.only(left: 16,right: 16),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 40,width: 40,
//                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,
//                               border: Border.all(width: 2, color: Colors.black12)
//                           ),
//                           child: Center(child: Text('XS',style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black),)),
//                         ),
//                         SizedBox(width: 16,),
//                         Container(
//                           height: 40,width: 40,
//                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black,
//                               border: Border.all(width: 2, color: Colors.black12)
//                           ),
//                           child: Center(child: Text('S',style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white),)),
//                         ),
//                         SizedBox(width: 16,),
//                         Container(
//                           height: 40,width: 40,
//                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,
//                               border: Border.all(width: 2, color: Colors.black12)
//                           ),
//                           child: Center(child: Text('M',style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black),)),
//                         ),
//                         SizedBox(width: 16,),
//                         Container(
//                           height: 40,width: 40,
//                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,
//                               border: Border.all(width: 2, color: Colors.black12)
//                           ),
//                           child: Center(child: Text('L',style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black),)),
//                         ),
//                         SizedBox(width: 16,),
//                       ],
//                     ),
//                   ),

//                   SizedBox(height: 16,),

//                   /// Add to cart button

//                   Padding(
//                     padding: const EdgeInsets.only(left: 15,right: 15),
//                     child: Container(
//                       height: 55,
//                       width: double.infinity,
//                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.black),
//                       child: Center(child: Text('ADD TO CART',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),)),
//                     ),
//                   ),

//                   /// you may also like this

//                   SizedBox(height: 22,),

//                   Row(
//                     children: [
//                       SizedBox(width: 16,),
//                       Text('You may also like this',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),)
//                     ],
//                   ),

//                   SizedBox(height: 10,),

//                   Padding(
//                     padding: const EdgeInsets.only(left: 16,right: 16),
//                     child: Container(
//                       height: 1,
//                       width: double.infinity,
//                       color: Colors.black12,
//                     ),
//                   ),

//                   SizedBox(height: 10,),

//                   Padding(
//                     padding: const EdgeInsets.only(left: 16,right: 16),
//                     child: Row(
//                       children: [
//                         Text('Customer reviews',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.black),),
//                         Spacer(),
//                         Icon(Icons.arrow_forward_ios,color: Colors.black,size: 16,)
//                       ],
//                     ),
//                   ),

//                   SizedBox(height: 15,),

//                   Padding(
//                     padding: const EdgeInsets.only(left: 16,right: 16),
//                     child: Container(
//                       height: 1,
//                       width: double.infinity,
//                       color: Colors.black12,
//                     ),
//                   ),

//                   SizedBox(height: 20,),

//                   Padding(
//                     padding: const EdgeInsets.only(left: 16,right: 16),
//                     child: Row(
//                       children: [
//                         Text('Top reviews',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.black),),
//                         Spacer()
//                       ],
//                     ),
//                   ),

//                   SizedBox(height: 15,),
//                 ],
//               );

//             } else if (snapshot.hasError) {
//               print("Error: ${snapshot.error}");
//               return Text("${snapshot.error}");
//             }

//             return Column(mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Spacer(),
//                 Center(child: CircularProgressIndicator()),
//                 Spacer(),
//               ],
//             );

//           },
//         ),
//       ),
//     );
//   }
// }


