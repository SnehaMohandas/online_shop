import 'package:wayelle/Anetwork/api.dart';

import '../../Anetwork/api provider.dart';
import '../model/wishlist.dart';

class WishhListRepository {
  Future wishhList() async {
    final Map<String, dynamic> _queryParameters = <String, dynamic>{
      "customer_id": customer_id,
    };
    final response = await WebApiProvider().getData(
        url: "api/getaddress/key/123456789",
        isPost: true,
        isDelete: false,
        isPatch: false,
        queryParameters: _queryParameters,
        isQueryParmeter: true);
    print("12==${_queryParameters}");
    return Wishh.fromJson(response);
  }
}
