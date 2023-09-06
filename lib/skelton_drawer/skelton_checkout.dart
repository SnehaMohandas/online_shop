import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SkeltonCheckout extends StatelessWidget {
  const SkeltonCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CardLoading(
              height: 50,
              width: double.infinity,
            ),
            SizedBox(
              height: 20,
            ),
            CardLoading(
              height: 30,
              width: double.infinity,
            ),
            SizedBox(
              height: 30,
            ),
            CardLoading(
              height: 40,
              width: double.infinity,
            ),
            SizedBox(
              height: 10,
            ),
            CardLoading(
              height: 50,
              width: double.infinity,
            ),
            SizedBox(
              height: 15,
            ),
            CardLoading(
              height: 200,
              width: double.infinity,
            ),
            SizedBox(
              height: 20,
            ),
            CardLoading(
              height: 30,
              width: double.infinity,
            ),
            SizedBox(
              height: 20,
            ),
            CardLoading(
              height: 50,
              width: double.infinity,
            ),
            SizedBox(
              height: 30,
            ),
            CardLoading(
              height: 40,
              width: double.infinity,
            ),
            SizedBox(
              height: 20,
            ),
            CardLoading(
              height: 40,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
