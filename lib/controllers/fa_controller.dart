// import 'dart:convert';

// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:wayelle/Anetwork/api.dart';

// import '../Amodule/model/favorite_model.dart';

// class FaController extends GetxController {
//   var isLoading = true.obs;
//   Favorites? favorites;
//   var isWishlist = false.obs;
//   fetchWishLists() async {
//     try {
//       isLoading(true);
//       print("favloadinggg${isLoading}");
//       var response =
//           await http.post(Uri.parse("${baseurl}api/wishlist/key/123456789"),
//               body: ({
//                 "customer_id": customer_id,
//               }));
//       print(response.statusCode);
//       if (response.statusCode == 200) {
//         var datas = json.decode(response.body);
//         print(datas["wishlist"]);
//         print(response.body);
//         var data = favoritesFromJson(response.body);
//         // print(data);
//         favorites = data;
//         print("favouritessssss${favorites!}");
//         // print("responsee favvv${response.body}");
//       } else {
//         throw "Problem while fetching data from API";
//       }
//     } catch (e) {
//     } finally {
//       isLoading(false);
//     }
//   }

//   removeWishlist(product_id) async {
//     var response = await http.post(
//         Uri.parse('${baseurl}api/removeWishlist/key/123456789'),
//         body: {'customer_id': customer_id, 'product_id': product_id});
//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       print(data["success"]);

//       print(' =${response.body}');
//       Fluttertoast.showToast(
//         msg: "Removed from WishList",
//         gravity: ToastGravity.BOTTOM,
//         toastLength: Toast.LENGTH_SHORT,
//       );
//       update();
//     } else {
//       print(response.statusCode);
//       throw 'Problem with the get request';
//     }
//   }

//   addtoWishList(product_id) async {
//     var response = await http.post(
//         Uri.parse('${baseurl}api/addWishlist/key/123456789'),
//         body: {'customer_id': customer_id, 'product_id': product_id});
//     if (response.statusCode == 200) {
//       var data = json.decode(response.body);
//       print(data["success"]);

//       print(' =${response.body}');
//       Fluttertoast.showToast(
//         msg: "Added to WishList",
//         gravity: ToastGravity.BOTTOM,
//         toastLength: Toast.LENGTH_SHORT,
//       );
//       update();
//     } else {
//       print(response.statusCode);
//       throw 'Problem with the get request';
//     }
//   }

//   @override
//   void onInit() {
//     fetchWishLists();
//     super.onInit();
//   }
// }
