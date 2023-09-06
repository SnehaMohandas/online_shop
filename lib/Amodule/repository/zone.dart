import '../../Anetwork/api provider.dart';
import '../model/all_products_model.dart';
import '../model/countries.dart';
import '../model/get_Latest_Products_model.dart';

class ZoneListRepository {
  Future zoneList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{};
    final response = await WebApiProvider().getData(
        url: "api/getZonesByCountryId/country_id/99/key/123456789",
        isPost: false,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    return Country.fromJson(response);
  }
}