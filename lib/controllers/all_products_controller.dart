import 'package:get/get.dart';
import 'package:wayelle/Amodule/model/all_product_model.dart';
import 'package:wayelle/Anetwork/api.dart';

import '../Amodule/model/all_products_model.dart';
import 'package:http/http.dart' as http;

class AllproductController extends GetxController {
  Allproduct? allproducts;
  var isLoading = true.obs;
  fetchAllproducts() async {
    try {
      isLoading(true);
      var response =
          await http.get(Uri.parse("${baseurl}api/products/key/123456789"));
      if (response.statusCode == 200) {
        var data = allproductFromJson(response.body);
        allproducts = data;
        print("allproduct response${allproducts}");
      } else {}
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }
//    fetchBestseller() async {
//     try {
//       isLoading(true);
//       var response =
//           await http.get(Uri.parse("${baseurl}api/getBestseller/limit/{limit}/key/{secret_key}"));
//       if (response.statusCode == 200) {
//         var data = allproductFromJson(response.body);
//         allproducts = data;
//         print("allproduct response${allproducts}");
//       } else {}
//     } catch (e) {
//     } finally {
//       isLoading(false);
//     }
//   }

  @override
  void onInit() {
    fetchAllproducts();
    super.onInit();
  }
}


//api/getBestseller/limit/{limit}/key/{secret_key}
