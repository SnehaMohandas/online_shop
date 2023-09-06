// //ZoneListRepository
// //LatestproductListBloc
// //zoneListDataStream
//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// import '../../Amodule/bloc/countries.dart';
// import '../../Amodule/bloc/zone.dart';
// import '../../Amodule/model/countries.dart';
// import '../../Anetwork/response.dart';
//
//
//
//
// // late final jsonResponse;
// // int? selectedcityId;
//
// class Globals{
//   static int selectedcityId =0;
// }
//
//
//
// class ZoneListScreen extends StatefulWidget {
//   const ZoneListScreen({Key? key, this.customerDetails}) : super(key: key);
//   final customerDetails;
//
//   @override
//   State<ZoneListScreen> createState() => _BatteryScreenState();
// }
//
// class _BatteryScreenState extends State<ZoneListScreen> {
//   Zone? lann;
//   bool hasBeenClicked = false;
//   String? Selectename ;
//   int? SelecteId ;
//   int Selecte =0;
//   String id = "";
//   String? name;
//
//
//   String lang_id = "";
//   late ZoneListBloc _bloc;
//
//   @override
//   void initState() {
//     super.initState();
//     _bloc = ZoneListBloc();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Container(
//         child: StreamBuilder<Response<Zone>>(
//             stream: _bloc.zoneListDataStream,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 switch (snapshot.data!.status) {
//                   case Status.LOADING:
//                     return Center(
//                       child: CircularProgressIndicator(
//                         color: Colors.green[400],
//                       ),
//                     );
//                   case Status.SUCCESS:
//                     lann = snapshot.data!.data;
//
//                     return  Column(
//                       children: [
//                         SizedBox(height: 44,),
//                         DropdownButtonHideUnderline(
//                           child: DropdownButtonFormField(
//                             decoration: InputDecoration(
//                               labelText: '--Please Select--',
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(color: Colors.black54),
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                               fillColor: Colors.white,
//                             ),
//                             items: lann?.countries?.map((item) {
//                               return DropdownMenuItem(
//                                 value: item.name,
//                                 onTap: () {
//                                   setState(() {
//                                     id = item.countryId.toString();
//                                     // SelecteId =doc?.data![index].petDetailsId!.toInt();
//
//                                     SelecteId=item.countryId as int?;
//                                     Globals.selectedcityId=SelecteId!;
//                                   });
//                                   print("name--${Globals.selectedcityId}");
//                                   print("id--${SelecteId}");
//                                 },
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 10),
//                                   child: Text(item.name ?? ""),
//                                 ),
//                               );
//                             }).toList(),
//                             onChanged: (newValue) {
//                               setState(() {
//                                 name = newValue! as String?;
//                               });
//                             },
//                             value: name,
//                           ),
//                         ),
//                       ],
//                     );
//
//
//                   case Status.ERROR:
//                     return const Text("123");
//                   case Status.COMPLETED:
//                     break;
//                 }
//               }
//               return Container(
//                 color: Colors.red,
//               );
//             }),
//       ),
//     );
//   }
// }
//
