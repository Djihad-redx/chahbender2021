import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Screens/Helpers/cart_card.dart';
import 'package:e_comerce/Screens/Helpers/check_out_card.dart';
import 'package:e_comerce/Screens/Helpers/default_button.dart';
import 'package:e_comerce/Utlitis/General.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'cartwidget.dart';

class FavPage extends StatefulWidget {

  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Expanded(
          child: Center(child: Text('No Itemes',style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold
          ),),),
        )

    );
  }
}


