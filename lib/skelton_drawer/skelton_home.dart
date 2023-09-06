import 'package:card_loading/card_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SkeltonHome extends StatelessWidget {
  const SkeltonHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardLoading(
            height: 200,
            width: double.infinity,
          ),
          SizedBox(
            height: 25,
          ),
          CardLoading(
            height: 25,
            width: 100,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 180,
            // margin: EdgeInsets.all(8),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CardLoading(
                    margin: EdgeInsets.only(right: 18),
                    height: 330,
                    width: 140,
                  );
                }),
          ),
          SizedBox(
            height: 10,
          ),
          CardLoading(
            height: 25,
            width: 100,
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              height: 180,
              // margin: EdgeInsets.all(8),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CardLoading(
                      margin: EdgeInsets.only(right: 18),
                      height: 330,
                      width: 140,
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
