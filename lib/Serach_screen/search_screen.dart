import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:wayelle/A_comman_widget/Detail_page/pdt_details.dart';
import 'package:wayelle/A_comman_widget/bottom%20navigationbar.dart';
import 'package:wayelle/controllers/all_products_controller.dart';
import 'package:wayelle/controllers/search_controller.dart';
import 'package:wayelle/skelton_drawer/skelton_favorite.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key, required this.switchLanguage}) : super(key: key);
  final TextEditingController searchControllers = TextEditingController();
  final Function(String) switchLanguage;

  @override
  Widget build(BuildContext context) {
    var searchController = Get.put(SearchControllers());
    var allproductController = Get.put(AllproductController());
    searchController.searchTapped.value = false;
    searchController.successvalue.value = "";
    //print(searchController.search!.success);
    print(searchController.isLoading.value);
    print("screen rebuild");

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF9F9F9),
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Bottomnavigation(
                //       switchLanguage: widget.switchLanguage,
                //     ),
                //   ),
                // );
                Get.offAll(
                    () => Bottomnavigation(switchLanguage: switchLanguage));
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: Text(
            'Search',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                height: 45,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          offset: Offset(0, 3))
                    ],
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    onFieldSubmitted: (value) async {
                      searchControllers.text == value;
                    },
                    controller: searchControllers,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                            onTap: () async {
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
                            child: Icon(Icons.search)),
                        hintText: "Search what you need..",
                        hintStyle: TextStyle(fontSize: 13),
                        border: InputBorder.none),
                  ),
                ),
              ),
              Obx(() => Expanded(
                    child: searchController.successvalue.value == ""
                        ? allproductController.isLoading.value == true
                            ? SkeltonFav()
                            : allproductController.allproducts == null
                                ? SkeltonFav()
                                : SingleChildScrollView(
                                    // physics: ScrollPhysics(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12,
                                          right: 12,
                                          top: 12,
                                          bottom: 5),
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
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.white,
                                                ),
                                                child: Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.to(() => ProductDetailsScreen(
                                                            productid:
                                                                allproductController
                                                                    .allproducts!
                                                                    .products[
                                                                        index]
                                                                    .id,
                                                            switchLanguage:
                                                                switchLanguage));
                                                      },
                                                      child: Container(
                                                        height: 184,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            color: Colors.grey),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
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
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5,
                                                              right: 5),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            allproductController
                                                                .allproducts!
                                                                .products[index]
                                                                .name,
                                                            maxLines: 2,
                                                            textAlign: TextAlign
                                                                .center,
                                                            overflow:
                                                                TextOverflow
                                                                    .fade,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 11,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 3,
                                                              right: 3),
                                                      child: Row(
                                                        children: [
                                                          RatingBar.builder(
                                                            itemSize: 14,
                                                            initialRating:
                                                                allproductController
                                                                    .allproducts!
                                                                    .products[
                                                                        index]
                                                                    .rating
                                                                    .toDouble(),
                                                            minRating: 0,
                                                            direction:
                                                                Axis.horizontal,
                                                            allowHalfRating:
                                                                true,
                                                            itemCount: 5,
                                                            itemPadding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        0.5),
                                                            itemBuilder:
                                                                (context, _) =>
                                                                    Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                            onRatingUpdate:
                                                                (rating) {
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
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5,
                                                              right: 5),
                                                      child: Row(
                                                        children: [
                                                          Material(
                                                            child: Text(
                                                              allproductController
                                                                  .allproducts!
                                                                  .products[
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
                                                              allproductController
                                                                          .allproducts!
                                                                          .products[
                                                                              index]
                                                                          .special !=
                                                                      false
                                                                  ? allproductController
                                                                      .allproducts!
                                                                      .products[
                                                                          index]
                                                                      .special
                                                                  : allproductController
                                                                      .allproducts!
                                                                      .products[
                                                                          index]
                                                                      .price,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 11,
                                                                  color: Colors
                                                                      .black),
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
                            ? Container(
                                height: 500,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text("No product found"),
                                    ),
                                  ],
                                ),
                              )
                            : searchController.successvalue == "true"
                                ? Obx(
                                    () =>
                                        searchController.isLoading.value == true
                                            ? SkeltonFav()
                                            : SingleChildScrollView(
                                                // physics: ScrollPhysics(),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 12,
                                                          right: 12,
                                                          top: 12,
                                                          bottom: 5),
                                                  child: GridView.builder(
                                                      shrinkWrap: true,
                                                      physics: ScrollPhysics(),
                                                      itemCount:
                                                          searchController
                                                              .search!
                                                              .searchresult
                                                              .length,
                                                      gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 2,
                                                              crossAxisSpacing:
                                                                  10,
                                                              mainAxisSpacing:
                                                                  16,
                                                              mainAxisExtent:
                                                                  260),
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Container(
                                                            width: 10,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    Get.to(() => ProductDetailsScreen(
                                                                        productid: searchController
                                                                            .search!
                                                                            .searchresult[
                                                                                index]
                                                                            .productId,
                                                                        switchLanguage:
                                                                            switchLanguage));
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 184,
                                                                    width: double
                                                                        .infinity,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                15),
                                                                        color: Colors
                                                                            .grey),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                      child: Image
                                                                          .network(
                                                                        "${searchController.search!.searchresult[index].image.toString()}",
                                                                        fit: BoxFit
                                                                            .cover,
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
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              5,
                                                                          right:
                                                                              5),
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        searchController
                                                                            .search!
                                                                            .searchresult[index]
                                                                            .name,
                                                                        maxLines:
                                                                            2,
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        overflow:
                                                                            TextOverflow.fade,
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .w600,
                                                                            fontSize:
                                                                                11,
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
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              5,
                                                                          right:
                                                                              5),
                                                                  child: Row(
                                                                    children: [
                                                                      Material(
                                                                        child:
                                                                            Text(
                                                                          searchController
                                                                              .search!
                                                                              .searchresult[index]
                                                                              .price,
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w700,
                                                                              fontSize: 11,
                                                                              decoration: TextDecoration.lineThrough,
                                                                              decorationThickness: 2.85,
                                                                              color: Color(0xFFFF0000)),
                                                                        ),
                                                                      ),
                                                                      Spacer(),
                                                                      Material(
                                                                        child:
                                                                            Text(
                                                                          searchController
                                                                              .search!
                                                                              .searchresult[index]
                                                                              .price,
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w700,
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
                                                ),
                                              ),
                                  )
                                : Center(
                                    child: Text("error"),
                                  ),
                  ))
            ],
          ),
        ));
  }
}
