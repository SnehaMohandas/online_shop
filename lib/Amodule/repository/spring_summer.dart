import '../../Anetwork/api provider.dart';
import '../model/Bestseller.dart';
import '../model/get_Latest_Products_model.dart';
import '../model/spring_summer.dart';

class SpringproductListRepository {
  Future springsummerList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "index.php?route=extension/feed/rest_api/getFeature&key=123456789&mod_name=Spring Summer&limit=10",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return Springsummer.fromJson(response);
  }
}







