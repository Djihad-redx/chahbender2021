import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comerce/Models/HomePageCat.dart';
import 'package:e_comerce/Models/ProductCat.dart' as aa;
import 'package:e_comerce/Screens/Helpers/DrawerScreen.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Screens/Pages/Cart_Page.dart';
import 'package:e_comerce/Utlitis/API.dart';
import 'package:e_comerce/Utlitis/General.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expandable_text/expandable_text.dart';

class AddToCartPage extends StatefulWidget {
  AddToCartPage({this.mycontext, this.result, this.resultoffer,this.isFromMain,this.resultApparel});
  bool isFromMain;

  BuildContext mycontext;
  aa.Product result;
  Offer resultoffer;
  Product resultApparel;

  @override
  _AddToCartPageState createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage> {
  int Quantity = 1;
  bool isloading = false;
  String name;
  String id;
  List<String> images;
  String description;
  String price;
  String Currancy;

  @override
  void initState() {

    if(widget.resultApparel != null){
      id = widget.resultApparel.id.toString();
      name = widget.resultApparel.name;
      description = "";
      price = widget.resultApparel.price.toString();
      Currancy = widget.resultApparel.currency;

    }else{
      id = widget.result.id.toString();
      name = widget.result.name;
      description = widget.result.description;
      price = widget.result.price.toString();
      Currancy = widget.result.price[0].currency.code;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        drawer: SettingScreen(),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  HeaderApp(
                    icon: Icons.arrow_back,
                    c: context,
                    Title: "Add to Cart",
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20, bottom: 5),
                                width: double.infinity,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8),
                                    child: Text(
                                    name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0, bottom: 5),
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    'Sale 12% (needs explanation)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.green),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.all(10),
                                  width: double.infinity,
                                  height: 350,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: widget.result == null
                                      ?Image(image: AssetImage('assets/images/aa.png')) :CarouselSlider(
                                      options: CarouselOptions(
                                          height: 400.0,
                                          enableInfiniteScroll: false,
                                          viewportFraction: 1,
                                          autoPlay: true),
                                      items:
                                           widget.result.productPicture
                                              .map((i) {
                                              return Builder(
                                                builder:
                                                    (BuildContext context) {
                                                  return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: i == null
                                                                ? AssetImage(
                                                                    'assets/images/rz.jpg')
                                                                : NetworkImage(
                                                                    i.url))),
                                                  );
                                                },
                                              );
                                            }).toList())),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 20, right: 20),
                                child: Container(
                                  width: double.infinity,
                                  child: Text(
                                    "Description:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 30, right: 30),
                                child: ExpandableText(
                                 description,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                  expandText: 'show more',
                                  linkStyle: TextStyle(fontSize: 16),
                                  collapseText: 'show less',
                                  maxLines: 2,
                                  linkColor: Colors.orange,
                                  animation: true,
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(
                              //       horizontal: 30, vertical: 10),
                              //   child: Container(
                              //     width: MediaQuery.of(context).size.width,
                              //     height: 50,
                              //     decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.all(
                              //           Radius.circular(50),
                              //         ),
                              //         border: Border.all(
                              //             color: Colors.grey, width: 2),
                              //         color: Colors.white),
                              //     child: Padding(
                              //       padding: const EdgeInsets.symmetric(
                              //           vertical: 8.0, horizontal: 14),
                              //       child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.spaceBetween,
                              //         children: [
                              //           Text(
                              //             'Size',
                              //             style: TextStyle(
                              //                 fontSize: 18,
                              //                 color: Colors.black),
                              //           ),
                              //           InkWell(
                              //             onTap: () {
                              //               showDialog(
                              //                 context: context,
                              //                 builder: (BuildContext context) {
                              //                   return Container(
                              //                       width:
                              //                           MediaQuery.of(context)
                              //                               .size
                              //                               .width,
                              //                       child: AlertDialog(
                              //                         title: Padding(
                              //                           padding:
                              //                               const EdgeInsets
                              //                                       .symmetric(
                              //                                   vertical: 8.0),
                              //                           child: Text(
                              //                             "Size",
                              //                             style: TextStyle(
                              //                                 fontWeight:
                              //                                     FontWeight
                              //                                         .bold),
                              //                           ),
                              //                         ),
                              //                         actions: [
                              //                           Padding(
                              //                             padding:
                              //                                 const EdgeInsets
                              //                                     .symmetric(vertical: 10.0,horizontal: 15),
                              //                             child: Center(
                              //                               child: InkWell(
                              //                                 onTap: () {
                              //                                   //make Api
                              //                                   Navigator.of(
                              //                                           context)
                              //                                       .pop();
                              //                                 },
                              //                                 child: Container(
                              //                                   width: double
                              //                                       .infinity,
                              //                                   height: 50,
                              //                                   decoration:
                              //                                       BoxDecoration(
                              //                                     borderRadius:
                              //                                         BorderRadius.all(
                              //                                             Radius.circular(
                              //                                                 10)),
                              //                                     color: Color(
                              //                                         0xFF0E516E),
                              //                                   ),
                              //                                   child: Center(
                              //                                       child: Text(
                              //                                     'OK',
                              //                                     style: TextStyle(
                              //                                         color: Colors
                              //                                             .white,
                              //                                         fontSize:
                              //                                             18),
                              //                                   )),
                              //                                 ),
                              //                               ),
                              //                             ),
                              //                           ),
                              //                         ],
                              //                         shape: RoundedRectangleBorder(
                              //                             borderRadius:
                              //                                 BorderRadius.all(
                              //                                     Radius.circular(
                              //                                         20.0))),
                              //                         insetPadding:
                              //                             EdgeInsets.all(10.0),
                              //                         content: Container(
                              //                           width: 480,
                              //                           child: new Column(
                              //                             mainAxisSize:
                              //                                 MainAxisSize.min,
                              //                             children: [
                              //                               Container(height: MediaQuery.of(context).size.height*.30,
                              //                                 child: ListView.builder(
                              //                                   itemBuilder:
                              //                                       (context,
                              //                                               index) =>
                              //                                           Padding(
                              //                                     padding: const EdgeInsets
                              //                                             .symmetric(
                              //                                         vertical:
                              //                                             10),
                              //                                     child:
                              //                                         Container(
                              //                                       width: MediaQuery.of(
                              //                                               context)
                              //                                           .size
                              //                                           .width,
                              //                                       height: 50,
                              //                                       decoration:
                              //                                           BoxDecoration(
                              //                                               borderRadius: BorderRadius
                              //                                                   .all(
                              //                                                 Radius.circular(15),
                              //                                               ),
                              //                                               border: Border.all(
                              //                                                   color: Colors.grey,
                              //                                                   width: 2),
                              //                                               color: Colors.white),
                              //                                       child:
                              //                                           Padding(
                              //                                         padding: const EdgeInsets
                              //                                                 .symmetric(
                              //                                             vertical:
                              //                                                 8.0,
                              //                                             horizontal:
                              //                                                 14),
                              //                                         child: Row(
                              //                                           mainAxisAlignment:
                              //                                               MainAxisAlignment
                              //                                                   .spaceBetween,
                              //                                           children: [
                              //                                             Text(
                              //                                               '10',
                              //                                               style: TextStyle(
                              //                                                   fontSize: 18,
                              //                                                   color: Colors.black,fontWeight: FontWeight.bold),
                              //                                             ),
                              //                                             Row(
                              //                                                 children: [
                              //                                             Text(
                              //                                               '+ 30 USD',
                              //                                               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              //                                             ),
                              //                                             SizedBox(
                              //                                               width: 12,
                              //                                             ),
                              //                                             Icon(
                              //                                               Icons.radio_button_checked,
                              //                                               size: 20,
                              //                                               color: Colors.orange,
                              //                                             )
                              //                                                 ],
                              //                                               )
                              //                                           ],
                              //                                         ),
                              //                                       ),
                              //                                     ),
                              //                                   ),itemCount: 5,
                              //                                 ),
                              //                               )
                              //                             ],
                              //                           ),
                              //                         ),
                              //                       ));
                              //                 },
                              //               );
                              //             },
                              //             child: Row(
                              //               children: [
                              //                 Text(
                              //                   'M',
                              //                   style: TextStyle(
                              //                       fontSize: 18,
                              //                       fontWeight:
                              //                           FontWeight.bold),
                              //                 ),
                              //                 SizedBox(
                              //                   width: 12,
                              //                 ),
                              //                 Icon(
                              //                   Icons.arrow_forward_ios,
                              //                   size: 20,
                              //                   color: Colors.black,
                              //                 )
                              //               ],
                              //             ),
                              //           )
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(
                              //       horizontal: 30, vertical: 10),
                              //   child: Container(
                              //     width: MediaQuery.of(context).size.width,
                              //     height: 50,
                              //     decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.all(
                              //           Radius.circular(50),
                              //         ),
                              //         border: Border.all(
                              //             color: Colors.grey, width: 2),
                              //         color: Colors.white),
                              //     child: Padding(
                              //       padding: const EdgeInsets.symmetric(
                              //           vertical: 8.0, horizontal: 14),
                              //       child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.spaceBetween,
                              //         children: [
                              //           Text(
                              //             'Color',
                              //             style: TextStyle(
                              //                 fontSize: 18,
                              //                 color: Colors.black),
                              //           ),
                              //           Row(
                              //             children: [
                              //               Container(
                              //                 width: 30,
                              //                 height: 30,
                              //                 decoration: BoxDecoration(
                              //                   borderRadius: BorderRadius.all(
                              //                       Radius.circular(5)),
                              //                   color: Colors.lightGreenAccent,
                              //                 ),
                              //               ),
                              //               SizedBox(
                              //                 width: 12,
                              //               ),
                              //               Icon(
                              //                 Icons.arrow_forward_ios,
                              //                 size: 20,
                              //                 color: Colors.black,
                              //               )
                              //             ],
                              //           )
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 20, 15),
                          child: Text(
                            widget.result != null
                                ? '${widget.result.price[0].priceNow*Quantity} ${widget.result.price[0].currency.code}'
                                : '${widget.resultApparel.price}${widget.resultApparel.currency}',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            widget.isFromMain == true? Container():InkWell(
                              onTap: () async {
                              if(widget.resultApparel != null){
                                if(General.token != ""){
                                  setState(() {
                                    isloading = true;
                                  });
                                    Api.AddToCart(id,Quantity,widget.resultApparel.price.toInt(),'USD').then((value) {
                                      print(value);
                                      print('add to server');
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPagep(),));
                                      setState(() {
                                        isloading = false;
                                      });
                                    });
                                }else{
                                  widget.result.name = "name";
                                  widget.result.description = "";
                                  widget.result.id = id ;
                                  widget.result.price[0].priceNow = int.parse(price) ;
                                  widget.result.productPicture[0].url = widget.resultApparel.picture[0].url;
                                  General().setProductincart(widget.result, Quantity).then((value) {
                                    print("added to local");
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPagep(),));
                                  });
                                }
                              }else{
                                if(General.token != ""){
                                  setState(() {
                                    isloading = true;
                                  });
                                  Api.AddToCart(widget.result.productId,Quantity,widget.result.price[0].priceNow,widget.result.price[0].currency.code).then((value) {
                                    print(value);
                                    print('add to server');
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPagep(),));
                                    setState(() {
                                      isloading = false;
                                    });
                                  });
                                }else{
                                  General().setProductincart(widget.result, Quantity).then((value) {
                                    print("added to local");
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPagep(),));
                                  });
                                }
                              }
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 20, bottom: 20),
                                height: 60,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35)),
                                    color: Color(0xFF0E516E)),
                                child: Center(
                                  child: Text(
                                    'ADD TO CART',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      //fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ),
                           widget.isFromMain == true?Container(): Container(
                              margin: EdgeInsets.only(
                                  left: 20, bottom: 25, right: 20),
                              height: 40,
                              width: 130,
                              // color: Colors.red,
                              child: Center(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (Quantity < 10) {
                                              Quantity++;
                                            }

                                          });
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  bottomLeft:
                                                      Radius.circular(20))),
                                          child: Icon(
                                            FontAwesomeIcons.plus,
                                            size: 17,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        color: Colors.grey.shade300,
                                        child: Center(
                                          child: Text(
                                            Quantity.toString(),
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (Quantity > 1) {
                                              Quantity--;
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20)),
                                              color: Colors.grey.shade300),
                                          child: Icon(
                                            FontAwesomeIcons.minus,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              isloading == true ? Expanded(child: Loading()) : Container()
            ],
          ),
        ),
      ),
    );
  }
}
