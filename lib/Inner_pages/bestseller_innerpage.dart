import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/route_manager.dart';
import 'package:wayelle/A_comman_widget/Detail_page/pdt_details.dart';
import 'package:wayelle/A_comman_widget/bottom%20navigationbar.dart';
import 'package:wayelle/skelton_drawer/skelton_favorite.dart';

import '../../Amodule/bloc/bestseller.dart';
import '../../Amodule/model/Bestseller.dart';
import '../../Anetwork/response.dart';
import '../../Inner_pages/latestproduct_innerpage.dart';
import '../Home_screen/org_home.dart';

class Bestsellerinn extends StatefulWidget {
  const Bestsellerinn({Key? key, required this.switchLanguage})
      : super(key: key);
  final Function(String) switchLanguage;
  @override
  State<Bestsellerinn> createState() => _CoprodutssState();
}

class _CoprodutssState extends State<Bestsellerinn> {
  late Bestseller bestinn;
  late BestsellerListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BestsellerListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF9F9F9),
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Bottomnavigation(
                      switchLanguage: widget.switchLanguage,
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: Text(
            'BEST SELLER',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
            child: StreamBuilder<Response<Bestseller>>(
                stream: _bloc.bestsellerListDataStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data!.status) {
                      case Status.LOADING:
                        return Center(
                            child: Container(
                                height: 750,
                                width: double.infinity,
                                child: SkeltonFav()));

                      case Status.SUCCESS:
                        bestinn = snapshot.data!.data;
                        return
                            //  Container(
                            //     color: Colors.white,
                            //     child: Column(
                            //       children: [

                            // Gridview af all products in respective categories

                            Padding(
                          padding: const EdgeInsets.all(16.0),
                          // child: Container(
                          //   height: MediaQuery.of(context).size.height,
                          //   width: double.infinity,
                          //   color: Colors.amber,
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: bestinn.feature?.length,
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
                                          onTap: () {
                                            Get.to(() => ProductDetailsScreen(
                                                productid: bestinn
                                                    .feature![index].productId,
                                                switchLanguage:
                                                    widget.switchLanguage));
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
                                                "${bestinn.feature?[index].thumb ?? ''}",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Row(
                                            children: [
                                              RatingBar.builder(
                                                itemSize: 14,
                                                initialRating: bestinn
                                                    .feature![index].rating!
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
                                              )
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
                                              GestureDetector(
                                                onTap: () {
                                                  // Navigator.push(
                                                  //   context,
                                                  //   MaterialPageRoute(
                                                  //       builder: (context) =>
                                                  //           Pdetails(switchLanguage: widget.switchLanguage,
                                                  //             vele:
                                                  //             allproducts!.subcategoryproducts?[index],
                                                  //             id: allproducts!
                                                  //                 .subcategoryproducts![index].id
                                                  //                 .toString(),
                                                  //           )),
                                                  // );
                                                },
                                                child: Text(
                                                  bestinn.feature?[index]
                                                          .name ??
                                                      '',
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
                                                  bestinn.feature?[index]
                                                          .price ??
                                                      '',
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
                                                  bestinn.feature![index]
                                                              .special !=
                                                          false
                                                      ? bestinn.feature![index]
                                                          .special
                                                      : bestinn.feature![index]
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
                          //),
                          //),
                        );
                      // ],
                      //)
                      //);

                      case Status.ERROR:
                        return Container(
                          child: Center(
                            child: Text(
                              "ERROR",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/logo/error-logo.png"),
                            fit: BoxFit.fill,
                          )),
                        );
                      case Status.COMPLETED:
                        break;
                    }
                  }
                  return Container(
                    color: Colors.black45,
                  );
                })));
  }
}
