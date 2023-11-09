import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayelle/Amodule/model/banners_model.dart';
import 'package:http/http.dart' as http;
import 'package:wayelle/Anetwork/api.dart';

class HomeController extends GetxController {
  Banners? banner;
  var isLoading = true.obs;
  List bannerImgs = [];
  List bannerTitle = [];

  fetchBanners() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(
          "${baseurl}api/getbannerbyname/bannername/HomePageSlideshow/key/123456789"));
      if (response.statusCode == 200) {
        var data = bannersFromJson(response.body);
        banner = data;
        for (int i = 0; i <= banner!.banners.length; i++) {
          bannerImgs.addAll([banner!.banners[i].image]);
          bannerTitle.addAll([banner!.banners[i].title.toUpperCase()]);
        }
        print(banner!.banners[0].bannerImageId);
      } else {}
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }
}
