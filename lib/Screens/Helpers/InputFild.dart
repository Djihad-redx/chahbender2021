import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputFild extends StatelessWidget {
  InputFild({this.Title,this.Border,this.Controler});
  String Title;
  bool Border = true;
  final Controler;

  @override
  Widget build(BuildContext context) {
    return Container(
    
      padding: EdgeInsets.all(00),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


      TextField(
        controller: Controler,
        decoration: InputDecoration(

          hintText: Title,
          border: Border == false? InputBorder.none: null
        ),
      )
        ],
      ),
    );
  }
}
