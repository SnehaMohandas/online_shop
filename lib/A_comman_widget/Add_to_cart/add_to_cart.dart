//
//
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../Amodule/model/product_detail_model.dart';
// import '../../Home_screen/org_home.dart';
//
//
//
//
//
// class Removeproduct extends StatefulWidget {
//   const Removeproduct ({Key? key, required this.switchLanguage,}) : super(key: key);
//   final Function(String)switchLanguage;
//   @override
//   _CartAddPageState createState() => _CartAddPageState();
// }
//
// class _CartAddPageState extends State<Removeproduct> {
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//        title: Text('Add to Cart'),
//       ),
//       body:
//       RemovefromCartButton(usersId :10,product_cart_id:212,switchLanguage: widget.switchLanguage,Quantity: 1,),
//     );
//   }
// }
//
//
//
// class RemovefromCartButton extends StatefulWidget {
//
//
//   const RemovefromCartButton({Key? key, required this.usersId, required this.product_cart_id, required this.switchLanguage,required this.Quantity}) : super(key: key);
//   final int usersId;
//   final int product_cart_id;
//   final int Quantity;
//   final Function(String)switchLanguage;
//
//   @override
//   _AddToCartButtonState createState() => _AddToCartButtonState();
// }
//
// class _AddToCartButtonState extends State<RemovefromCartButton> {
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.deepOrange, // Background color
//                 ),
//                 child: Text("Ok",style: TextStyle(color: Colors.white),),
//                 onPressed: ()async{
//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(builder: (context) => Orghome(switchLanguage: widget.switchLanguage,)),
//                   // );
//                   final response = await ApiClient().addToCart(
//                     widget.usersId,
//                     widget.product_cart_id,
//                     widget.Quantity,
//
//                   );
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
// class ApiClient {
//   final Dio _dio = Dio();
//
//   Future<Response> addToCart(int userId, int productcartId,int Quantity) async {
//     final data = {
//       'customer_id': '10',
//       'product_id': '43',
//       'quantity': '1',
//     };
//     final response = await _dio.post(
//       'https://globosoft.org/2023/02/wayelle2/api/addcart/key/123456789',
//       data: data,
//     );
//     print("132=${data}");
//     print("User${productcartId}");
//     return response;
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wayelle/Anetwork/api.dart';

import '../../Amodule/model/product_detail_model.dart';
import '../../Login_screen/login_screen.dart';
import '../../main.dart';

class CartAddPage extends StatefulWidget {
  const CartAddPage({
    Key? key,
    required this.switchLanguage,
  }) : super(key: key);
  final Function(String) switchLanguage;
  @override
  _CartAddPageState createState() => _CartAddPageState();
}

class _CartAddPageState extends State<CartAddPage> {
  late final Product bat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: AddToCartButton(product_id: 4),
    );
  }
}

class AddToCartButton extends StatefulWidget {
  const AddToCartButton({
    Key? key,
    required this.product_id,
  }) : super(key: key);

  final int product_id;

  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  int _quantity = 1;
  double _price = 10.0;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
      _price += 10.0;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
        _price -= 10.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Spacer(),
            GestureDetector(
              onTap: () async {
                final response = await ApiClient().addToCart(
                  widget.product_id,
                  _quantity,
                );
              },
              child: Container(
                height: 35,
                width: 35,
                child: Image.network(
                  'https://myfitbuddy.com/dev/image/cart-new.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  "Qty",
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: _decrementQuantity,
                      icon: const Icon(Icons.remove),
                    ),

                    // SizedBox(width: 3,),

                    Text(_quantity.toString()),

                    // SizedBox(width: 3,),

                    IconButton(
                      onPressed: _incrementQuantity,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

class ApiClient {
  final Dio _dio = Dio();
  final User_Id = user_id ?? customer_id!;
  Future<Response> addToCart(int productId, int quantity) async {
    final data = {
      'customer_id': User_Id,
      'product_id': productId,
      'quantity': quantity,
      // 'price': 20,
    };
    final response = await _dio.post(
      'https://globosoft.org/2023/02/wayelle2/api/addcart/key/123456789',
      data: data,
    );
    print("132=${data}");
    print("User${productId}");
    return response;
  }
}
