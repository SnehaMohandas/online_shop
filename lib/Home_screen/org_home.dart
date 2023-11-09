import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayelle/A_comman_widget/Home_page/all_products.dart';
import 'package:wayelle/Amodule/model/all_products_model.dart';
import 'package:wayelle/Anetwork/api.dart';
import 'package:wayelle/Cart_screen/cart_screen.dart';
import 'package:wayelle/Checkout_screen/stripe_payment_screen.dart';
import 'package:wayelle/Serach_screen/search_screen.dart';
import 'package:wayelle/controllers/cart_controller.dart';
import 'package:wayelle/controllers/home_controller.dart';
import 'package:wayelle/controllers/search_controller.dart';
import 'package:wayelle/skelton_drawer/skelton_home.dart';

import '../A_comman_widget/Home_page/Best_seller.dart';
import '../A_comman_widget/Home_page/latest_products.dart';
import '../A_comman_widget/Home_page/spring_summer.dart';
import '../A_comman_widget/Home_page/trending_products.dart';
import '../A_comman_widget/drawer.dart';
import '../Get_all_products/all_products.dart';

class Orghome extends StatelessWidget {
  const Orghome({Key? key, required this.switchLanguage}) : super(key: key);
  final Function(String) switchLanguage;
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    var searchController = Get.put(SearchController());
    var cartController = Get.find<CartController>();
    print("lengthcart${cartController.cart}");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
            height: 25,
            width: 100,
            child: Image(
              image: AssetImage('assets/logo/wayelle-logo.png'),
              fit: BoxFit.fill,
            )),
        // title: Text(
        //   "Wayelle",
        //   style: TextStyle(color: Colors.black),
        // ),
        actions: [
          // GestureDetector(
          //   onTap: () async {
          //     Get.to(() => StripepaymentScreen());
          //     //searchController.searchTapped.value = await true;
          //   },
          //   child: Icon(
          //     Icons.search,
          //     color: Colors.black,
          //   ),
          // ),
          // SizedBox(
          //   width: 8,
          // ),
          Obx(() => cartController.isLoading.value == true
              ? Visibility(
                  visible: false,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : cartController.value != false && cartController.cart != null
                  ? Stack(
                      children: [
                        IconButton(
                            onPressed: () async {
                              Get.to(() =>
                                  CartScreen(switchLanguage: switchLanguage));
                              await cartController.fetchCart();
                            },
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              color: Color.fromARGB(255, 23, 80, 25),
                              size: 27,
                            )),
                        // Positioned(
                        //   right: 0,
                        //   bottom: 10,
                        //   left: 10,
                        //   child: Container(
                        //     height: 20,
                        //     width: 20,
                        //     decoration: BoxDecoration(
                        //         color: Colors.amber, shape: BoxShape.circle),
                        //   ),
                        // )
                        new Positioned(
                            bottom: 7,
                            child: new Stack(children: <Widget>[
                              new Icon(Icons.brightness_1,
                                  size: 22.0, color: Colors.red[800]),
                              new Positioned(
                                  top: 4.0,
                                  right: 7.0,
                                  child: new Center(
                                    child: new Text(
                                      cartController.cart!.cartproduct.length
                                          .toString(),
                                      //  list.length.toString(),
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ))
                            ]))
                      ],
                    )
                  : IconButton(
                      onPressed: () async {
                        Get.to(
                            () => CartScreen(switchLanguage: switchLanguage));
                        await cartController.fetchCart();
                      },
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 27,
                        color: Color.fromARGB(255, 23, 80, 25),
                      ))),
          SizedBox(
            width: 12,
          )
        ],
      ),
      body: Obx(
        () => controller.isLoading.value == true
            ? SkeltonHome()
            : controller.banner == null ||
                    controller.bannerImgs == [] ||
                    controller.bannerTitle == []
                ? SkeltonHome()
                : SingleChildScrollView(
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    left: 9, right: 9, bottom: 20, top: 9),
                                height: 200,
                                width: double.infinity,
                                //color: Colors.amber,
                                child:
                                    //  PageView.builder(
                                    //   itemCount: controller.banner!.banners.length,
                                    //   itemBuilder: (BuildContext context, int index) {
                                    //     return Container(
                                    //         decoration: BoxDecoration(
                                    //             image: DecorationImage(
                                    //                 image: NetworkImage(
                                    //                     "$ImageUrl${controller.banner!.banners[index].image}"),
                                    //                 fit: BoxFit.cover)),
                                    //         child: Center(
                                    //             child: Text(
                                    //           controller.banner!.banners[index].title
                                    //               .toUpperCase(),
                                    //           textAlign: TextAlign.center,
                                    //           style: TextStyle(
                                    //               color: Colors.white,
                                    //               fontSize: 20,
                                    //               fontWeight: FontWeight.bold),
                                    //         )));
                                    //   },
                                    // ),
                                    CarouselSlider(
                                  options: CarouselOptions(
                                      aspectRatio: 18 / 5,
                                      viewportFraction: 1.0,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.32,
                                      autoPlay: true),
                                  items: controller.bannerImgs.map((e) {
                                    int index = controller.bannerImgs.indexOf(
                                        e); // Get the index of the current item
                                    return Builder(
                                        builder: (BuildContext context) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.32,
                                        width: double.infinity,
                                        child: Center(
                                            child: Text(
                                          controller.bannerTitle[index],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "${ImageUrl}${e}"
                                                        .toString()),
                                                fit: BoxFit.cover)),
                                      );
                                    });
                                  }).toList(),
                                )),
                            // Positioned(
                            //     top: 100,
                            //     bottom: 100,
                            //     right: 100,
                            //     left: 100,
                            //     child: Text("data"))
                          ],
                        ),
                        //=============================================================================
                        // Stack(
                        //   alignment: Alignment.bottomLeft,
                        //   children: [
                        //     Padding(
                        //       padding:
                        //           const EdgeInsets.only(left: 12, right: 12, bottom: 14),
                        //       child: Container(
                        //           decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(10)),
                        //           width: double.infinity,
                        //           height: 180,
                        //           child: ClipRRect(
                        //             borderRadius: BorderRadius.circular(10),
                        //             child: Image(
                        //               image: NetworkImage(
                        //                   'https://globosoft.org/2023/06/app/Image-01.png'),
                        //               fit: BoxFit.fill,
                        //               loadingBuilder: (BuildContext context, Widget child,
                        //                   ImageChunkEvent? loadingProgress) {
                        //                 if (loadingProgress == null) {
                        //                   return child;
                        //                 }
                        //                 return Center(
                        //                   child: CircularProgressIndicator(
                        //                     color: Colors.black,
                        //                     value: loadingProgress.expectedTotalBytes !=
                        //                             null
                        //                         ? loadingProgress.cumulativeBytesLoaded /
                        //                             loadingProgress.expectedTotalBytes!
                        //                         : null,
                        //                   ),
                        //                 );
                        //               },
                        //               errorBuilder: (BuildContext context, Object exception,
                        //                   StackTrace? stackTrace) {
                        //                 return Icon(Icons
                        //                     .error); // Display an error icon if loading fails
                        //               },
                        //             ),
                        //           )),
                        //     ),
                        //     Padding(
                        //       padding: const EdgeInsets.only(left: 50, bottom: 50),
                        //       child: GestureDetector(
                        //         onTap: () {
                        //           Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //               builder: (context) => Getallproducts(
                        //                 switchLanguage: switchLanguage,
                        //               ),
                        //             ),
                        //           );
                        //         },
                        //         child: Container(
                        //           height: 30.21,
                        //           width: 101.54,
                        //           decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(10),
                        //               color: Colors.black),
                        //           child: Center(
                        //               child: Text(
                        //             'Shop Now',
                        //             style: TextStyle(color: Colors.white),
                        //           )),
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        //----------------------------------------------------------------
                        //  Flexible(child: SliderBanner()),

                        ///
                        // Coprodutss(
                        //   switchLanguage: switchLanguage,
                        // ),
                        Allproductslidable(switchLanguage: switchLanguage),
                        Bestselleer(
                          switchLanguage: switchLanguage,
                        ),
                        Springsummerr(
                          switchLanguage: switchLanguage,
                        ),
                        Trendingpdts(
                          switchLanguage: switchLanguage,
                        )
                      ],
                    ),
                  ),
      ),
    );
  }
}

