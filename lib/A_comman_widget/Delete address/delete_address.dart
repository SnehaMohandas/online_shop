import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:wayelle/Anetwork/api.dart';

class DeleteIcon extends StatefulWidget {
  // const FavoriteToggleIcon({required Key key, required this.productW_id}) : super(key: key);
  // final String productW_id;

  @override
  _FavoriteToggleIconState createState() => _FavoriteToggleIconState();
}

class _FavoriteToggleIconState extends State<DeleteIcon> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          setState(() {
            _fetchJobs();
          });
        },
        //color: Color(0xFFDADADA),size: 16,
        child: Icon(
          favorite ? Icons.delete : Icons.delete_outline,
          color: favorite ? Colors.red : Colors.black,
          size: 24,
        ),
      ),
    );
  }

  Future _fetchJobs() async {
    print("berin");
    // print('cutomerid09==${CustomerId}');
    // print("cus090${Cus_id}");

    // String customerId = Cus_id == null?CustomerId:Cus_id;
    // if(customerId == null){
    //   Fluttertoast.showToast(
    //     msg: "Please Login in to your account",
    //     gravity: ToastGravity.BOTTOM,
    //     toastLength: Toast.LENGTH_SHORT,
    //   );
    // }
    // print("customer===>..${customerId}");
    var response = await http.post(
        Uri.parse(
            'https://globosoft.co.uk/myFitBuddy/api/deleteaddress/key/123456789'),
        body: {'customer_id': customer_id, 'password': '42'});
    if (response.statusCode == 200) {
      print(' =${response.body}');
      setState(() {
        favorite = !favorite;
      });

      Fluttertoast.showToast(
        msg: "Address deleted",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
      );
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
