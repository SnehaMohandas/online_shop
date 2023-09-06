import '../../Anetwork/api provider.dart';
import '../model/get_Latest_Products_model.dart';
import '../model/get_categories_model.dart';

class CategoriesproductListRepository {
  Future categoryList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "api/getCategories/key/123456789",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return Categories.fromJson(response);
  }
}