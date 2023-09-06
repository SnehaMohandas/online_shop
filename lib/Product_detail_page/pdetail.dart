// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import '../A_comman_widget/Add_to_cart/add_to_cart.dart';
// import '../A_comman_widget/Add_to_wishlist/add_to_wishlist.dart';
// import '../A_comman_widget/Detail_page/detail_page.dart';
// import '../A_comman_widget/Home_page/latest_products.dart';
// import '../A_comman_widget/Home_page/spring_summer.dart';
// import '../Home_screen/org_home.dart';

// class Post {
//   final String name;
//   final String thumb;
//   final String price;
//   final String id;
//   final String description;
//   final String quantity;

//   Post({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.quantity,
//     required this.description,
//     required this.thumb,
//   });

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       name: json['name'],
//       thumb: json['thumb'],
//       price: json['price'],
//       id: json['id'],
//       description: json['description'],
//       quantity: json['quantity'],
//     );
//   }
// }

// Future<Post> fetchPost() async {
//   try {
//     final response = await http.get(Uri.parse('https://globosoft.org/2023/02/wayelle2/api/getProduct/p_id/43/key/123456789'));

//     if (response.statusCode == 200) {
//       Map<String, dynamic> jsonResponse = json.decode(response.body);
//       print("Response body: $jsonResponse");
//       Map<String, dynamic>? product = jsonResponse['product'];
//       if (product != null) {
//         return Post.fromJson(product);
//       } else {
//         throw Exception('Product not found');
//       }
//     } else {
//       throw Exception('Failed to load post');
//     }
//   } catch (error) {
//     print(error);
//     throw Exception('Failed to make the API call');
//   }
// }

// class ProductDetaiiil extends StatelessWidget {
//   const ProductDetaiiil({Key? key, required this.switchLanguage, String? id}) : super(key: key);
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
//         child: FutureBuilder<Post>(
//           future: fetchPost(),
//           builder: (context, snapshot) {
//             print("Snapshot: $snapshot");

//             if (snapshot.hasData) {
//               Post post = snapshot.data!;
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
//                         color: Colors.grey,
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
//                             border: Border.all(width: 2, color: Colors.black12)
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

//                   Pdsliding(switchLanguage: (String ) {  },),
//                   // AddToCartButton(product_id:43,useridd:10),

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
//               children: const [
//                 Spacer(),
//                 Center(child: CircularProgressIndicator()),
//                 Spacer(),
//               ],
//             );
//             },
//         ),
//       ),
//     );
//   }
// }