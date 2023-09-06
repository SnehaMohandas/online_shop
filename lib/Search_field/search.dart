// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;


// class SearchScreen extends StatefulWidget {
//   @override
//   _SearchScreenState createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   TextEditingController _searchController = TextEditingController();
//   List<String> _searchResults = [];

//   Future<void> _searchProducts(String keyword) async {

//     String apiUrl = 'https://globosoft.co.uk/myFitBuddy/api/myfitbuddy/search/1';

//     try {

//       final response = await http.get(Uri.parse(apiUrl));

//       if (response.statusCode == 200) {
//         // API call was successful
//         // Parse the response data and update the search results
//         setState(() {
//           // Assuming the API response is a list of strings
//           _searchResults = List<String>.from(json.decode(response.body));
//         });
//       } else {
//         // API call failed
//         print('Failed to fetch data from the API');
//       }

//     } catch (e) {

//       // Error occurred
//       print('Error: $e');

//     }

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Search'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search...',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.search),
//                   onPressed: () {
//                     // Call the search function when the search button is pressed
//                     String keyword = _searchController.text;
//                     _searchProducts(keyword);
//                   },
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _searchResults.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_searchResults[index]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
