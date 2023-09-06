import 'package:wayelle/Anetwork/api.dart';

import '../../Anetwork/api provider.dart';
import '../../Login_screen/login_screen.dart';
import '../../main.dart';
import '../model/List_adresses_model.dart';

class AddressListRepository {
  Future addresslist() async {
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
    return Addresslist.fromJson(response);
  }
}

//Addresslist