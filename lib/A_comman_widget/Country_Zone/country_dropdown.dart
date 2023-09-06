//
//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// import 'package:flutter/material.dart';
//
// // class Product {
// //   final String name;
// //
// //   Product({required this.name});
// //
// //   factory Product.fromJson(Map<String, dynamic> json) {
// //     return Product(name: json['name'] as String);
// //   }
// // }
//
// class Product {
//   final String cart_id;
//
//
//   Product({
//     required this.cart_id,
//   });
//
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       cart_id: json['name'],
//     );
//   }
// }
// Future<Post> fetchPost() async {
//
// Future<Post> _fetchJobs() async {
//   // print("berin");
//   // print('cutomerid09==${CustomerId}');
//   // print("cus090${Cus_id}");
//   //
//   // String customerId = Cus_id == null ? CustomerId : Cus_id;
//   // print("customer===>..${customerId}");
//   var response = await http.post(
//       Uri.parse('https://globosoft.org/2023/02/wayelle2/api/cartproduct/key/123456789'),
//
//       body: {
//         'customer_id': '10',
//       });
//   if (response.statusCode == 200) {
//     List jsonResponse = json.decode(response.body)['Product'];
//     print("response========>>>${jsonResponse}");
//
//     return [
//       jsonResponse.map((cartpro) => new Product.fromJson(cartpro))
//           .toList()
//     ];
//
//   }
//
//
//   else {
//     print(response.statusCode);
//     throw 'Problem with the get request';
//   }
//
// }
//
//
//
// class ProductScreen extends StatelessWidget {
//   final int customerId;
//
//   ProductScreen({required this.customerId});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Screen'),
//       ),
//       body: Center(
//         child: FutureBuilder<Product>(
//           future: _fetchJobs(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Text('Name: ${snapshot.data!.cart_id}');
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             }
//             return CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
// }
//
