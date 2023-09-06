

//SpringproductListRepository
//Springsummer
//springsummer
//SpringsummerListBloc
//springsummerListDataStream


import 'dart:async';

import '../../Anetwork/response.dart';
import '../model/Bestseller.dart';
import '../model/spring_summer.dart';
import '../repository/bestseller.dart';
import '../repository/spring_summer.dart';

class SpringsummerListBloc {

  SpringproductListRepository _springsummerListRepository = SpringproductListRepository();
  final _springsummerListDataController = StreamController<Response<Springsummer>>();

  StreamSink<Response<Springsummer>> get springsummerListDataSink =>
      _springsummerListDataController.sink;

  Stream<Response<Springsummer>>? get springsummerListDataStream =>
      _springsummerListDataController.stream;

  SpringsummerListBloc() {
    _springsummerListRepository = SpringproductListRepository();
    getspringsummerListBloc();
  }

  getspringsummerListBloc() async {
    springsummerListDataSink.add(Response.loading('Fetching...'));
    try {
      Springsummer springsummerList = await _springsummerListRepository.springsummerList();
      springsummerListDataSink.add(Response.success(springsummerList));
    } catch (e) {
      springsummerListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _springsummerListDataController.close();
  }
}