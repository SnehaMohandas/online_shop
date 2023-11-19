import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wayelle/Anetwork/api.dart';
import 'package:wayelle/controllers/cart_controller.dart';
import 'package:wayelle/controllers/favorite_controller.dart';
import 'package:wayelle/controllers/my_order_controller.dart';
import 'package:wayelle/controllers/product_details_controller.dart';
import 'package:wayelle/controllers/user_register_controller.dart';
import 'A_comman_widget/Home_page/Best_seller.dart';
import 'A_comman_widget/Home_page/latest_products.dart';
import 'A_comman_widget/Home_page/trending_products.dart';
import 'A_comman_widget/bottom navigationbar.dart';

import 'Address_book/edit_address.dart';
import 'Category_page/all_in_one.dart';
import 'Category_page/child_category.dart';
import 'Category_page/child_category_products.dart';
import 'Forgot_password/forgotpassword.dart';
import 'Get_all_products/all_products.dart';
import 'Home_screen/org_home.dart';
import 'Inner_pages/bestseller_innerpage.dart';
import 'Inner_pages/latestproduct_innerpage.dart';
import 'Login_screen/login_screen.dart';
import 'Onboarding_screens/Screen_1.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

int? global_id;

void main() {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_live_51M28KDKTgJy3KTxX448K6xAY2NQSpzr7wQoXEnn2wKhrPhTza3bi98ctxxRp19AzzRxiehMmowQjhPla1HMVsXCy001rtz9Nn2';
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void _switchLanguage(String languageCode) {
    setState(() {
      _locale = Locale(languageCode);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get.put(ProductController());
    return GetMaterialApp(
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        switchLanguage: _switchLanguage,
      ),
      // Orghome(switchLanguage: _switchLanguage,),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.switchLanguage})
      : super(key: key);
  final Function(String) switchLanguage;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkLoginStatus();
    });
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? user_id = prefs.getInt('customer_id');

    final pref = await SharedPreferences.getInstance();

    customer_id = prefs.getString("customer_Id");
    userEmail = prefs.getString("email");
    usercustomerGrpId = prefs.getString("cus_grp_id");
    print(usercustomerGrpId);

    userfirstName = prefs.getString("user_firstname");
    print(userfirstName);

    userlatName = prefs.getString("user_lastname");
    print(userlatName);

    usertelePhone = prefs.getString("user_telephone");
    print(usertelePhone);

    // useraddress = prefs.getString("user_address");
    // print(useraddress);

    // usercity = prefs.getString("user_city");
    // print(usercity);

    // userpostCode = prefs.getString("user_postcode");
    // print(userpostCode);

    await Future.delayed(
        const Duration(seconds: 3)); // Display splash screen for 3 seconds
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => customer_id != null
            ? Bottomnavigation(
                switchLanguage: (String) {},
              )
            : Onscreen1(switchLanguage: widget.switchLanguage),
      ),
    );
    if (customer_id != null) {
      var controller = Get.put(CartController());
      var myorderController = Get.put(MyOrderController());

      var favController = Get.put(FavoriteController());
      controller.fetchCart();
      myorderController.fetchMyorders();
      favController.fetchWishList();
    }
    if (user_id != null) {
      global_id = user_id; // Assign the value to the global variable
      print("User ID: $customer_id");
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController(widget.switchLanguage));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            height: 30,
            width: 130,
            child: Image(
              image: AssetImage('assets/logo/wayelle-logo.png'),
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}
