import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Loading extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black.withOpacity(0.2),
        child: Center(
          child: SizedBox(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              strokeWidth: 4,
            ),
          ),
        ));
  }
}