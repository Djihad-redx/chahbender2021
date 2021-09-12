import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyOrderPage extends StatefulWidget {
  bool isFrag;
  MyOrderPage({this.isFrag});
  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body:
            widget.isFrag==true?
      Center(
        child: Text('MyOrder Page',style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold
        ),),
      ):SafeArea(
        child: Column(children: [
          HeaderApp(c: this.context,Title: "Order Page",islogin: false,icon: Icons.arrow_back,),
          Center(
          child: Text('MyOrder Page',style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold
          ),),
        )
          ,],
        ),
      )
    );
  }
}
