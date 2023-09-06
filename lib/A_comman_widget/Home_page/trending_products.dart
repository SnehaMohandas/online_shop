import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wayelle/A_comman_widget/Detail_page/details_page.dart';

import '../../Amodule/bloc/bestseller.dart';
import '../../Amodule/bloc/trending_bloc.dart';
import '../../Amodule/model/Bestseller.dart';
import '../../Amodule/model/trending_model.dart';
import '../../Anetwork/response.dart';
import '../../Inner_pages/bestseller_innerpage.dart';
import '../../Inner_pages/latestproduct_innerpage.dart';
import '../../Inner_pages/trending_products.dart';
import '../../Product_detail_page/pdetail.dart';

class Trendingpdts extends StatefulWidget {
  const Trendingpdts({Key? key, required this.switchLanguage})
      : super(key: key);
  final Function(String) switchLanguage;
  @override
  State<Trendingpdts> createState() => _CoprodutssState();
}

class _CoprodutssState extends State<Trendingpdts> {
  late Trending trend;
  late TrendingListBloc _bloc;

  //TrendingListRepository
  //Trending
  // trending
  // TrendingListBloc
  //trendingListDataStream

  @override
  void initState() {
    super.initState();
    _bloc = TrendingListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: StreamBuilder<Response<Trending>>(
            stream: _bloc.trendingListDataStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data!.status) {
                  case Status.LOADING:
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  case Status.SUCCESS:
                    trend = snapshot.data!.data;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            children: [
                              Material(
                                child: Text(
                                  'Trending',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Trendinginn(
                                        switchLanguage: widget.switchLanguage,
                                      ),
                                    ),
                                  );
                                },
                                child: Material(
                                  child: Text(
                                    'View All',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // horizontal scrolling

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 225,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: trend.feature?.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => ProductDetaiiil(
                                      //         switchLanguage:
                                      //             widget.switchLanguage,
                                      //         id: trend
                                      //             .feature![index].productId),
                                      //   ),
                                      // );
                                      Get.to(() => ProductDetailsScreen(
                                            switchLanguage:
                                                widget.switchLanguage,
                                            productid:
                                                trend.feature![index].productId,
                                          ));
                                      print(trend);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: 125,
                                      height: 400,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Container(
                                            height: 155,
                                            width: 121,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image(
                                                image: NetworkImage(
                                                    '${trend.feature?[index].thumb ?? ''}'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.007,
                                              ),
                                              Expanded(
                                                child: Material(
                                                    child: Text(
                                                  trend.feature?[index].name ??
                                                      '',
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                )),
                                              )
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
                                                    trend.feature?[index]
                                                            .price ??
                                                        '',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 10,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        decorationThickness:
                                                            2.85,
                                                        color:
                                                            Color(0xFFFF0000)),
                                                  ),
                                                ),
                                                Spacer(),
                                                Material(
                                                  child: Text(
                                                    trend.feature?[index]
                                                            .price ??
                                                        '',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
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
                        ),
                      ],
                    );
                  case Status.ERROR:
                    return Container(
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
            }));
  }
}
