import '../../Anetwork/api provider.dart';
import '../model/Bestseller.dart';
import '../model/get_Latest_Products_model.dart';
import '../model/heading_home_model.dart';

class HeadingListRepository {
  Future headingsList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "index.php?route=extension/feed/rest_api/getFeature&key=123456789&mod_name=BEST SELLER&limit=10",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return Headings.fromJson(response);
  }
}







