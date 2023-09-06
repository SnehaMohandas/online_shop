


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../../Amodule/bloc/bestseller.dart';
// import '../../Amodule/bloc/trending_bloc.dart';
// import '../../Amodule/model/Bestseller.dart';
// import '../../Amodule/model/trending_model.dart';
// import '../../Anetwork/response.dart';
// import '../../Inner_pages/bestseller_innerpage.dart';
// import '../../Inner_pages/latestproduct_innerpage.dart';
// import '../../Inner_pages/trending_products.dart';
// import '../../Product_detail_page/pdetail.dart';
// import '../Amodule/bloc/wishlist.dart';
// import '../Amodule/model/wishlist.dart';

// class WishhList extends StatefulWidget{
//   const WishhList({Key? key, required this.switchLanguage}) : super(key: key);
//   final Function(String) switchLanguage;
//   @override
//   State<WishhList> createState() => _CoprodutssState();
// }

// class _CoprodutssState extends State<WishhList> {
//   late Wishh wishh;
//   late WishhListBloc _bloc;

// //Wishh
// //WishhListRepository
// //wishh
// //WishhListBloc
// //wishhListDataStream


//   @override


//   void initState() {
//     super.initState();
//     _bloc = WishhListBloc();
//   }


//   @override


//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//         child: StreamBuilder<Response<Wishh>>(
//             stream: _bloc.wishhListDataStream,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 switch (snapshot.data!.status) {
//                   case Status.LOADING:
//                     return Center(
//                       child: CircularProgressIndicator(
//                         color: Colors.white,
//                       ),
//                     );
//                   case Status.SUCCESS:
//                     wishh = snapshot.data!.data;
//                     return Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 16,right: 16),
//                           child: Row(
//                             children: [
//                               Material(
//                                 child: Text('Trending',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),),
//                               ),
//                               Spacer(),
//                               GestureDetector(
//                                 onTap: (){
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => Trendinginn(switchLanguage: widget.switchLanguage,),
//                                     ),
//                                   );
//                                 },
//                                 child: Material(
//                                   child: Text('View All',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 11,color: Colors.black),),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         // horizontal scrolling

//                         GestureDetector(
//                           onTap: (){
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ProductDetaiiil(switchLanguage: widget.switchLanguage,),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             height: 225,
//                             child: ListView.builder(
//                                 scrollDirection: Axis.horizontal,
//                                 itemCount: wishh.name.length,
//                                 itemBuilder:(context, index) {
//                                   return Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Container(
//                                       width: 125,
//                                       height: 400,
//                                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white),
//                                       child: Column(
//                                         children: [
//                                           SizedBox(height: 2,),
//                                           SizedBox(height: 7,),
//                                           Row(
//                                             children: [
//                                               SizedBox(width: 2,),
//                                               Material(child: Text(wishh.name,style: TextStyle(fontSize: 9,fontWeight: FontWeight.w600,color: Colors.black),))
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 }),
//                           ),
//                         ),

//                       ],
//                     );
//                   case Status.ERROR:
//                     return Container(
//                       decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             image:  NetworkImage("https://img.freepik.com/free-vector/error-404-concept-landing-page_52683-21190.jpg?w=740&t=st=1686729545~exp=1686730145~hmac=f13f33b57d8f938d3616d3666c69549cb3914f8267e3679358bae4c5b2305455"),
//                             fit: BoxFit.fill,
//                           )),
//                     );
//                   case Status.COMPLETED:
//                     break;
//                 }
//               }
//               return Container(
//                 color: Colors.black45,
//               );
//             }
//         )
//     );
//   }
// }