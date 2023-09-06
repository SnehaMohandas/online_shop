// import 'package:flutter/material.dart';

// import '../Amodule/bloc/product_detail_bloc.dart';
// import '../Amodule/model/product_detail_model.dart';
// import '../Anetwork/response.dart';

// class ProductDetaill extends StatefulWidget{
//   final Function(String)switchLanguage;
//   ProductDetaill({Key? key, required this.switchLanguage}) : super(key: key);
//   @override
//   State<ProductDetaill> createState() => _ProductDetailState();
// }

// class _ProductDetailState extends State<ProductDetaill> {

//   late Product detail;
//   late ProductDetailListBloc _bloc;

//   @override
//   void initState() {
//     super.initState();
//     _bloc = ProductDetailListBloc();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading:Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,) ,
//           backgroundColor: Color(0xFFF9F9F9),
//           elevation: 0,
//           centerTitle: true,
//           title: Text('All Products',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black),),
//           actions: [
//             Icon(Icons.share,color: Colors.black,),
//             SizedBox(width: 8,)
//           ],
//         ),
//         body: SingleChildScrollView(
//             child: StreamBuilder<Response<Product>>(
//                 stream: _bloc.productdetailListDataStream,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     switch (snapshot.data!.status) {
//                       case Status.LOADING:
//                         return Center(
//                           child: CircularProgressIndicator(
//                             color: Colors.green[400],
//                           ),
//                         );

//                       case Status.SUCCESS:
//                         detail = snapshot.data!.data;
//                         return Column(
//                           children: [
//                             // Container(
//                             //   height: 410,
//                             //   width: double.infinity,
//                             //   color: Color(0xffeff1f0),
//                             //   child: ListView.builder(
//                             //     itemCount: detail.product?.name?.length,
//                             //       scrollDirection:
//                             //       Axis.horizontal,
//                             //       itemBuilder: (context, index) {
//                             //         return Container(
//                             //           height: 200,
//                             //           width: double.infinity,
//                             //           color: Colors.blue,
//                             //           child: Text('hghgg',style: TextStyle(color: Colors.blue),),
//                             //         );
//                             //       }
//                             //
//                             //   ),
//                             // )
//                           ],
//                         );




//                       case Status.ERROR:
//                         return Container(
//                           child: Center(
//                             child: Text(
//                               "ERROR",
//                               style: TextStyle(
//                                   color: Colors.red,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           decoration: const BoxDecoration(
//                               image: DecorationImage(
//                                 image: AssetImage("assets/images/error.png"),
//                                 fit: BoxFit.fill,
//                               )),
//                         );
//                       case Status.COMPLETED:
//                         break;
//                     }
//                   }
//                   return Container(
//                     color: Colors.black45,
//                   );
//                 }))
//     );
//   }
// }