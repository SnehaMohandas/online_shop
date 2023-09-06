import 'dart:convert';

import 'package:get/get.dart';
import 'package:wayelle/Anetwork/api.dart';

import '../Amodule/model/search_model.dart';
import 'package:http/http.dart' as http;

class SearchController extends GetxController {
  Search? search;
  var isLoading = true.obs;
  var searchkey = '';
  var successvalue = "".obs;
  var searchTapped = false.obs;

  featchSeachResult(String searchKey) async {
    searchkey = await searchKey;

    try {
      isLoading(true);
      var response = await http.get(Uri.parse(
          "${baseurl}api/searchproduct/seakeyword/${searchkey}/key/123456789"));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        if (jsonData["success"] == false) {
          successvalue.value = "false";
          print(successvalue.value);
        } else {
          var data = searchFromJson(response.body);
          print(data.searchresult[0].name);
          search = data;
          successvalue.value = "true";
        }
      } else {}
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // featchSeachResult("k");
    super.onInit();
  }
}
