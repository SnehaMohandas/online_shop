import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wayelle/Anetwork/api.dart';

import '../Amodule/model/favorite_model.dart';
import 'package:http/http.dart' as http;

class FavoriteController extends GetxController {
  Favorites? favorites;
  var isLoading = true.obs;
  var isfav = false.obs;
  var emptyWishlist;

  void toggleFavorite(String id) {
    if (favorites!.wishlist.contains(id)) {
      removeWishlist(id);
    } else {
      addtoWishList(id);
    }
  }

  removeWishlist(product_id) async {
    var response = await http.post(
        Uri.parse('${baseurl}api/removeWishlist/key/123456789'),
        body: {'customer_id': customer_id, 'product_id': product_id});
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data["success"]);

      print(' =${response.body}');
      Fluttertoast.showToast(
        msg: "Removed from WishList",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
      );
      fetchWishList();
      update();
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }

  addtoWishList(product_id) async {
    var response = await http.post(
        Uri.parse('${baseurl}api/addWishlist/key/123456789'),
        body: {'customer_id': customer_id, 'product_id': product_id});
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data["success"]);

      Fluttertoast.showToast(
        msg: "Added to WishList",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
      );
      fetchWishList();
      update();
    } else {
      throw 'Problem with the get request';
    }
  }

  fetchWishList() async {
    try {
      isLoading(true);
      var response =
          await http.post(Uri.parse("${baseurl}api/wishlist/key/123456789"),
              body: ({
                "customer_id": customer_id,
              }));
      if (response.statusCode == 200) {
        var jsondata = json.decode(response.body);
        if (jsondata['wishlist'] == "Wishlist Empty") {
          emptyWishlist = true;
          print(emptyWishlist);
        } else {
          emptyWishlist = false;
          print(emptyWishlist);
        }

        print("response..body${response.body}");
        var data = favoritesFromJson(response.body);
        favorites = data;
        isLoading(false);
        // if (favorites == null) {
        //   print("fav null");
        // } else {
        //   print("not null");
        // }
        print("favouritessssss${favorites!}");
        // print("responsee favvv${response.body}");
      } else {
        throw "Problem while fetching data from API";
      }
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchWishList();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   FavoriteController().onClose();
  //   // TODO: implement onClose
  //   super.onClose();
  // }

  // @override
  // // TODO: implement onDelete
  // InternalFinalCallback<void> get onDelete => super.onDelete;
}
