// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class Category {
//   final int category_id;
//   final String name;
//   final String? image;
//
//   Category({
//     required this.category_id,
//     required this.name,
//     this.image,
//   });
//
//   factory Category.fromJson(Map<String, dynamic> json) {
//     return Category(
//       category_id: int.parse(json['category_id'].toString()),
//       name: json['name'],
//       image: json['image'],
//     );
//   }
// }
//
// class CategoryListPage extends StatefulWidget {
//   const CategoryListPage({Key? key}) : super(key: key);
//
//   @override
//   _CategoryListPageState createState() => _CategoryListPageState();
// }
//
// class _CategoryListPageState extends State<CategoryListPage> {
//   List<Category> categories = [];
//   bool isLoading = false;
//   int selectedCategoryId = -1;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchCategories();
//   }
//
//   Future<void> _fetchCategories() async {
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       final response = await http.get(
//         Uri.parse('https://globosoft.org/2023/02/wayelle2/api/getCategories/key/123456789',),
//       );
//
//       if (response.statusCode == 200) {
//         final jsonResponse = json.decode(response.body);
//
//         if (jsonResponse['category_info'] != null) {
//           final List<dynamic> categoryList = jsonResponse['category_info'];
//
//           setState(() {
//             categories = categoryList
//                 .map((category) => Category.fromJson(category))
//                 .toList();
//             isLoading = false;
//           });
//         }
//       } else {
//         throw Exception('Failed to load categories from API');
//       }
//     } catch (error) {
//       throw Exception('Failed to fetch categories: $error');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         title: Text(
//           'Categories',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//           ),
//         ),
//         leading: Icon(
//           Icons.arrow_back_ios,
//           color: Colors.black,
//         ),
//         actions: [
//           Icon(
//             Icons.search,
//             color: Colors.black,
//           ),
//           SizedBox(width: 10)
//         ],
//       ),
//       body: isLoading
//           ? Center(
//         child: CircularProgressIndicator(),
//       )
//           : Column(
//         children: [
//           SizedBox(height: 8,),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 150,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                 children: [
//                   Spacer(),
//                   Text('SUMMER SALES',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w100,color: Colors.white),),
//                   SizedBox(height: 6,),
//                   Text('Up to 50% off',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white),),
//                   Spacer(),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: categories.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final category = categories[index];
//                 final imageUrl = category.image ?? 'https://dummyurl.com/image.jpg';
//
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           height: 150,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:Radius.circular(10) ),
//                         color: Colors.white,),
//                           child: Center(child: Text(category.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),)),
//                         ),
//                       ),
//                       Expanded(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight:Radius.circular(10) ),
//                             color: Colors.blue,),
//                           height: 150,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight:Radius.circular(10) ),
//                             child: Image.network(
//                               imageUrl,
//                               fit: BoxFit.cover,
//                               errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
//                                 return Image.network('https://img.freepik.com/free-photo/beautiful-pet-portrait-small-dog-cat_23-2149218512.jpg?size=626&ext=jpg&ga=GA1.1.241598751.1685182454&semt=sph', fit: BoxFit.cover);
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// // import 'package:flutter/material.dart';
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// // import 'package:wayelle/Amodule/bloc/countries.dart';
// //
// // class Cate {
// //   final String name;
// //   final String image;
// //   final String category_id;
// //
// //   Cate({
// //     required this.name,
// //     required this.image,
// //     required this.category_id
// //   });
// //
// //   factory Cate.fromJson(Map<String, dynamic> json) {
// //     return Cate(
// //       name: json['name'],
// //       image: json['image'],
// //       category_id: json['category_id'],
// //     );
// //   }
// // }
// //
// // Future<Cate> fetchPost() async {
// //   try {
// //     final response = await http.get(Uri.parse('https://globosoft.org/2023/02/wayelle2/api/getCategories/key/123456789'));
// //
// //     if (response.statusCode == 200) {
// //       Map<String, dynamic> jsonResponse = json.decode(response.body);
// //       print("Response body: $jsonResponse");
// //       Map<String, dynamic>? product = jsonResponse['category_info'];
// //
// //       if (product != null) {
// //         return Cate.fromJson(product);
// //       } else {
// //         throw Exception('Product not found');
// //       }
// //     } else {
// //       throw Exception('Failed to load post');
// //     }
// //   } catch (error) {
// //     print(error);
// //     throw Exception('Failed to make the API call');
// //   }
// // }
// //
// // class Cattt extends StatefulWidget {
// //   const Cattt({Key? key}) : super(key: key);
// //
// //   @override
// //   State<Cattt> createState() => _CatttState();
// // }
// //
// // class _CatttState extends State<Cattt> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: FutureBuilder<Cate>(
// //           future: fetchPost(),
// //           builder: (context, snapshot) {
// //             print("Snapshot: $snapshot");
// //             if (snapshot.hasData) {
// //               Cate cate = snapshot.data!;
// //               print("Post Name: ${cate.name}");
// //               return Column(
// //                 children: [
// //                   Text(cate.name),
// //                   Text(cate.category_id),
// //                   // Image(image: NetworkImage(post.image))
// //                 ],
// //               );
// //               //   ListTile(
// //               //   title: Text(post.name),
// //               // );
// //             } else if (snapshot.hasError) {
// //               print("Error: ${snapshot.error}");
// //               return Text("${snapshot.error}");
// //             }
// //             return CircularProgressIndicator();
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
