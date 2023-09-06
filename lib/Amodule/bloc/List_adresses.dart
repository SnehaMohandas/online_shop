



import 'dart:async';

import '../../Anetwork/response.dart';
import '../model/List_adresses_model.dart';
import '../model/all_products_model.dart';
import '../model/get_Latest_Products_model.dart';
import '../repository/List_adresses_repo.dart';
import '../repository/all_products_repo.dart';
import '../repository/get_Latest_Products_repo.dart';

//AddressListRepository
//Addresslist
//AddressListBloc
//addresslistDataStream

class AddressListBloc {

  AddressListRepository _addresslistRepository = AddressListRepository();
  final _addresslistDataController = StreamController<Response<Addresslist>>();

  StreamSink<Response<Addresslist>> get addresslistDataSink =>
      _addresslistDataController.sink;

  Stream<Response<Addresslist>>? get addresslistDataStream =>
      _addresslistDataController.stream;

  AddressListBloc() {
    _addresslistRepository = AddressListRepository();
    getaddresslistBloc();
  }

  getaddresslistBloc() async {
    addresslistDataSink.add(Response.loading('Fetching...'));
    try {
      Addresslist addresslist = await _addresslistRepository.addresslist();
      addresslistDataSink.add(Response.success(addresslist));
    } catch (e) {
      addresslistDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _addresslistDataController.close();
  }
}