class SliderBanner extends StatelessWidget {
  final List<String> images = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    // Add more image paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Banner Example'),
      ),
      body: Container(
          height: 100,
          width: double.infinity, // Adjust the height as needed
          // child: PageView.builder(
          //   allowImplicitScrolling: false,
          //   padEnds: true,
          //   itemCount: images.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return Container(
          //       height: 10,
          //       width: double.infinity,
          //       child: Image.asset(
          //         "$ImageUrl${controller.banner!.banners[index].image}",
          //         fit: BoxFit.cover,
          //       ),
          //     );
          //   },
          // ),
          child: CarouselSlider(
            options: CarouselOptions(
                aspectRatio: 18 / 5,
                viewportFraction: 1.0,
                height: MediaQuery.of(context).size.height * 0.32,
                autoPlay: true),
            items: controller.bannerImgs.map((e) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.32,
                  width: double.infinity,
                  // color: Colors.amber,
                  // child: Center(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //             image: AssetImage(
                  //                 "assets/images/home1.png"),
                  //             fit: BoxFit.cover),
                  //         // color: Colors.red,
                  //         borderRadius:
                  //             BorderRadius.circular(50)),
                  //     height: MediaQuery.of(context).size.height *
                  //         0.24,
                  //   ),
                  // ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(e.toString()),
                          fit: BoxFit.cover)),
                  //child: Image.asset(e.toString())
                );
              });
            }).toList(),
          )),
    );
  }
}
