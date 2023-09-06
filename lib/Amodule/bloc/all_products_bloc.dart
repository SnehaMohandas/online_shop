



import 'dart:async';

import '../../Anetwork/response.dart';
import '../model/all_products_model.dart';
import '../model/get_Latest_Products_model.dart';
import '../repository/all_products_repo.dart';
import '../repository/get_Latest_Products_repo.dart';

class AllproductListBloc {

  AllproductListRepository _allListRepository = AllproductListRepository();
  final _allListDataController = StreamController<Response<Allproducts>>();

  StreamSink<Response<Allproducts>> get allListDataSink =>
      _allListDataController.sink;

  Stream<Response<Allproducts>>? get allListDataStream =>
      _allListDataController.stream;

  AllproductListBloc() {
    _allListRepository = AllproductListRepository();
    getallListBloc();
  }

  getallListBloc() async {
    allListDataSink.add(Response.loading('Fetching...'));
    try {
      Allproducts allList = await _allListRepository.allList();
      allListDataSink.add(Response.success(allList));
    } catch (e) {
      allListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _allListDataController.close();
  }
}


//////////////////////////


