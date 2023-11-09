import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';

import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:wayelle/A_comman_widget/Detail_page/details_page.dart';
import 'package:wayelle/Product_detail_page/pdetail.dart';
import 'package:wayelle/controllers/product_details_controller.dart';

import '../../Amodule/bloc/bestseller.dart';
import '../../Amodule/model/Bestseller.dart';
import '../../Anetwork/response.dart';
import '../../Inner_pages/bestseller_innerpage.dart';
import '../../Inner_pages/latestproduct_innerpage.dart';

class Bestselleer extends StatefulWidget {
  const Bestselleer({Key? key, required this.switchLanguage}) : super(key: key);
  final Function(String) switchLanguage;
  @override
  State<Bestselleer> createState() => _CoprodutssState();
}

class _CoprodutssState extends State<Bestselleer> {
  late Bestseller best;
  late BestsellerListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BestsellerListBloc();
  }

  @override
  Widget build(BuildContext context) {
    //var productDetailController = Get.find<ProductController>();
    return SingleChildScrollView(
        child: StreamBuilder<Response<Bestseller>>(
            stream: _bloc.bestsellerListDataStream,
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
                    best = snapshot.data!.data;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            children: [
                              Text(
                                'Best Seller',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Bestsellerinn(
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
                                itemCount: best.feature?.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 10),
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
                                            Get.to(() => ProductDetailsScreen(
                                                  switchLanguage:
                                                      widget.switchLanguage,
                                                  productid: best
                                                      .feature![index]
                                                      .productId,
                                                ));
                                            print(
                                                best.feature![index].productId);
                                            // productDetailController.productId =
                                            //     best.feature![index].productId;

                                            //Get.put(ProductController(id:));
                                          },
                                          child: Container(
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
                                                    '${best.feature?[index].thumb}'),
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.007,
                                            ),
                                            Expanded(
                                              child: Material(
                                                  child: Text(
                                                best.feature?[index].name ?? '',
                                                maxLines: 1,
                                                style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w600,
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
                                                  best.feature?[index].price ??
                                                      '',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 10,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      decorationThickness: 2.85,
                                                      color: Color(0xFFFF0000)),
                                                ),
                                              ),
                                              Spacer(),
                                              Material(
                                                child: Text(
                                                  best.feature?[index].price ??
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
