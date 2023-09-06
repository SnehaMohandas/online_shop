import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayelle/Favorite_screen/favorite_screen.dart';
import 'package:wayelle/Cart_screen/cart_screen.dart';
import 'package:wayelle/My_orders/my_order_screen.dart';
import 'package:wayelle/controllers/all_products_controller.dart';
import 'package:wayelle/controllers/cart_controller.dart';
import 'package:wayelle/controllers/favorite_controller.dart';
import 'package:wayelle/controllers/home_controller.dart';
import 'package:wayelle/controllers/my_order_controller.dart';
import 'package:wayelle/controllers/order_controller.dart';
import 'package:wayelle/controllers/user_controller.dart';

import '../Category_page/all_in_one.dart';
import '../Home_screen/org_home.dart';
import '../My_profile/my_profile.dart';
import '../Settings/settings_mainpage.dart';

class Bottomnavigation extends StatefulWidget {
  Bottomnavigation({Key? key, required this.switchLanguage, this.currentIndex})
      : super(key: key);
  final Function(String) switchLanguage;
  int? currentIndex;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Bottomnavigation> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    Orghome(
      switchLanguage: (String) {},
    ),
    CategoryListPage(
      switchLanguage: (String) {},
    ),
    // CartScreen(
    //   switchLanguage: (String) {},
    // ),
    MyOrders(switchLanguage: (String) {}),

    FavScreen(),
    Settingsmain(
      switchLanguage: (String) {},
    ),

    // Myprofile(
    //   switchLanguage: (String) {},
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    var favController = Get.put(FavoriteController());
    var cartController = Get.put(CartController());
    // var orderController = Get.put(GetOrderController());
    var myorderController = Get.put(MyOrderController());

    var homeontrolller = Get.put(HomeController());
    var allproductController = Get.put(AllproductController());

    //var userAddressController = Get.put(UserController());

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          homeontrolller.fetchBanners();
          favController.fetchWishList();
          cartController.fetchCart();
          myorderController.fetchMyorders();
          // orderController.checkKeyExists("orderId");
          // orderController.orderId.toString() != null ||
          //         orderController.orderId.toString() != ""
          //     ? orderController.getOrders()
          //     : null;
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              //   color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category_outlined,
              //  color: Colors.black,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              // color: Colors.black,
            ),
            label: 'My orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
              // color: Colors.black,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
              //  color: Colors.black,
            ),
            label: 'Settings',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        //  selectedIconTheme: IconThemeData(color: Colors.amber),

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        //selectedLabelStyle: TextStyle(color: Colors.red),
        //
        // unselectedLabelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
