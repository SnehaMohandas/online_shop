import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Amodule/bloc/bestseller.dart';
import '../../Amodule/model/Bestseller.dart';
import '../../Anetwork/response.dart';
import '../../Inner_pages/latestproduct_innerpage.dart';
import '../Amodule/bloc/heading_home_bloc.dart';
import '../Amodule/model/heading_home_model.dart';
import '../Get_all_products/all_products.dart';
import '../Home_screen/org_home.dart';

class Headinghome extends StatefulWidget {
  const Headinghome({Key? key, required this.switchLanguage}) : super(key: key);
  final Function(String) switchLanguage;
  @override
  State<Headinghome> createState() => _CoprodutssState();
}

class _CoprodutssState extends State<Headinghome> {
  late Headings head;
  late HeadingsListBloc _bloc;

  //HeadingListRepository
//headings
//Headings
//HeadingsListBloc
//headingsListDataStream

  @override
  void initState() {
    super.initState();
    _bloc = HeadingsListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          // title: Padding(
          //   padding: EdgeInsets.only(left: 16),
          //   // child: Container(
          //   //   height: 25,
          //   //   width: 100,
          //   //   //child: Image(image: NetworkImage('https://globosoft.org//2023/06/wayelle-logo.png'),fit: BoxFit.fill,)),
          //   //   child: Text("wayelle"),
          //   // )
          // ),
          title: Text("data"),
          actions: [
            Icon(
              Icons.search,
              color: Colors.black,
            ),
            SizedBox(
              width: 16,
            ),
            //IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
          ],
        ),
        body: SingleChildScrollView(
            child: StreamBuilder<Response<Headings>>(
                stream: _bloc.headingsListDataStream,
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
                        head = snapshot.data!.data;
                        return Column(
                          children: [
                            // Stack(
                            //   alignment: Alignment.bottomLeft,
                            //   children: [
                            //     Padding(
                            //       padding: const EdgeInsets.only(left: 14,right: 14,bottom: 14),
                            //       child: Container(
                            //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            //           width:double.infinity,
                            //           height: 180,
                            //           child:ClipRRect(
                            //             borderRadius: BorderRadius.circular(10),
                            //             child:  Image(image: NetworkImage('https://globosoft.org/2023/06/app/Image-01.png'),fit: BoxFit.fill,),
                            //           )
                            //       ),
                            //     ),
                            //     Padding(
                            //       padding: const EdgeInsets.only(left: 50,bottom: 50
                            //       ),
                            //       child: GestureDetector(
                            //         onTap: (){
                            //           Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //               builder: (context) => Getallproducts(),
                            //             ),
                            //           );
                            //         },
                            //         child: Container(
                            //           height: 30.21,
                            //           width: 101.54,
                            //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black),
                            //           child: Center(child: Text('Shop Now',style: TextStyle(color: Colors.white),)),
                            //         ),
                            //       ),
                            //     )
                            //   ],
                            // ),
                          ],
                        );

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
                          // decoration: const BoxDecoration(
                          //     image: DecorationImage(
                          //   image: NetworkImage(
                          //       "https://img.freepik.com/free-vector/error-404-concept-landing-page_52683-21190.jpg?w=740&t=st=1686729545~exp=1686730145~hmac=f13f33b57d8f938d3616d3666c69549cb3914f8267e3679358bae4c5b2305455"),
                          //   fit: BoxFit.fill,
                          // )),
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
