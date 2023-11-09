import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:wayelle/A_comman_widget/bottom%20navigationbar.dart';
import 'package:wayelle/controllers/favorite_controller.dart';
import 'package:wayelle/skelton_drawer/skelton_favorite.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var favController = Get.find<FavoriteController>();
    //  print(favController.favorites!.wishlist.length);
    var favController = Get.put(FavoriteController());
    print(favController.isLoading.value);
    // print("successss${favController.favorites!.wishlist.toString()}");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Favorites',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        body: Obx(
          () => favController.isLoading.value == true
              ? SkeltonFav()
              : favController.favorites == null
                  ? Center(
                      child: Text("No favorites found"),
                    )
                  : favController.emptyWishlist == true
                      ? Center(
                          child: Text("No favorites found"),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount:
                                  favController.favorites!.wishlist.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 16,
                                      mainAxisExtent: 260),
                              itemBuilder: (context, index) {
                                print(favController.isLoading.value);
                                return Container(
                                    width: 10,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Stack(children: [
                                          Container(
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
                                                favController.favorites!
                                                    .wishlist[index].thumb,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 10,
                                            right: 10,
                                            child: GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        content: Text(
                                                          'Are you sure to want to remove?',
                                                          style: TextStyle(
                                                              fontSize: 15),
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            child: Text(
                                                              'No',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(); // Close the dialog
                                                            },
                                                          ),
                                                          ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .black),
                                                            child: Text(
                                                              'Yes',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              await favController
                                                                  .removeWishlist(favController
                                                                      .favorites!
                                                                      .wishlist[
                                                                          index]
                                                                      .productId);
                                                              // favController
                                                              //     .fetchWishList();
                                                              // Do something here when OK is pressed
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              },
                                              child: Container(
                                                child: Icon(
                                                  Icons.favorite,
                                                  color: Colors.pink,
                                                  size: 15,
                                                ),
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ]),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 3, right: 3),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {},
                                                child: Text(
                                                  favController.favorites!
                                                      .wishlist[index].name,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  overflow: TextOverflow.fade,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 11,
                                                      color: Colors.black),
                                                ),
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
                                                  favController.favorites!
                                                      .wishlist[index].price,
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
                                                  favController
                                                              .favorites!
                                                              .wishlist[index]
                                                              .special ==
                                                          false
                                                      ? favController.favorites!
                                                          .wishlist[index].price
                                                      : favController
                                                          .favorites!
                                                          .wishlist[index]
                                                          .special,
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
                        ),
          // ),
          //),
          // ),
          //)
          //],
          //),
        ));
  }
}
