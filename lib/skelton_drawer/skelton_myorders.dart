import 'package:card_loading/card_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SkeltonMyorders extends StatelessWidget {
  const SkeltonMyorders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: SizedBox(
            height: 10,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: CardLoading(height: 60),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(
            // height: 180,
            margin: EdgeInsets.all(10),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CardLoading(
                    margin: EdgeInsets.only(bottom: 18),
                    height: 128,
                    width: double.infinity,
                  );
                }),
          ),
        ),
      ],
    );
  }
}
