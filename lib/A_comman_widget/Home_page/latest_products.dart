import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Amodule/bloc/get_Latest_Products_bloc.dart';
import '../../Amodule/model/get_Latest_Products_model.dart';
import '../../Anetwork/response.dart';
import '../../Inner_pages/latestproduct_innerpage.dart';

class Coprodutss extends StatefulWidget {
  const Coprodutss({Key? key, required this.switchLanguage}) : super(key: key);
  final Function(String) switchLanguage;
  @override
  State<Coprodutss> createState() => _CoprodutssState();
}

class _CoprodutssState extends State<Coprodutss> {
  late Latestproduct checkout;
  late LatestproductListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = LatestproductListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: StreamBuilder<Response<Latestproduct>>(
            stream: _bloc.latestListDataStream,
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
                    checkout = snapshot.data!.data;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            children: [
                              Material(
                                child: Text(
                                  'New Arrivals',
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
                                      builder: (context) => Latestinner(
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
                        Container(
                          height: 225,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: checkout.latest?.length,
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
                                                  '${checkout.latest?[index].thumb ?? ''}'),
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
                                                checkout.latest?[index].name ??
                                                    '',
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
                                                  checkout.latest?[index]
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
                                                  checkout.latest?[index]
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
