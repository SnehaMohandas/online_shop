//TrendingListRepository
//Trending
//trending
//TrendingListBloc
//trendingListDataStream


import 'dart:async';

import '../../Anetwork/response.dart';
import '../model/Bestseller.dart';
import '../model/trending_model.dart';
import '../repository/bestseller.dart';
import '../repository/trending_repo.dart';

class TrendingListBloc {

  TrendingListRepository _trendingListRepository = TrendingListRepository();
  final _trendingListDataController = StreamController<Response<Trending>>();

  StreamSink<Response<Trending>> get trendingListDataSink =>
      _trendingListDataController.sink;

  Stream<Response<Trending>>? get trendingListDataStream =>
      _trendingListDataController.stream;

  TrendingListBloc() {
    _trendingListRepository = TrendingListRepository();
    gettrendingListBloc();
  }

  gettrendingListBloc() async {
    trendingListDataSink.add(Response.loading('Fetching...'));
    try {
      Trending trendingList = await _trendingListRepository.trendingList();
      trendingListDataSink.add(Response.success(trendingList));
    } catch (e) {
      trendingListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _trendingListDataController.close();
  }
}