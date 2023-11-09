import 'package:get/get.dart';
import 'package:wayelle/Anetwork/api.dart';

import '../Amodule/model/additional_pdt_details_model.dart';
import 'package:http/http.dart' as http;

class AddProductDetailontroller extends GetxController {
  AdditionalProductDetail? additionalProductDetail;
  var isLoading = true.obs;
  List productImages = [].obs;

  fetchAdditionalDetails() async {
    try {
      isLoading(true);
      var response = await http.get(
          Uri.parse("${baseurl}api/getProdadditional/p_id/43/key/123456789"));
      if (response.statusCode == 200) {
        var data = additionalProductDetailFromJson(response.body);
        additionalProductDetail = data;
        print(additionalProductDetail!.productsProdadditional.addImgs[0].image);
      } else {}
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchAdditionalDetails();
    super.onInit();
  }
}
