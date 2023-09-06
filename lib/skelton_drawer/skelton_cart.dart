import 'package:card_loading/card_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SkeltonCart extends StatelessWidget {
  const SkeltonCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          CardLoading(
            height: 25,
            width: double.infinity,
          ),
          SizedBox(
            height: 20,
          ),
          CardLoading(
            height: 46,
            width: double.infinity,
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              // height: 180,
              margin: EdgeInsets.only(bottom: 10),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CardLoading(
                      margin: EdgeInsets.only(bottom: 18),
                      height: 100,
                      width: double.infinity,
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
