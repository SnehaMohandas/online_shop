import 'package:card_loading/card_loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:readmore/readmore.dart';
//import 'package:read_more_text/read_more_text.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wayelle/A_comman_widget/Add_to_wishlist/add_to_wishlist.dart';
import 'package:wayelle/A_comman_widget/Detail_page/similar_pdts.dart';
import 'package:wayelle/A_comman_widget/bottom%20navigationbar.dart';
import 'package:wayelle/Amodule/model/additional_pdt_details_model.dart';
import 'package:wayelle/Anetwork/api.dart';
import 'package:wayelle/Cart_screen/cart_screen.dart';
import 'package:wayelle/Home_screen/org_home.dart';
import 'package:wayelle/Rating_and_reviews/review_screen.dart';
import 'package:wayelle/controllers/additional_pdt_detail_controller.dart';
import 'package:wayelle/controllers/cart_controller.dart';
import 'package:wayelle/controllers/favorite_controller.dart';
import 'package:wayelle/controllers/product_details_controller.dart';
import 'package:wayelle/skelton_drawer/skelton_details.dart';

class AdditionalDetails {
  final List add_imgs;

  AdditionalDetails({required this.add_imgs});
  factory AdditionalDetails.fromJson(Map<String, dynamic> json) {
    return AdditionalDetails(add_imgs: json["add_imgs"]);
  }
}

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen(
      {Key? key, required this.productid, required this.switchLanguage})
      : super(key: key);
  final Function(String) switchLanguage;

  final productid;

  //List sizes = ["S", "M", "L", "XL"];
  List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://wallpaperaccess.com/full/2637581.jpg"
  ];

  List pdtImages = [];

  var selectIndex;

  // var product_option_id;
  var _pageController = PageController(viewportFraction: 1, initialPage: 0);

  // int activePage = 0;
  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  //List productImages = [];
  @override
  Widget build(BuildContext context) {
    var pdtController = Get.put(ProductDetailsController(productid));
    var cartController = Get.find<CartController>();
    var favController = Get.put(FavoriteController());
    // var pdtController = Get.find<ProductDetailsController>();

    // pdtController.fetchProductDetails();
    favController.fetchWishList();
    // print(pdtController.favorites);
    //  print(favController.favorites);

    return WillPopScope(
      onWillPop: () async {
        Get.delete<ProductDetailsController>();
        Get.delete<FavoriteController>();
        // Get.offAll(() => Bottomnavigation(switchLanguage: switchLanguage));
        // Get.offAll(
        //     () => Bottomnavigation(switchLanguage: widget.switchLanguage));
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFF9F9F9),
            elevation: 0,
            centerTitle: true,
            leading: GestureDetector(
                onTap: () {
                  Get.delete<ProductDetailsController>();

                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            // title: Text('SHORT DRESS',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),),
            actions: [
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.share,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 8,
              )
            ],
          ),
          body: Obx(
            () => pdtController.isLoading.value == true
                ? Skelton_drawer()
                : pdtController.PdtImgs == []
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        child: Column(
                        mainAxisSize: MainAxisSize.min,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                //======================
                                Container(
                                  height: 390,
                                  width: double.infinity,
                                  child: PageView.builder(
                                      padEnds: true,
                                      itemCount: pdtController.PdtImgs.length,
                                      controller: _pageController,
                                      onPageChanged: (page) {
                                        // setState(() {
                                        //   activePage = page;
                                        // });
                                        pdtController.activePage.value = page;
                                      },
                                      //pageSnapping: true,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            height: 390,
                                            width: double.infinity,
                                            // color: Colors.grey,
                                            margin: EdgeInsets.all(10),
                                            child: Image(
                                              image: NetworkImage(
                                                  pdtController.PdtImgs[index]),
                                              fit: BoxFit.cover,
                                            ));
                                      }),
                                ),
                                //======================
                                Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: FavoriteToggleIcon(
                                    productId: productid,
                                  ),
                                )
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          //==============
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: indicators(pdtController.PdtImgs.length,
                                pdtController.activePage.value),
                          ),
                          //==========================================

                          SizedBox(
                            height: 10,
                          ),

                          Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // SizedBox(
                                //   width: 16,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 14),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        pdtController
                                            .productDetails!.product.name,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      RatingBar.builder(
                                        itemSize: 14,
                                        initialRating: pdtController
                                            .productDetails!.product.rating
                                            .toDouble(),
                                        minRating: 0,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 1.5),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 3, top: 2),
                                        child: Text(
                                          pdtController.totalAmount == null
                                              ? pdtController
                                                  .productDetails!.product.price
                                              : "\$${pdtController.totalAmount.toString()}",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                    ],
                                  ),
                                ),
                                // Column(
                                //   // mainAxisAlignment: MainAxisAlignment.start,
                                //   // crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Padding(
                                //       padding: const EdgeInsets.only(right: 14),
                                //       child: Text("data"),
                                //     ),
                                //   ],
                                // ),

                                Padding(
                                  padding: const EdgeInsets.only(right: 14),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          pdtController.quantityRemove();
                                        },
                                        child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.08,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 0.8,
                                                  color: Colors.black38),
                                            ),
                                            child: Icon(
                                              Icons.remove,
                                              color: pdtController.quantity == 1
                                                  ? Colors.black12
                                                  : Colors.black,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(pdtController.quantity.toString()),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          pdtController.quantityAdd();
                                        },
                                        child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.08,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 0.8,
                                                    color: Colors.black38)),
                                            child: Icon(Icons.add)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // pdtController.sizes == []
                          //     ? Text("null")
                          //     :
                          // Obx(
                          //   () =>
                          //  ---------------------------------------------------
                          Row(
                            children: List.generate(
                                pdtController.isSuccess.value
                                    ? pdtController
                                        .productOptions!
                                        .productsOption[0]
                                        .productOptionValue
                                        .length
                                    : 0, (index) {
                              //print(selectIndex);

                              // pdtController.selectedSize.value ==
                              //     pdtController.sizes[0];
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, bottom: 10),
                                child: GestureDetector(
                                  onTap: () async {
                                    selectIndex = pdtController
                                        .productOptions!
                                        .productsOption[0]
                                        .productOptionValue[index]
                                        .name;
                                    print(selectIndex);
                                    pdtController.product_option_id =
                                        pdtController.productOptions!
                                            .productsOption[0].productOptionId;

                                    pdtController.product_option_value_id =
                                        pdtController
                                            .productOptions!
                                            .productsOption[0]
                                            .productOptionValue[index]
                                            .productOptionValueId;
                                    print(pdtController.product_option_id);
                                    print(
                                        pdtController.product_option_value_id);

                                    // await pdtController.sizeChange(selectIndex);
                                    // print(pdtController.selectedSize);
                                    pdtController
                                        .sizeChange(pdtController.sizes[index]);
                                    //......................................................
                                    // print(pdtController.selectedSize);
                                    // pdtController.selectedSize =
                                    //     pdtController.sizes[index];
                                    // if (pdtController.selectedSize ==
                                    //     pdtController.sizes[index]) {
                                    //   print(pdtController.selectedSize);
                                    //   print(pdtController.sizes[index]);
                                    // }
                                  },
                                  child:
                                      //  Obx(
                                      //   () =>
                                      //       GetBuilder<
                                      //           ProductDetailsController>(
                                      // builder: (controller) {
                                      //   return
                                      //   Obx(
                                      // () =>
                                      Container(
                                    height: 50,
                                    width: 50,
                                    color: pdtController.selectedSize ==
                                            pdtController.sizes[index]
                                        ? Colors.black
                                        : Colors.grey[100],
                                    child: Center(
                                        child: Text(
                                      pdtController
                                          .productOptions!
                                          .productsOption[0]
                                          .productOptionValue[index]
                                          .name
                                          .characters
                                          .first,
                                      style: TextStyle(
                                          color: pdtController.selectedSize ==
                                                  pdtController.sizes[index]
                                              ? Colors.white
                                              : Colors.black),
                                    )),
                                    // ),
                                  ),
                                  // )
                                  //   },
                                  // )
                                  //   },
                                  // ),
                                ),
                              );
                            }
                                //(pdtController!.selectedSize=pdtController.sizes[0]);
                                ),
                          ),
                          //-----------------------------------------------------------
                          // ),

                          // Row(
                          //     children:pdtController.productOptions==null?te:
                          //      List.generate(
                          //         pdtController.productOptions!.productsOption[0]
                          //             .productOptionValue.length, (index) {
                          //   return Container(
                          //     height: 50,
                          //     width: 50,
                          //     color: Colors.amber,
                          //   );
                          // })),

                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child:
                                // Text(pdtController
                                //     .productDetails!.product.description),
                                ReadMoreText(
                                    pdtController
                                        .productDetails!.product.description,
                                    trimLines: 5,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: '...Read more',
                                    trimExpandedText: ' read less',
                                    style: TextStyle(
                                      //  fontSize: ScreenUtil().setSp(12),
                                      color: Colors.black,
                                    )),
                          ),
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height * 0.02,
                          // ),

                          /// Add to cart button

                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 10),
                            child: GestureDetector(
                              onTap: () async {
                                // if (pdtController.productOptions!
                                //         .productsOption[0].productOptionValue
                                //         .contains("name") ==
                                //     pdtController.selectedSize) {
                                //   print("true");
                                // }

                                if (pdtController.isSuccess.value == false) {
                                  return null;
                                } else {
                                  await cartController.addToCart(
                                      // customer_id,
                                      productid,
                                      pdtController.quantity.toString(),
                                      pdtController.product_option_id,
                                      pdtController.product_option_value_id);
                                  cartController.fetchCart();

                                  // setState(() {});
                                  // Get.offAll(Bottomnavigation(
                                  //   switchLanguage: widget.switchLanguage,
                                  //   currentIndex: 2,
                                  // ));
                                  // Get.delete<ProductDetailsController>();

                                  Get.to(() => CartScreen(
                                        switchLanguage: switchLanguage,
                                      ));
                                }
                              },
                              child: Container(
                                height: 55,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black),
                                child: Center(
                                    child: Text(
                                  'ADD TO CART',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                )),
                              ),
                            ),
                          ),

                          /// you may also like this

                          SizedBox(
                            height: 22,
                          ),

                          SimilarProducts(
                            productid: productid,
                            switchLanguage: switchLanguage,
                          ),

                          SizedBox(
                            height: 15,
                          ),
                        ],
                      )),
          )),
    );
  }
}
