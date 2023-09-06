import 'package:flutter/material.dart';

import '../Amodule/bloc/List_adresses.dart';
import '../Amodule/model/List_adresses_model.dart';
import '../Anetwork/response.dart';

class Listaddress extends StatefulWidget{
  @override
  State<Listaddress> createState() => _ListaddressState();
}

//AddressListRepository
//Addresslist
//AddressListBloc
//addresslistDataStream

class _ListaddressState extends State<Listaddress> {
  late Addresslist addresslistt;
  late AddressListBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AddressListBloc();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: StreamBuilder<Response<Addresslist>>(
          stream: _bloc.addresslistDataStream,
        builder: (context, snapshot) {
      if (snapshot.hasData) {
        switch (snapshot.data!.status) {
          case Status.LOADING:
            return Center(
              child: CircularProgressIndicator(
                color: Colors.green[400],
              ),
            );
          case Status.SUCCESS:
            addresslistt = snapshot.data!.data;
            return Container(
              height: 200,
              width: 300,
              color: Colors.blue,
            );
          case Status.ERROR:
            return Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/error.png"),
                    fit: BoxFit.fill,
                  )),
            );
          case Status.COMPLETED:
            break;
        }
      }
      return Container(
        color: Colors.black45,
      );
        }
        )
    );
  }
}