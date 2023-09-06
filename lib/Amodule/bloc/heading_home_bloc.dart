

//HeadingListRepository
//headings
//Headings
//HeadingsListBloc
//headingsListDataStream


import 'dart:async';
import '../../Anetwork/response.dart';
import '../model/Bestseller.dart';
import '../model/heading_home_model.dart';
import '../repository/bestseller.dart';
import '../repository/heading_home_repo.dart';

class HeadingsListBloc {

  HeadingListRepository _headingsListRepository = HeadingListRepository();
  final _headingsListDataController = StreamController<Response<Headings>>();

  StreamSink<Response<Headings>> get headingsListDataSink =>
      _headingsListDataController.sink;

  Stream<Response<Headings>>? get headingsListDataStream =>
      _headingsListDataController.stream;

  HeadingsListBloc() {
    _headingsListRepository = HeadingListRepository();
    getheadingsListBloc();
  }

  getheadingsListBloc() async {
    headingsListDataSink.add(Response.loading('Fetching...'));
    try {
      Headings headingsList = await _headingsListRepository.headingsList();
      headingsListDataSink.add(Response.success(headingsList));
    } catch (e) {
      headingsListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _headingsListDataController.close();
  }
}