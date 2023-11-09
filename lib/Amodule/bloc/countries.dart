


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

// class CountryListBloc {

//   CountryListRepository _countryListRepository = CountryListRepository();
//   final _countryListDataController = StreamController<Response<Country>>();

//   StreamSink<Response<Country>> get countryListDataSink =>
//       _countryListDataController.sink;

//   Stream<Response<Country>>? get countryListDataStream =>
//       _countryListDataController.stream;

//   CountryListBloc() {
//     _countryListRepository = CountryListRepository();
//     getcountryListBloc();
//   }

//   getcountryListBloc() async {
//     countryListDataSink.add(Response.loading('Fetching...'));
//     try {
//       Country countryList = await _countryListRepository.countryList();
//       countryListDataSink.add(Response.success(countryList));
//     } catch (e) {
//       countryListDataSink.add(Response.error(e.toString()));
//       print(e);
//     }
//   }

//   dispose() {
//     _countryListDataController.close();
//   }
// }
