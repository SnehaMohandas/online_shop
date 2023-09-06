import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
//import 'package:get/get.dart';
import 'package:wayelle/A_comman_widget/Detail_page/details_page.dart';
import 'package:wayelle/controllers/product_details_controller.dart';

import '../../Amodule/bloc/spring_summer.dart';
import '../../Amodule/model/spring_summer.dart';
import '../../Anetwork/response.dart';
import 'package:get/get_core/get_core.dart';

class Pdsliding extends StatefulWidget {
  Pdsliding({Key? key, required this.switchLanguage}) : super(key: key);
  final Function(String) switchLanguage;
  @override
  State<Pdsliding> createState() => _SpringsummerState();
}

class _SpringsummerState extends State<Pdsliding> {
  late Springsummer spring;
  late SpringsummerListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = SpringsummerListBloc();
  }

  @override

  //SpringproductListRepository
  //Springsummer
  //springsummer
  //SpringsummerListBloc
  //springsummerListDataStream

  Widget build(BuildContext context) {
    //var pdtController = Get.find<ProductController>();
    return SingleChildScrollView(
        child: StreamBuilder<Response<Springsummer>>(
            stream: _bloc.springsummerListDataStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data!.status) {
                  case Status.LOADING:
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.green[400],
                      ),
                    );
                  case Status.SUCCESS:
                    spring = snapshot.data!.data;
                    return Column(
                      children: [
                        // horizontal scrolling
                        Container(
                          height: 225,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: spring.feature?.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
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
                                            print("pressed");

                                            Get.offAll(
                                              () => ProductDetailsScreen(
                                                  productid: spring
                                                      .feature![index]
                                                      .productId,
                                                  switchLanguage:
                                                      widget.switchLanguage),
                                            );
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
                                                    '${spring.feature?[index].thumb ?? ''}'),
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
                                              width: 2,
                                            ),
                                            Material(
                                                child: Text(
                                              spring.feature?[index].name ?? '',
                                              style: TextStyle(
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ))
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
                                                  spring.feature?[index]
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
                                                  spring.feature?[index]
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
