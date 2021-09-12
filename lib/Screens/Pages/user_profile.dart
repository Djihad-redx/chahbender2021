import 'package:e_comerce/Models/DeleteAddress.dart';
import 'package:e_comerce/Models/Profile.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Utlitis/API.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'AddAddress.dart';

TextEditingController first_name_controller = TextEditingController();
TextEditingController last_name_controller = TextEditingController();
TextEditingController email_controller = TextEditingController();

class Profile extends StatefulWidget {
  BuildContext mycontext;
  bool isFrag;
  Profile({this.mycontext,this.isFrag});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  UserProfile profile = UserProfile();

  DeleteAddress deleteAddress = DeleteAddress();
  bool isloading;

  @override
  void initState() {
    setState(() {
      isloading = true;
    });
    Api.getUserProfileInfo().then((value) {
      profile = value;
      setState(() {
        isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

          body:
          widget.isFrag==true?
          isloading == false
              ? profile == null
                  ? Center(
                      child: Text('Please Login ..'),
                    )
                  :
                  //here the old design
                  SingleChildScrollView(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                        image: DecorationImage(
                                            image: ExactAssetImage(
                                                'assets/images/aa.png')),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .85,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'First Name  ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .85,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 1)),
                                    child: TextField(
                                        controller: first_name_controller,
                                        decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 15,
                                              bottom: 11,
                                              top: 11,
                                              right: 15),
                                        ))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .85,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Last Name  ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .85,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 1)),
                                    child: TextField(
                                        controller: last_name_controller,
                                        decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 15,
                                              bottom: 11,
                                              top: 11,
                                              right: 15),
                                        ))),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .85,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Email  ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .85,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 1)),
                                    child: TextField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        controller: email_controller,
                                        decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 15,
                                              bottom: 11,
                                              top: 11,
                                              right: 15),
                                        ))),
                              ),
                            ),

                            SizedBox(
                              height: MediaQuery.of(context).size.height * .08,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .85,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color(0xff0E516E),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'UPDATE',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: AlertDialog(
                                              title: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Text(
                                                  "UPDATE PASSWORD",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              actions: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Center(
                                                    child: InkWell(
                                                      onTap: () {
                                                        //make Api
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 50,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          color:
                                                          Color(0xff0E516E),
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                          'OK',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18),
                                                        )),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              20.0))),
                                              insetPadding:
                                                  EdgeInsets.all(10.0),
                                              content: Container(
                                                width: 480,
                                                child: new Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Center(
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'OLD PASSWORD',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10.0,
                                                              bottom: 5),
                                                      child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey,
                                                                  width: 1)),
                                                          child: TextField(
                                                              keyboardType:
                                                                  TextInputType
                                                                      .emailAddress,
                                                              controller:
                                                                  email_controller,
                                                              decoration:
                                                                  new InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                focusedBorder:
                                                                    InputBorder
                                                                        .none,
                                                                enabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                errorBorder:
                                                                    InputBorder
                                                                        .none,
                                                                disabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.only(
                                                                        left:
                                                                            15,
                                                                        bottom:
                                                                            11,
                                                                        top: 11,
                                                                        right:
                                                                            15),
                                                              ))),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              bottom: 5),
                                                      child: Center(
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'NEW PASSWORD  ',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10.0),
                                                      child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey,
                                                                  width: 1)),
                                                          child: TextField(
                                                              keyboardType:
                                                                  TextInputType
                                                                      .emailAddress,
                                                              controller:
                                                                  email_controller,
                                                              decoration:
                                                                  new InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                focusedBorder:
                                                                    InputBorder
                                                                        .none,
                                                                enabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                errorBorder:
                                                                    InputBorder
                                                                        .none,
                                                                disabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.only(
                                                                        left:
                                                                            15,
                                                                        bottom:
                                                                            11,
                                                                        top: 11,
                                                                        right:
                                                                            15),
                                                              ))),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10,
                                                              bottom: 5),
                                                      child: Center(
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'RE-NEW PASSWORD  ',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10.0),
                                                      child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey,
                                                                  width: 1)),
                                                          child: TextField(
                                                              keyboardType:
                                                                  TextInputType
                                                                      .emailAddress,
                                                              controller:
                                                                  email_controller,
                                                              decoration:
                                                                  new InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                focusedBorder:
                                                                    InputBorder
                                                                        .none,
                                                                enabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                errorBorder:
                                                                    InputBorder
                                                                        .none,
                                                                disabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsets.only(
                                                                        left:
                                                                            15,
                                                                        bottom:
                                                                            11,
                                                                        top: 11,
                                                                        right:
                                                                            15),
                                                              ))),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ));
                                      },
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .85,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Color(0xff0E516E),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'UPDATE PASSWORD',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    )),
                                  ),
                                ),
                              ),
                            ),
                            // Container()
                          ],
                        ),
                      ),
                    )

              : Loading():isloading == false
              ? profile == null
              ? Center(
            child: Text('Please Login ..'),
          )
              :
          //here the old design
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [HeaderApp(islogin: false,icon: Icons.arrow_back,Title: "Profile",c: this.context,),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black, width: 1),
                                image: DecorationImage(
                                    image: ExactAssetImage(
                                        'assets/images/aa.png')),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20))),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Container(
                          width:
                          MediaQuery.of(context).size.width * .85,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'First Name  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                            width:
                            MediaQuery.of(context).size.width * .85,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey, width: 1)),
                            child: TextField(
                                controller: first_name_controller,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 15,
                                      bottom: 11,
                                      top: 11,
                                      right: 15),
                                ))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Container(
                          width:
                          MediaQuery.of(context).size.width * .85,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Last Name  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                            width:
                            MediaQuery.of(context).size.width * .85,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey, width: 1)),
                            child: TextField(
                                controller: last_name_controller,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 15,
                                      bottom: 11,
                                      top: 11,
                                      right: 15),
                                ))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Container(
                          width:
                          MediaQuery.of(context).size.width * .85,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Email  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: Container(
                            width:
                            MediaQuery.of(context).size.width * .85,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey, width: 1)),
                            child: TextField(
                                keyboardType:
                                TextInputType.emailAddress,
                                controller: email_controller,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 15,
                                      bottom: 11,
                                      top: 11,
                                      right: 15),
                                ))),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * .08,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Container(
                          width:
                          MediaQuery.of(context).size.width * .85,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                            color: Color(0xff0E516E),
                          ),
                          child: Center(
                              child: Text(
                                'UPDATE',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width,
                                    child: AlertDialog(
                                      title: Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Text(
                                          "UPDATE PASSWORD",
                                          style: TextStyle(
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                      ),
                                      actions: [
                                        Padding(
                                          padding: const EdgeInsets.all(
                                              10.0),
                                          child: Center(
                                            child: InkWell(
                                              onTap: () {
                                                //make Api
                                                Navigator.of(context)
                                                    .pop();
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 50,
                                                decoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius
                                                          .circular(
                                                          10)),
                                                  color:
                                                  Color(0xff0E516E),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                      'OK',
                                                      style: TextStyle(
                                                          color:
                                                          Colors.white,
                                                          fontSize: 18),
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.all(
                                              Radius.circular(
                                                  20.0))),
                                      insetPadding:
                                      EdgeInsets.all(10.0),
                                      content: Container(
                                        width: 480,
                                        child: new Column(
                                          mainAxisSize:
                                          MainAxisSize.min,
                                          children: [
                                            Center(
                                              child: Container(
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      'OLD PASSWORD',
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 10.0,
                                                  bottom: 5),
                                              child: Container(
                                                  width:
                                                  double.infinity,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors
                                                              .grey,
                                                          width: 1)),
                                                  child: TextField(
                                                      keyboardType:
                                                      TextInputType
                                                          .emailAddress,
                                                      controller:
                                                      email_controller,
                                                      decoration:
                                                      new InputDecoration(
                                                        border:
                                                        InputBorder
                                                            .none,
                                                        focusedBorder:
                                                        InputBorder
                                                            .none,
                                                        enabledBorder:
                                                        InputBorder
                                                            .none,
                                                        errorBorder:
                                                        InputBorder
                                                            .none,
                                                        disabledBorder:
                                                        InputBorder
                                                            .none,
                                                        contentPadding:
                                                        EdgeInsets.only(
                                                            left:
                                                            15,
                                                            bottom:
                                                            11,
                                                            top: 11,
                                                            right:
                                                            15),
                                                      ))),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 10,
                                                  bottom: 5),
                                              child: Center(
                                                child: Container(
                                                  width:
                                                  double.infinity,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(
                                                        'NEW PASSWORD  ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold,
                                                            fontSize:
                                                            14),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  vertical: 10.0),
                                              child: Container(
                                                  width:
                                                  double.infinity,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors
                                                              .grey,
                                                          width: 1)),
                                                  child: TextField(
                                                      keyboardType:
                                                      TextInputType
                                                          .emailAddress,
                                                      controller:
                                                      email_controller,
                                                      decoration:
                                                      new InputDecoration(
                                                        border:
                                                        InputBorder
                                                            .none,
                                                        focusedBorder:
                                                        InputBorder
                                                            .none,
                                                        enabledBorder:
                                                        InputBorder
                                                            .none,
                                                        errorBorder:
                                                        InputBorder
                                                            .none,
                                                        disabledBorder:
                                                        InputBorder
                                                            .none,
                                                        contentPadding:
                                                        EdgeInsets.only(
                                                            left:
                                                            15,
                                                            bottom:
                                                            11,
                                                            top: 11,
                                                            right:
                                                            15),
                                                      ))),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 10,
                                                  bottom: 5),
                                              child: Center(
                                                child: Container(
                                                  width:
                                                  double.infinity,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(
                                                        'RE-NEW PASSWORD  ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold,
                                                            fontSize:
                                                            14),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  vertical: 10.0),
                                              child: Container(
                                                  width:
                                                  double.infinity,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors
                                                              .grey,
                                                          width: 1)),
                                                  child: TextField(
                                                      keyboardType:
                                                      TextInputType
                                                          .emailAddress,
                                                      controller:
                                                      email_controller,
                                                      decoration:
                                                      new InputDecoration(
                                                        border:
                                                        InputBorder
                                                            .none,
                                                        focusedBorder:
                                                        InputBorder
                                                            .none,
                                                        enabledBorder:
                                                        InputBorder
                                                            .none,
                                                        errorBorder:
                                                        InputBorder
                                                            .none,
                                                        disabledBorder:
                                                        InputBorder
                                                            .none,
                                                        contentPadding:
                                                        EdgeInsets.only(
                                                            left:
                                                            15,
                                                            bottom:
                                                            11,
                                                            top: 11,
                                                            right:
                                                            15),
                                                      ))),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
                              },
                            );
                          },
                          child: Container(
                            width:
                            MediaQuery.of(context).size.width * .85,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                              color: Color(0xff0E516E),
                            ),
                            child: Center(
                                child: Text(
                                  'UPDATE PASSWORD',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                          ),
                        ),
                      ),
                    ),
                    // Container()
                  ],
                ),
              ),
            ),
          )

              : Loading()),
    );
  }
}
