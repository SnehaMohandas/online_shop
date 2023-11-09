import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
//import 'package:get/get.dart';
import 'package:wayelle/A_comman_widget/Detail_page/details_page.dart';
import 'package:wayelle/controllers/product_details_controller.dart';

import '../../Amodule/bloc/spring_summer.dart';
import '../../Amodule/model/spring_summer.dart';
import '../../Anetwork/response.dart';
import 'package:get/get_core/get_core.dart';

class SimilarProducts extends StatelessWidget {
  const SimilarProducts(
      {Key? key, required this.productid, required this.switchLanguage})
      : super(key: key);
  final productid;
  final Function(String) switchLanguage;

  @override
  Widget build(BuildContext context) {
    var productDetailController = Get.put(ProductDetailsController(productid));
    return Obx(
      () => productDetailController.emptySimilarpdts.value == "false"
          ? Center(
              child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "You may also like this",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // horizontal scrolling
                  Container(
                    height: 225,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productDetailController
                            .similarProducts!.relatedproduct.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 125,
                              height: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 2,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      //  print("pressed");

                                      Get.offAll(
                                        () => ProductDetailsScreen(
                                            productid: productDetailController
                                                .similarProducts!
                                                .relatedproduct[index]
                                                .productId,
                                            switchLanguage: switchLanguage),
                                      );
                                    },
                                    child: Container(
                                      height: 155,
                                      width: 121,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image(
                                          image: NetworkImage(
                                              '${productDetailController.similarProducts!.relatedproduct[index].thumb}'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Material(
                                          child: Text(
                                        productDetailController.similarProducts!
                                            .relatedproduct[index].name,
                                        style: TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 2, right: 2),
                                    child: Row(
                                      children: [
                                        Material(
                                          child: Text(
                                            productDetailController
                                                .similarProducts!
                                                .relatedproduct[index]
                                                .price
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationThickness: 2.85,
                                                color: Color(0xFFFF0000)),
                                          ),
                                        ),
                                        Spacer(),
                                        Material(
                                          child: Text(
                                            productDetailController
                                                .similarProducts!
                                                .relatedproduct[index]
                                                .price
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ))
          : Visibility(
              visible: false,
              child: Center(
                child: Text(""),
              ),
            ),
    );
  }
}
