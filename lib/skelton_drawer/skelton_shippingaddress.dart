import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SkeltonAddress extends StatelessWidget {
  const SkeltonAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CardLoading(
                    margin: EdgeInsets.only(bottom: 18),
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: double.infinity,
                  );
                }),
          ),
        ),
      ],
    );
  }
}
