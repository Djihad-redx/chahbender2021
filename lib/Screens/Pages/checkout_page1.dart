import 'package:e_comerce/Screens/Helpers/privatefield.dart';
import 'package:e_comerce/Screens/Pages/checkout_page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class Checkout1 extends StatefulWidget {
  @override
  _Checkout1State createState() => _Checkout1State();
}

class _Checkout1State extends State<Checkout1> {
  bool selected = false;
  int _counter = 0;
  TextEditingController street1_controller = TextEditingController();
  TextEditingController street2_controller = TextEditingController();
  TextEditingController city_controller = TextEditingController();
  TextEditingController state_controller = TextEditingController();
  TextEditingController country_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              color: Color(0xff0E516E),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        )),
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
      body: ListView(
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
                    color: Colors.grey[300],
                    thickness: 2,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16,
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
                  style: TextStyle(color: Colors.grey),
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
                    checkedColor: Color(0xff0E516E),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                    child: Text(
                      'Billing address is the same as delivery',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                    width: MediaQuery.of(context).size.width * .8),
              ],
            ),
          ),
          PrivateTextField(
            title: 'Street 1',
            mycontroller: street1_controller,
          ),
          PrivateTextField(
            title: 'Street 2',
            mycontroller: street2_controller,
          ),
          PrivateTextField(
            title: 'City 2',
            mycontroller: city_controller,
          ),
          Row(
            children: [
              Expanded(
                child: PrivateTextField(
                  title: 'State',
                  mycontroller: state_controller,
                ),
              ),
              Expanded(
                child: PrivateTextField(
                  title: 'Country',
                  mycontroller: country_controller,
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
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
                      border: Border.all(color: Color(0xff0E516E), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => Payments(),
                  ));
                },
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
                      color: Color(0xff0E516E),
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
