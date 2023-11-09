import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:wayelle/A_comman_widget/Detail_page/details_page.dart';
import 'package:wayelle/controllers/all_products_controller.dart';
import 'package:wayelle/controllers/search_controller.dart';
import 'package:wayelle/skelton_drawer/skelton_favorite.dart';

import '../A_comman_widget/bottom navigationbar.dart';

class Getallproducts extends StatelessWidget {
  Getallproducts({Key? key, required this.switchLanguage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = Get.put(SearchControllers());
    var allproductController = Get.put(AllproductController());
    searchController.searchTapped.value = false;
    searchController.successvalue.value = "";
    print("pdt screen rebuild");

    return Scaffold(
        appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  Get.offAll(() => Bottomnavigation(
                        switchLanguage: (String) {},
                      ));
                  //  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Obx(
              () => searchController.searchTapped.value == true
                  ? Container(
                      width: 250,
                      height: 40,
                      child: TextField(
                        onChanged: (value) async {
                          if (value == "") {
                            searchController.successvalue.value = "";
                            // await subscription!.cancel();
                            print(
                                "successssvalueee${searchController.successvalue}");
                          }

                          print("search");
                          if (value != "") {
                            await searchController.featchSeachResult(value);
                            print(
                                "svalue${searchController.successvalue.value}");
                          }
                        },
                        controller: searchControllers,
                        autofocus: true,
                        decoration: const InputDecoration(
                            hintText: "search what you need...",
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0.5, color: Colors.black45),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0.5, color: Colors.black45),
                            ),
                            border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 0.5, color: Colors.black45),
                            )
                            //InputBorder.none
                            ),
                      ),
                    )
                  : Text(
                      "All products",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
            ),
            centerTitle: true,
            actions: [
              Obx(
                () => searchController.searchTapped.value == true
                    ? IconButton(
                        onPressed: () async {
                          if (searchControllers.text == "") {
                            searchController.successvalue.value = "";
                            // await subscription!.cancel();
                            print(
                                "successssvalueee${searchController.successvalue}");
                          }

                          print("search");
                          if (searchControllers.text != "") {
                            await searchController
                                .featchSeachResult(searchControllers.text);
                            print(
                                "svalue${searchController.successvalue.value}");
                          }
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ))
                    : IconButton(
                        onPressed: () {
                          searchController.searchTapped.value = true;
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
              )
            ]),
        body: Obx(() => searchController.successvalue == ""
            ? allproductController.isLoading.value == true
                ? SkeltonFav()
                : allproductController.allproducts == null
                    ? SkeltonFav()
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: allproductController
                                  .allproducts!.products.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 16,
                                      mainAxisExtent: 260),
                              itemBuilder: (context, index) {
                                return Container(
                                    width: 10,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            FocusScope.of(context).unfocus();
                                            Get.to(() => ProductDetailsScreen(
                                                productid: allproductController
                                                    .allproducts!
                                                    .products[index]
                                                    .id,
                                                switchLanguage:
                                                    switchLanguage));
                                          },
                                          child: Container(
                                            height: 184,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.grey),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.network(
                                                "${allproductController.allproducts!.products[index].thumb.toString()}",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Row(
                                            children: [
                                              Text(
                                                allproductController
                                                    .allproducts!
                                                    .products[index]
                                                    .name,
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.fade,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 11,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 3, right: 3),
                                          child: Row(
                                            children: [
                                              RatingBar.builder(
                                                itemSize: 14,
                                                initialRating:
                                                    allproductController
                                                        .allproducts!
                                                        .products[index]
                                                        .rating
                                                        .toDouble(),
                                                minRating: 0,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 0.5),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Row(
                                            children: [
                                              Material(
                                                child: Text(
                                                  allproductController
                                                      .allproducts!
                                                      .products[index]
                                                      .price,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 11,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      decorationThickness: 2.85,
                                                      color: Color(0xFFFF0000)),
                                                ),
                                              ),
                                              Spacer(),
                                              Material(
                                                child: Text(
                                                  allproductController
                                                              .allproducts!
                                                              .products[index]
                                                              .special !=
                                                          false
                                                      ? allproductController
                                                          .allproducts!
                                                          .products[index]
                                                          .special
                                                      : allproductController
                                                          .allproducts!
                                                          .products[index]
                                                          .price,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 11,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ));
                              }),
                          // ),
                        ),
                      )
            : searchController.successvalue == "false"
                ? Center(
                    child: Text("No product found"),
                  )
                : searchController.successvalue == "true"
                    ? Obx(
                        () => searchController.isLoading.value == true
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: GridView.builder(
                                      shrinkWrap: true,
                                      physics: ScrollPhysics(),
                                      itemCount: searchController
                                          .search!.searchresult.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 16,
                                              mainAxisExtent: 260),
                                      itemBuilder: (context, index) {
                                        return Container(
                                            width: 10,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.to(() =>
                                                        ProductDetailsScreen(
                                                            productid:
                                                                searchController
                                                                    .search!
                                                                    .searchresult[
                                                                        index]
                                                                    .productId,
                                                            switchLanguage:
                                                                switchLanguage));
                                                  },
                                                  child: Container(
                                                    height: 184,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: Colors.grey),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: Image.network(
                                                        "${searchController.search!.searchresult[index].image.toString()}",
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5, right: 5),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        searchController
                                                            .search!
                                                            .searchresult[index]
                                                            .name,
                                                        maxLines: 2,
                                                        textAlign:
                                                            TextAlign.center,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 11,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5, right: 5),
                                                  child: Row(
                                                    children: [
                                                      Material(
                                                        child: Text(
                                                          searchController
                                                              .search!
                                                              .searchresult[
                                                                  index]
                                                              .price,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 11,
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              decorationThickness:
                                                                  2.85,
                                                              color: Color(
                                                                  0xFFFF0000)),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Material(
                                                        child: Text(
                                                          searchController
                                                              .search!
                                                              .searchresult[
                                                                  index]
                                                              .price,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontSize: 11,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ));
                                      }),
                                ),
                              ),
                      )
                    : Center(
                        child: Text("error"),
                      )));
  }

  final Function(String) switchLanguage;
  final TextEditingController searchControllers = TextEditingController();
}
