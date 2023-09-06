import '../../Anetwork/api provider.dart';
import '../model/all_products_model.dart';
import '../model/get_Latest_Products_model.dart';

class AllproductListRepository {
  Future allList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "api/products/key/123456789",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return Allproducts.fromJson(response);
  }
}