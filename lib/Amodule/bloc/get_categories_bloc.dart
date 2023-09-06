

//categoryListDataStream
//Categories
//CategoriesListBloc

import 'dart:async';

import '../../Anetwork/response.dart';
import '../model/all_products_model.dart';
import '../model/get_Latest_Products_model.dart';
import '../model/get_categories_model.dart';
import '../repository/all_products_repo.dart';
import '../repository/get_Latest_Products_repo.dart';
import '../repository/get_categories_repo.dart';

class CategoriesListBloc {

  CategoriesproductListRepository _categoryListRepository = CategoriesproductListRepository();
  final _categoryListDataController = StreamController<Response<Categories>>();

  StreamSink<Response<Categories>> get categoriesListDataSink =>
      _categoryListDataController.sink;

  Stream<Response<Categories>>? get categoryListDataStream =>
      _categoryListDataController.stream;

  CategoriesListBloc() {
    _categoryListRepository = CategoriesproductListRepository();
    getcategoryListBloc();
  }

  getcategoryListBloc() async {
    categoriesListDataSink.add(Response.loading('Fetching...'));
    try {
      Categories categoryList = await _categoryListRepository.categoryList();
      categoriesListDataSink.add(Response.success(categoryList));
    } catch (e) {
      categoriesListDataSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _categoryListDataController.close();
  }
}
