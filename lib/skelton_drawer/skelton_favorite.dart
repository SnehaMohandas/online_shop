import 'package:card_loading/card_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SkeltonFav extends StatelessWidget {
  const SkeltonFav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(8),
            //  height: 150,
            // width: 130,
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return CardLoading(
                    height: 150,
                    //  width: 130,
                    margin: EdgeInsets.only(right: 10, bottom: 15, left: 10),
                  );
                }),
          ),
        )
      ],
    );
  }
}
