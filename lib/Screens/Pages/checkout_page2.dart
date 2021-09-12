import 'package:e_comerce/Screens/Pages/checkout_page3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masked_text/masked_text.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import 'checkout_page1.dart';

class Payments extends StatefulWidget {
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  bool paypal;
  bool card;
  bool wallet;
  bool selected;
  TextEditingController mymask=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mediaWid = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
         appBar: AppBar(
      // actions: [
      //   Icon(
      //     Icons.search,
      //     color: Colors.grey,
      //     size: 30,
      //   ),
      // ],
      title: Center(
      child: Text(
        'Checkout',
        style: TextStyle(
            color: Color(0xff0E516E), fontSize: 25, fontWeight: FontWeight.bold),
      )
      ),
    // leading: Padding(
    //   padding: const EdgeInsets.only(right: 15.0),
    //   child: Icon(
    //     Icons.menu,
    //     size: 30,
    //     color: Colors.grey,
    //   ),
    // ),
    backgroundColor: Colors.white,
    elevation: 0,
    ),
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Color(0xff0E516E), shape: BoxShape.circle),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 16,
                        child: CircleAvatar(
                          backgroundColor: Color(0xff0E516E),
                          radius: 9,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.31,
                      child: Divider(
                        color: Color(0xff0E516E),
                        thickness: 2,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Color(0xff0E516E),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 16,
                        child: CircleAvatar(
                          backgroundColor: Color(0xff0E516E),
                          radius: 9,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.31,
                      child: Divider(
                        color: Colors.grey[300],
                        thickness: 2,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.grey[300], shape: BoxShape.circle),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Address',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      'Payments',
                      style: TextStyle(color: Colors.black),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 6.0),
                      child: Text(
                        'Summary',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        paypal = true;
                        if (paypal == true) {
                          card = false;
                          wallet = false;
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(2),
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                        color: paypal == true ? Color(0xff0E516E) : Colors.white,
                        border: Border.all(color: Colors.grey,width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        FontAwesomeIcons.paypal,
                        size: 25,
                        color: paypal == true ? Colors.white : Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        card = true;
                        if (card == true) {
                          paypal = false;
                          wallet = false;
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(2),
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                        color: card == true ? Color(0xff0E516E) : Colors.white,
                        border: Border.all(color: Colors.grey,width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        FontAwesome.credit_card_alt,
                        size: 25,
                        color: card == true ? Colors.white : Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        wallet = true;
                        if (wallet == true) {
                          paypal = false;
                          card = false;
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(2),
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                        color: wallet == true ?Color(0xff0E516E): Colors.white,
                        border: Border.all(color: Colors.grey,width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Linecons.wallet,
                        size: 25,
                        color: wallet == true ? Colors.white : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Text(
                  'Name on Card',
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Enter a search term',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Text(
                  'Card Number',
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: TextField(
                  decoration: InputDecoration(suffixIcon: Image.asset('assets/images/master.png',width: 2,),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: 'Enter your card number'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: mediaWid,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: mediaWid * 0.40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Expiry Date',
                              style: TextStyle(color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20.0),
                            child: MaskedTextField(maskedTextFieldController: mymask,escapeCharacter: '#',
                              inputDecoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.grey)),
                                  hintText: '09/20'),mask: "##/##",maxLength:5,
                              keyboardType: TextInputType.number,

                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: mediaWid * 0.05,
                    ),
                    Container(
                      width: mediaWid * 0.40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'CVV',
                              style: TextStyle(color: Colors.grey),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.grey)),
                                  hintText: '467'),
                              keyboardType: TextInputType.number,
                              maxLength: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: RoundCheckBox(
                        onTap: (select) {
                          setState(() {
                            select = !select;
                            selected = select;
                          });
                        },
                        size: 30,
                        checkedColor:Color(0xff0E516E),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                        child: Text(
                          'Save this card Details',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        ),
                        width: MediaQuery.of(context).size.width * .8),
                  ],
                ),
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Checkout1(),));


                    },
                    child: Container(
                      width: 170,
                      height: 60,
                      child: Center(
                        child: Text(
                          'Back',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xff0E516E),width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(60))),
                    ),
                  ),
                  InkWell(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckOut3(),)); },
                    child: Container(
                      width: 170,
                      height: 60,
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color:Color(0xff0E516E),
                          borderRadius: BorderRadius.all(Radius.circular(60))),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}