import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Login_screen/login_screen.dart';
import 'Screen_3.dart';


class Onscreen2 extends StatefulWidget{
  final Function(String)switchLanguage;
  Onscreen2({Key? key, required this.switchLanguage}) : super(key: key);
  @override
  State<Onscreen2> createState() => _Onscreen1State();
}

class _Onscreen1State extends State<Onscreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 35.0,top: 67,),
                  child: Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen(switchLanguage: widget.switchLanguage),),
                            );
                          },
                          child: Text('skip',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),))
                    ],
                  ),
                )
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 351,right: 25),
          //   child: Container(
          //     height: 233,
          //     width: 291,
          //     child: Image.network('https://s3-alpha-sig.figma.com/img/63b3/e003/b9a322d91e17e97a8a1583315ad4d33a?Expires=1687132800&Signature=XuSzhlrIuLwbJrvjUgXSE2TfOGiNqI~1tNceQuIePP4at4xPWAOgWyWyJM6~rRP2TsqunuX2fZWe9AtDvEYqen1c8HDKk2JYoAeAWYrQ2FyJPPhF2-YNj99uvNR3mrh65Yazu3aWV4V3lOdKbWLhK0OwOtO6DCNiKqWZNaHVegBtvi~FGw6WUG7BdXFKaaJpW8G4V~diAW-j~yFFQPxSyPTMzLHG5jqBZOdgVUKBgzCFLbB-eoiOowFQTlRH714pC7oy~rlpebCZ6aKPx9PI43yzRP42u4o6MLYLivlsVE0AjEMfFPxijGypUO1RDcHwrq2E2ys1skAfOODIpF-z7Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',fit: BoxFit.fill,),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 44,right: 44,bottom: 235),
            child: Text('Create an account',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 34,fontWeight: FontWeight.w500),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 44,right: 44,bottom: 158),
            child: Text('Sign up now to save your favorite items and access your order history.',textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF9B9B9B)),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,bottom: 62),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Onscreen3(switchLanguage: widget.switchLanguage)),
                );
              },
              child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black
                  ),
                  child: Center(child:Text('NEXT',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.white),),)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 31),
            child: Row(
              children: [
                Spacer(),
                Container(
                  height: 9,
                  width: 18,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.black38),
                ),
                SizedBox(width: 5,),
                Container(
                  height: 9,
                  width: 18,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.black),
                ),
                SizedBox(width: 5,),
                Container(
                  height: 9,
                  width: 18,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.black38),
                ),
                Spacer(),
              ],
            ),
          ),

        ],
      ),
    );
  }
}