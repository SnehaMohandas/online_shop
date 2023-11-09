import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class Skelton_drawer extends StatelessWidget {
  const Skelton_drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardLoading(
              height: 370,
              width: double.infinity,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardLoading(height: 13, width: 130),
                    SizedBox(
                      height: 5,
                    ),
                    CardLoading(
                      height: 13,
                      width: 130,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CardLoading(
                      height: 13,
                      width: 130,
                    )
                  ],
                ),
                CardLoading(
                  height: 50,
                  width: 100,
                )
              ],
            ),
            SizedBox(
              height: 13,
            ),
            CardLoading(
              height: 53,
              width: 150,
            ),
            SizedBox(
              height: 20,
            ),
            CardLoading(
              height: 55,
              width: double.infinity,
            ),
            SizedBox(
              height: 22,
            ),
            CardLoading(
              height: 14,
              width: double.infinity,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(right: 18, left: 18),
              height: 225,
              child: ListView.builder(
                  //scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CardLoading(
                      height: 400,
                      width: 125,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
