import '../../Anetwork/api provider.dart';
import '../model/get_Latest_Products_model.dart';

class LatestproductListRepository {
  Future latestList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "api/getLatest/limit/4/key/123456789",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return Latestproduct.fromJson(response);
  }
}







