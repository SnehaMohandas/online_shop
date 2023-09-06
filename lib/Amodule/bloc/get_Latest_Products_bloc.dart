



import 'dart:async';

import '../../Anetwork/response.dart';
import '../model/get_Latest_Products_model.dart';
import '../repository/get_Latest_Products_repo.dart';

class LatestproductListBloc {

  LatestproductListRepository _latestListRepository = LatestproductListRepository();
  final _latestListDataController = StreamController<Response<Latestproduct>>();

  StreamSink<Response<Latestproduct>> get latestListDataSink =>
      _latestListDataController.sink;

  Stream<Response<Latestproduct>>? get latestListDataStream =>
      _latestListDataController.stream;

  LatestproductListBloc() {
    _latestListRepository = LatestproductListRepository();
    getlatestListBloc();
  }

  getlatestListBloc() async {
    latestListDataSink.add(Response.loading('Fetching...'));
    try {
      Latestproduct latestList = await _latestListRepository.latestList();
      latestListDataSink.add(Response.success(latestList));
    } catch (e) {
      latestListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _latestListDataController.close();
  }
}
