import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:wayelle/Anetwork/api.dart';
import 'package:wayelle/controllers/favorite_controller.dart';

class FavoriteToggleIcon extends StatelessWidget {
  const FavoriteToggleIcon({Key? key, this.productId}) : super(key: key);
  final productId;

  @override
  Widget build(BuildContext context) {
    //var controller = Get.find<FavoriteController>();
    var controller = Get.put(FavoriteController());

    if (controller.favorites == null ||
        controller.favorites!.wishlist
            .where((element) => element.productId == productId)
            .isEmpty ||
        controller.emptyWishlist == true) {
      controller.isfav.value = false;
    } else {
      controller.isfav.value = true;
    }
    print(controller.favorites);

    return Obx(() => GestureDetector(
          onTap: () async {
            if (controller.isfav.value == false) {
              print("add to fav");
              await controller.addtoWishList(productId);
              controller.isfav.value = true;
            } else {
              print("remove frm fav");
              await controller.removeWishlist(productId);
              controller.isfav.value = false;
            }
          },
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
              shape: BoxShape.circle,
              color:
                  Colors.white, // Customize the color as per your requirement
            ),
            child: Icon(
              controller.isfav.value == false
                  ? Icons.favorite_border
                  : Icons.favorite,
              color: controller.isfav.value == false
                  ? Color(0xFFDADADA)
                  : Colors.pink,
              size: 20,
            ),
          ),
        ));
  }
}
