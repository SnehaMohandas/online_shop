


// //CountryListRepository
// //Country
// //country





// import 'dart:async';


// import '../../Anetwork/response.dart';
// import '../model/all_products_model.dart';
// import '../model/countries.dart';
// import '../model/get_Latest_Products_model.dart';
// import '../repository/all_products_repo.dart';
// import '../repository/countries.dart';
// import '../repository/get_Latest_Products_repo.dart';
// import '../repository/zone.dart';

// class ZoneListBloc {

//   ZoneListRepository _zoneListRepositoryListRepository = ZoneListRepository();
//   final _zoneListDataController = StreamController<Response<Zone>>();

//   StreamSink<Response<Zone>> get zoneListDataSink =>
//       _zoneListDataController.sink;

//   Stream<Response<Zone>>? get zoneListDataStream =>
//       _zoneListDataController.stream;

//   ZoneListBloc() {
//     _zoneListRepositoryListRepository = ZoneListRepository();
//     getzoneListBloc();
//   }

//   getzoneListBloc() async {
//     zoneListDataSink.add(Response.loading('Fetching...'));
//     try {
//       Zone zoneList = await _zoneListRepositoryListRepository.zoneList();
//       zoneListDataSink.add(Response.success(zoneList));
//     } catch (e) {
//       zoneListDataSink.add(Response.error(e.toString()));
//       print(e);
//     }
//   }

//   dispose() {
//     _zoneListDataController.close();
//   }
// }
