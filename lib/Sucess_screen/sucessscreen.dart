import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wayelle/A_comman_widget/bottom%20navigationbar.dart';
import 'package:wayelle/controllers/cart_controller.dart';

class Sucess extends StatefulWidget {
  final Function(String) switchLanguage;
  Sucess({
    Key? key,
    required this.switchLanguage,
  }) : super(key: key);
  @override
  State<Sucess> createState() => _SucessState();
}

class _SucessState extends State<Sucess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 407),
            child: Container(
              height: 213,
              width: 208,
              child: Image(
                image:
                    NetworkImage('https://globosoft.org/2023/05/wayelle.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 77, right: 77, bottom: 270),
            child: Text(
              'Your order will be delivered soon.Thank you for choosing our app!',
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 318),
            child: Text(
              'Success!',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 34),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25, left: 16, right: 16),
            child: GestureDetector(
              onTap: () {
                Get.put(CartController());
                var cartcontroller = Get.find<CartController>();
                cartcontroller.fetchCart();
                Get.offAll(() => Bottomnavigation(
                      switchLanguage: widget.switchLanguage,
                    ));
              },
              child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black),
                  child: Center(
                    child: Text(
                      'CONTINUE SHOPPING',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
