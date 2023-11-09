import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';

import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:wayelle/A_comman_widget/Detail_page/details_page.dart';
import 'package:wayelle/Amodule/bloc/all_products_bloc.dart';
import 'package:wayelle/Amodule/model/all_products_model.dart';
import 'package:wayelle/Get_all_products/all_products.dart';
import 'package:wayelle/Product_detail_page/pdetail.dart';
import 'package:wayelle/controllers/product_details_controller.dart';

import '../../Amodule/bloc/bestseller.dart';
import '../../Amodule/model/Bestseller.dart';
import '../../Anetwork/response.dart';
import '../../Inner_pages/bestseller_innerpage.dart';
import '../../Inner_pages/latestproduct_innerpage.dart';

class Allproductslidable extends StatefulWidget {
  const Allproductslidable({Key? key, required this.switchLanguage})
      : super(key: key);
  final Function(String) switchLanguage;
  @override
  State<Allproductslidable> createState() => _AllproductslidableState();
}

class _AllproductslidableState extends State<Allproductslidable> {
  late Allproducts allpdts;
  late AllproductListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AllproductListBloc();
  }

  @override
  Widget build(BuildContext context) {
    //var productDetailController = Get.find<ProductController>();

    return SingleChildScrollView(
        child: StreamBuilder<Response<Allproducts>>(
            stream: _bloc.allListDataStream,
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
                    allpdts = snapshot.data!.data;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            children: [
                              Text(
                                'All Products',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.black),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => Getallproducts(
                                      switchLanguage: widget.switchLanguage));
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => Getallproducts(
                                  //       switchLanguage: widget.switchLanguage,
                                  //     ),
                                  //   ),
                                  // );
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
                                itemCount: allpdts.products!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 125,
                                    height: 400,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 2,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(
                                              () => ProductDetailsScreen(
                                                  switchLanguage:
                                                      widget.switchLanguage,
                                                  productid: allpdts
                                                      .products![index].id),
                                            );
                                            // var pdtController = Get.put(
                                            //     ProductDetailsController(allpdts
                                            //         .products![index].id));
                                            // pdtController.fetchProductDetails();

                                            // productDetailController.productId =
                                            //     best.feature![index].productId;

                                            //Get.put(ProductController(id:));
                                          },
                                          child: Container(
                                            height: 155,
                                            width: 125,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image(
                                                image: NetworkImage(
                                                    '${allpdts.products?[index].thumb}'),
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
                                              child: Container(
                                                  //  color: Colors.amber,
                                                  child: Text(
                                                allpdts.products?[index].name ??
                                                    '',
                                                maxLines: 1,
                                                style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              )),
                                            ),
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
                                                  allpdts.products?[index]
                                                          .price ??
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
                                                  allpdts.products![index]
                                                              .special !=
                                                          false
                                                      ? allpdts.products![index]
                                                          .special
                                                          .toString()
                                                      : allpdts.products![index]
                                                          .price
                                                          .toString(),
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
