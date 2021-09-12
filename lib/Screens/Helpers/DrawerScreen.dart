import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Pages/Login_Page.dart';
import 'package:e_comerce/Utlitis/API.dart';
import 'package:e_comerce/Utlitis/General.dart';
import 'package:e_comerce/traslations/Locale_Keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../main.dart';
import 'Loading.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isLoading = false;
  bool _enable = false;
@override
  void initState() {
print(General.Lang.toString());    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String dropdownNames;
    String dropdownNames2;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                HeaderApp(
                  c: context,
                  Title: LocaleKeys.Settings.tr(),
                  icon: Icons.arrow_back,islogin: false,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white),
                          child: ListView(
                            padding: EdgeInsets.all(25),
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 30),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      LocaleKeys.Notifications.tr(),
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    CupertinoSwitch(
                                      activeColor: Colors.red,
                                      value: _enable,
                                      onChanged: (value) {
                                        setState(() {
                                          _enable = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      LocaleKeys.Lang.tr(),
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 5, right: 5),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              spreadRadius: 2,
                                              blurRadius: 7,
                                              offset: Offset(1,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.white),
                                      child: DropdownButton<String>(

                                        underline: Container(),
                                        hint: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0),
                                          child: Container(width: 100,
                                            child: Text(General.Lang,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        value: dropdownNames,
                                        onChanged: (String newValue) {
                                          setState(() async {
                                            dropdownNames = newValue;
                                            General().setUserLang(newValue);
                                            if (newValue == "Arabic") {
                                              await context
                                                  .setLocale(Locale('ar'));
                                            } else {
                                              if(newValue=="Turkish"){
                                                await context
                                                    .setLocale(Locale('tr'));
                                              }else
                                                {
                                                  await context
                                                      .setLocale(Locale('en'));
                                                }
                                            }
                                          });
                                        },
                                        items: MyApp.langslist
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 4, right: 4),
                                                child: Text(value,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color:
                                                            Colors.blueGrey))),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Container(
                              //   margin: EdgeInsets.only(bottom: 20),
                              //   width: double.infinity,
                              //   child: Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Text(
                              //         LocaleKeys.Currency,
                              //         style: TextStyle(
                              //             fontSize: 17,
                              //             fontWeight: FontWeight.bold,
                              //             color: Colors.black),
                              //       ),
                              //       Container(
                              //         padding:
                              //             EdgeInsets.only(left: 5, right: 5),
                              //         decoration: BoxDecoration(
                              //             boxShadow: [
                              //               BoxShadow(
                              //                 color:
                              //                     Colors.grey.withOpacity(0.1),
                              //                 spreadRadius: 2,
                              //                 blurRadius: 7,
                              //                 offset: Offset(1,
                              //                     1), // changes position of shadow
                              //               ),
                              //             ],
                              //             borderRadius: BorderRadius.all(
                              //                 Radius.circular(5)),
                              //             color: Colors.white),
                              //         child: DropdownButton<String>(
                              //           underline: Container(),
                              //           hint: Padding(
                              //             padding: const EdgeInsets.only(
                              //                 right: 8.0),
                              //             child: Container(width: 100,
                              //               child: Text(
                              //                 General.Currenc,
                              //                 style: TextStyle(
                              //                     fontWeight: FontWeight.bold,
                              //                     color: Colors.black),
                              //               ),
                              //             ),
                              //           ),
                              //           value: dropdownNames2,
                              //           onChanged: (String newValue) {
                              //             setState(() {
                              //               dropdownNames2 = newValue;
                              //               General().setUserCurrenc(newValue);
                              //             });
                              //           },
                              //           items: MyApp.Currencylist.map<
                              //                   DropdownMenuItem<String>>(
                              //               (String value) {
                              //             return DropdownMenuItem<String>(
                              //               value: value,
                              //               child: Container(
                              //                   margin: EdgeInsets.only(
                              //                       left: 4, right: 4),
                              //                   child: Text(value,
                              //                       style: TextStyle(
                              //                           fontSize: 14,
                              //                           color:
                              //                               Colors.blueGrey))),
                              //             );
                              //           }).toList(),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),

                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: Text(
                                  LocaleKeys.Deactivate_Account.tr(),
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: Text(
                                  LocaleKeys.Privicy.tr(),
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: Text(
                                  LocaleKeys.About.tr(),
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: Text(
                                  'FAQs',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              // InkWell(
                              //   onTap: (){
                              //     if(General.token != ''){
                              //       setState(() {
                              //         isLoading =true;
                              //       });
                              //       Api.Logout().then((value) {
                              //         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(),));
                              //         setState(() {
                              //           isLoading=false;
                              //         });
                              //       });
                              //     }else{
                              //       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(),));
                              //     }
                              //   },
                              //   // child: Padding(
                              //   //   padding: const EdgeInsets.only(left: 60.0,right: 60),
                              //   //   child: Container(
                              //   //     height: 50,
                              //   //     decoration: BoxDecoration(
                              //   //         boxShadow: [
                              //   //           BoxShadow(
                              //   //             color: Colors.grey.withOpacity(0.1),
                              //   //             spreadRadius: 2,
                              //   //             blurRadius: 7,
                              //   //             offset: Offset(1, 1), // changes position of shadow
                              //   //           ),
                              //   //         ],
                              //   //         borderRadius: BorderRadius.all(Radius.circular(10)),
                              //   //         color: General.token != ''? Colors.red:Colors.green
                              //   //     ),
                              //   //     child: Center(child: Text(General.token != ''?'Sign-out':'Login',style: TextStyle(
                              //   //       fontWeight: FontWeight.bold,
                              //   //       fontSize: 20,
                              //   //       color: Colors.white
                              //   //     ),)),
                              //   //   ),
                              //   // ),
                              // )
                            ],
                          )),
                      isLoading == true ? Loading() : Container()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
