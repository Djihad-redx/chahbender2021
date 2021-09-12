import 'package:e_comerce/Screens/Pages/Cart_Page.dart';
import 'package:e_comerce/Screens/Pages/Login_Page.dart';
import 'package:e_comerce/Screens/Pages/Main_Page.dart';
import 'package:e_comerce/Utlitis/General.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderApp extends StatefulWidget {
  HeaderApp({this.Title, this.c, this.icon, this.islogin});

  String Title;
  bool islogin;
  final BuildContext c;
  IconData icon;

  @override
  _HeaderAppState createState() => _HeaderAppState();
}

class _HeaderAppState extends State<HeaderApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        widget.icon == Icons.arrow_back ||
                                widget.icon == Icons.menu_open_sharp
                            ? Navigator.of(widget.c).pop()
                            : Scaffold.of(context).openDrawer();
                      },
                      child: Icon(
                        widget.icon,
                        size: 25,
                      )),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      widget.Title,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        if (widget.islogin == true) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MainPage(),
                          ));
                        } else {
                          if (General.token == "ذ") {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CartPagep(),
                            ));
                          }
                        }
                      },
                      child: widget.islogin == true
                          ? Text(
                              'Skip',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          : Icon(
                              Icons.shopping_cart,
                              size: 28,
                            )),
                )
              ],
            ),
          ),
          Container(width: double.infinity, child: Divider())
        ],
      ),
    );
  }
}
