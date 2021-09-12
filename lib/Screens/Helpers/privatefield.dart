import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivateTextField extends StatelessWidget {
 TextEditingController mycontroller= TextEditingController();
String title;
PrivateTextField({ this.title,  this.mycontroller});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 15,bottom:35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: TextStyle(fontSize: 18,color: Colors.grey),),
          Container(
            child: TextField(style: TextStyle(fontSize: 18),controller:mycontroller ,),
            width: 300,
          )
        ],
      ),
    );
  }
}