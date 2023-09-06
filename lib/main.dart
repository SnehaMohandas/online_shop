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
import 'package:wayelle/controllers/product_details_controller.dart';
import 'package:wayelle/wishlist/wishlist_listing.dart';
import 'A_comman_widget/Country_Zone/country_dropdown.dart';
import 'A_comman_widget/Home_page/Best_seller.dart';
import 'A_comman_widget/Home_page/latest_products.dart';
import 'A_comman_widget/Home_page/trending_products.dart';
import 'A_comman_widget/bottom navigationbar.dart';
import 'Address_book/List_address.dart';
import 'Address_book/add_new_address.dart';
import 'Address_book/edit_address.dart';
import 'Category_page/all_in_one.dart';
import 'Category_page/category_page.dart';
import 'Category_page/child_category.dart';
import 'Category_page/child_category_products.dart';
import 'Forgot_password/forgotpassword.dart';
import 'Get_all_products/all_products.dart';
import 'Home_screen/home_screen.dart';
import 'Home_screen/org_home.dart';
import 'Inner_pages/bestseller_innerpage.dart';
import 'Inner_pages/latestproduct_innerpage.dart';
import 'Login_screen/login_screen.dart';
import 'Onboarding_screens/Screen_1.dart';

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
    // prefs.setString("customer_id", jsonResponse["userdata"]["customer_id"]);
    customer_id = prefs.getString("customer_Id");
    await Future.delayed(
        const Duration(seconds: 3)); // Display splash screen for 3 seconds
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => user_id != null
            ? Bottomnavigation(
                switchLanguage: (String) {},
              )
            : Onscreen1(switchLanguage: widget.switchLanguage),
      ),
    );
    if (user_id != null) {
      global_id = user_id; // Assign the value to the global variable
      print("User ID: $customer_id");
    }
  }

  @override
  Widget build(BuildContext context) {
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