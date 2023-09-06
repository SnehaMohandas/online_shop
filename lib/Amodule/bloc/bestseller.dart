

//BestsellerproductListRepository
//Bestseller
//bestseller
//BestsellerListBloc
//bestsellerListDataStream


import 'dart:async';

import '../../Anetwork/response.dart';
import '../model/Bestseller.dart';
import '../repository/bestseller.dart';

class BestsellerListBloc {

  BestsellerproductListRepository _bestsellerListRepository = BestsellerproductListRepository();
  final _bestsellerListDataController = StreamController<Response<Bestseller>>();

  StreamSink<Response<Bestseller>> get bestsellerListDataSink =>
      _bestsellerListDataController.sink;

  Stream<Response<Bestseller>>? get bestsellerListDataStream =>
      _bestsellerListDataController.stream;

  BestsellerListBloc() {
    _bestsellerListRepository = BestsellerproductListRepository();
    getbestsellerListBloc();
  }

  getbestsellerListBloc() async {
    bestsellerListDataSink.add(Response.loading('Fetching...'));
    try {
      Bestseller bestsellerList = await _bestsellerListRepository.bestsellerList();
      bestsellerListDataSink.add(Response.success(bestsellerList));
    } catch (e) {
      bestsellerListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _bestsellerListDataController.close();
  }
}