import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/route_manager.dart';
import 'package:wayelle/A_comman_widget/Detail_page/details_page.dart';
import 'package:wayelle/A_comman_widget/bottom%20navigationbar.dart';

import '../Amodule/bloc/trending_bloc.dart';
import '../Amodule/model/trending_model.dart';
import '../Anetwork/response.dart';
import '../Home_screen/org_home.dart';
import '../skelton_drawer/skelton_favorite.dart';

class Trendinginn extends StatefulWidget {
  const Trendinginn({Key? key, required this.switchLanguage}) : super(key: key);
  final Function(String) switchLanguage;
  @override
  State<Trendinginn> createState() => _CoprodutssState();
}

class _CoprodutssState extends State<Trendinginn> {
  late Trending trend;
  late TrendingListBloc _bloc;

  //TrendingListRepository
//Trending
//trending
//TrendingListBloc
//trendingListDataStream

  @override
  void initState() {
    super.initState();
    _bloc = TrendingListBloc();
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
            'TRENDING',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.black,
            ),
            SizedBox(
              width: 8,
            )
          ],
        ),
        body: SingleChildScrollView(
            child: StreamBuilder<Response<Trending>>(
                stream: _bloc.trendingListDataStream,
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
                        trend = snapshot.data!.data;
                        return
                            // Container(

                            //     color: Colors.white,
                            //     child: Column(
                            //       children: [
                            // Gridview af all products in respective categories

                            Padding(
                          padding: const EdgeInsets.all(16.0),
                          // child: Container(
                          //   height: MediaQuery.of(context).size.height,
                          //   width: double.infinity,
                          //   color: Colors.white,
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: trend.feature?.length,
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
                                        // Padding(
                                        //   padding:
                                        //   const EdgeInsets.only(top: 3,bottom: 3),
                                        //   child:
                                        //   // Row(
                                        //   //   children: [
                                        //   //     Spacer(),
                                        //   //     AddToCartBuon( product_id: allproducts!
                                        //   //         .subcategoryproducts![index].id !,),
                                        //   //   ],
                                        //   // ),
                                        // ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() => ProductDetailsScreen(
                                                productid: trend
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
                                                "${trend.feature?[index].thumb ?? ''}",
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
                                                initialRating: trend
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
                                                  trend.feature?[index].name ??
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
                                                  trend.feature?[index].price ??
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
                                                  trend.feature![index]
                                                              .special !=
                                                          false
                                                      ? trend.feature![index]
                                                          .special
                                                      : trend.feature![index]
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
                          // ),
                        );
                      // ],
                      // ));

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
