



import 'dart:async';

import '../../Anetwork/response.dart';
import '../model/get_Latest_Products_model.dart';
import '../model/product_detail_model.dart';
import '../repository/get_Latest_Products_repo.dart';
import '../repository/product_detail_repo.dart';

class ProductDetailListBloc {

  ProductdetailListRepository _productdetailListRepository = ProductdetailListRepository();
  final _productdetailListDataController = StreamController<Response<Product>>();

  StreamSink<Response<Product>> get productdetailListDataSink =>
      _productdetailListDataController.sink;

  Stream<Response<Product>>? get productdetailListDataStream =>
      _productdetailListDataController.stream;

  ProductDetailListBloc() {
    _productdetailListRepository = ProductdetailListRepository();
    getproductdetailListBloc();
  }

  getproductdetailListBloc() async {
    productdetailListDataSink.add(Response.loading('Fetching...'));
    try {
      Product productdetailList = await _productdetailListRepository.productdetailList();
      productdetailListDataSink.add(Response.success(productdetailList));
    } catch (e) {
      productdetailListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _productdetailListDataController.close();
  }
}
