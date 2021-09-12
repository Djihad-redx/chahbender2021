import 'package:e_comerce/Screens/Pages/orderAccepted.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class CheckOut3 extends StatefulWidget {
  @override
  _CheckOut3State createState() => _CheckOut3State();
}

class _CheckOut3State extends State<CheckOut3> {
  bool check = true;
  bool A = true;
  bool B = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
              child: Text(
            'Checkout',
            style: TextStyle(
                color: Color(0xff0E516E),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          )),
        ),
        body: SafeArea(
          child: Column(
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
                        color: Color(0xff0E516E),
                        thickness: 2,
                      ),
                    ),
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 20),
                    children: [
                      Text(
                        'Summary',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.28,
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/np.png')),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.grey, width: 1.5),
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    width: MediaQuery.of(context).size.width *
                                        0.28,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 12, top: 8),
                                    child: Text('Product ' + index.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 12, top: 5),
                                    child: Text(
                                      '\$ 15',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.yellow[900],
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 22),
                        child: Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Divider(
                              color: Colors.grey,
                              thickness: 0.5,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12,bottom: 8),
                        child: Text(
                          'Shipping Address',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      ListTile(
                        title: Text(
                            '12, Bay brook, Sharps Rd, Keilor East, Melbourne, Australia'),
                        trailing: RoundCheckBox(
                          onTap: (select) {
                            setState(() {
                              select = !select;
                              B = select;
                            });
                          },
                          size: 30,
                          checkedColor: Color(0xff0E516E),
                        ),
                      )
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(top: 12),
                      //       child: Text(
                      //         'Shipping Address',
                      //         style: TextStyle(
                      //             fontWeight: FontWeight.bold, fontSize: 22),
                      //       ),
                      //     ),
                      //     RoundCheckBox(
                      //       onTap: (select) {
                      //         setState(() {
                      //           select = !select;
                      //           A = select;
                      //         });
                      //       },
                      //       size: 30,
                      //       checkedColor: Color(0xff0E516E),
                      //     ),
                      //   ],
                      // ),
                      // Container(
                      //     padding: EdgeInsets.only(top: 8),
                      //     width: MediaQuery.of(context).size.width * 0.8,
                      //     child: Text(
                      //       ,
                      //       style: TextStyle(
                      //           fontSize: 18, fontWeight: FontWeight.w400),
                      //     )),
                      ,
                      Padding(
                        padding: const EdgeInsets.only(right: 22, top: 10),
                        child: Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Divider(
                              color: Colors.grey,
                              thickness: 0.5,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          'Payments',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: ListTile(
                            leading: Image.asset('assets/images/master.png'),
                            title: Text('master card'),
                            subtitle: Text('**** **** **** 4562'),
                            trailing: RoundCheckBox(
                              onTap: (select) {
                                setState(() {
                                  select = !select;
                                  B = select;
                                });
                              },
                              size: 30,
                              checkedColor: Color(0xff0E516E),
                            ),
                          )
                          // Row(
                          //   children: [
                          //     Container(
                          //         width: MediaQuery.of(context).size.width * 0.15,
                          //         height: MediaQuery.of(context).size.height * 0.05,
                          //         child: Image.asset('assets/images/master.png')),
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           'Master Card',
                          //           style: TextStyle(color: Colors.grey[600]),
                          //         ),
                          //         Text('** ** ** 4543'),
                          //       ],
                          //     ),
                          //     SizedBox(
                          //       width: MediaQuery.of(context).size.width * 0.38,
                          //     ),
                          //     InkWell(
                          //       onTap: () {
                          //         setState(() {
                          //           B = !B;
                          //         });
                          //       },
                          //       child: Container(
                          //           height:
                          //               MediaQuery.of(context).size.height * 0.03,
                          //           width:
                          //               MediaQuery.of(context).size.width * 0.055,
                          //           decoration: BoxDecoration(
                          //               shape: BoxShape.circle,
                          //               color: B == true
                          //                   ? Color(0xFF0E516E)
                          //                   : Colors.grey),
                          //           child: B == true
                          //               ? Icon(Icons.check,
                          //                   size: 15, color: Colors.white)
                          //               : Container()),
                          //     )
                          //   ],
                          // ),
                          ),
                      SizedBox(
                        height: 30,
                      ),
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
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Color(0xff0E516E), width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60))),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>Accepted(),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60))),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
