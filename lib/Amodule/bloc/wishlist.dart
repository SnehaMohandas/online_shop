//Wishh
//WishhListRepository
//wishh
//WishhListBloc
//wishhListDataStream




import 'dart:async';

import '../../Anetwork/response.dart';
import '../model/Bestseller.dart';
import '../model/trending_model.dart';
import '../model/wishlist.dart';
import '../repository/bestseller.dart';
import '../repository/trending_repo.dart';
import '../repository/wishlist.dart';

class WishhListBloc {

  WishhListRepository _wishhListRepository = WishhListRepository();
  final _wishhListDataController = StreamController<Response<Wishh>>();

  StreamSink<Response<Wishh>> get wishhListDataSink =>
      _wishhListDataController.sink;

  Stream<Response<Wishh>>? get wishhListDataStream =>
      _wishhListDataController.stream;

  WishhListBloc() {
    _wishhListRepository = WishhListRepository();
    getwishhListBloc();
  }

  getwishhListBloc() async {
    wishhListDataSink.add(Response.loading('Fetching...'));
    try {
      Wishh wishhList = await _wishhListRepository.wishhList();
      wishhListDataSink.add(Response.success(wishhList));
    } catch (e) {
      wishhListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _wishhListDataController.close();
  }
}