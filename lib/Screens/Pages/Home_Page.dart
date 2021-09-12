import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comerce/Models/HomePageCat.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Utlitis/API.dart';
import 'package:e_comerce/traslations/Locale_Keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Add_To_Cart_Page.dart';
import 'CategoryAll.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  void changepage() {
    index++;
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  void changepageback() {
    index--;
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  static List<dynamic> resDailyoffers = <dynamic>[];
  static List<dynamic> resSeasonaloffers = <dynamic>[];
  static List<dynamic> resmenuCategory = <dynamic>[];
  static List<dynamic> resListCategory = <dynamic>[];
  static List<MenuCategory> resultMenuCategory = <MenuCategory>[];
  static List<Offer> result = <Offer>[];
  static List<ListCategoryOfProduct> resultlistCategoryOfProducts =
      <ListCategoryOfProduct>[];
 static List<String> resultImgs = <String>[];
 static List<String> resultImgMenu = <String>[];
 static List<Offer> resultseassional = <Offer>[];
  bool isloading = false;
  void initState() {

    if (result.isEmpty && resultseassional.isEmpty && resultMenuCategory.isEmpty ) {
      setState(() {
        isloading = true;
      });
      Api.LoadCategories().then((value) {
        resDailyoffers = value['dailyOffers'];
        resSeasonaloffers = value['seasonalOffers'];
        resmenuCategory = value["menuCategory"];
        resListCategory = value["listCategoryOfProducts"];
        // resultImgMenu.add(
        //     resultMenuCategory[index]
        //         .locals[0]
        //         .picture
        //         .url);
        for (var x in resDailyoffers) {
          Offer item = new Offer();
          item = Offer.fromJson(x);
          result.add(item);
        }
        for (var x in resSeasonaloffers) {
          Offer item = new Offer();
          item = Offer.fromJson(x);
          resultseassional.add(item);
          for (var y in item.picture) {
            resultImgs.add(y.url);
          }
        }
        for (var x in resmenuCategory) {
          MenuCategory item = new MenuCategory();
          item = MenuCategory.fromJson(x);
          resultMenuCategory.add(item);
        }
        for (var x in resListCategory) {
          ListCategoryOfProduct item = new ListCategoryOfProduct();
          item = ListCategoryOfProduct.fromJson(x);
          resultlistCategoryOfProducts.add(item);
          print('-------------------------------------------------------');
          //  print(resultlistCategoryOfProducts[1].products[0][0].picture[0].url)  ;
          //la suite

          resultMenuCategory[0].isSelected = true;
          resultImgMenu.add(
              resultMenuCategory[0]
                  .locals[0]
                  .picture
                  .url);
        }
        setState(() {
          isloading = false;
        });
      });
      print(resultImgs.toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: EdgeInsets.only(left: 4, right: 4),
      child:  isloading == true ? Loading() :CustomScrollView(
       slivers:[
       SliverToBoxAdapter(
         child: Container(
             height: 70,
             child: ListView.builder(
              // padding: EdgeInsets.all(0),
               scrollDirection: Axis.horizontal,
               itemCount: resultMenuCategory.length,
               itemBuilder: (context, index) {
                 return InkWell(
                   onTap: () {
                     setState(() {
                       for (int i = 0;
                       i < resultMenuCategory.length + -1;
                       i++) {
                         if (i == index) {
                           setState(() {
                             resultMenuCategory[i].isSelected =
                             true;
                           });
                         } else {
                           resultMenuCategory[i].isSelected =
                           false;
                         }
                       }
                       for (int i = 0;
                       i <
                           resultMenuCategory[index]
                               .locals
                               .length;
                       i++) {
                         resultImgMenu.add(
                             resultMenuCategory[index]
                                 .locals[i]
                                 .picture
                                 .url);
                       }
                     });
                   },
                   child: Container(
                     padding: EdgeInsets.only(right: 10,top: 10,bottom: 10,left: 4),
                     margin: EdgeInsets.only(right: 10,top: 10,bottom: 10),
                     decoration: BoxDecoration(
                       borderRadius:
                       BorderRadius.all(Radius.circular(10)),
                     ),
                     child: Center(
                       child: Text(
                         resultMenuCategory[index].name,
                         style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.bold,
                           color: resultMenuCategory[index]
                               .isSelected ==
                               true
                               ? Colors.black
                               : Colors.grey,
                         ),
                       ),
                     ),
                   ),
                 );
               },
             )),
       ),
       SliverToBoxAdapter(
         child: Container(
           width: MediaQuery.of(context).size.width - 20,
           height: 200,
           child: CarouselSlider(
             options: CarouselOptions(
               enableInfiniteScroll: false,
               viewportFraction: 1,
               onPageChanged: (inx, reason) {},
             ),
             items: resultImgMenu.map((i) {
               return Builder(
                 builder: (BuildContext context) {
                   return Container(
                     margin: EdgeInsets.only(top: 10, bottom: 10),
                     width: MediaQuery.of(context).size.width - 2,
                     height: 200,
                     decoration: BoxDecoration(

                       color: Colors.white,
                       borderRadius:
                       BorderRadius.all(Radius.circular(15)),
                       image: DecorationImage(
                           image: NetworkImage(i),
                           fit: BoxFit.contain),
                     ),
                     child: Center(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(Icons.shopping_bag_outlined,size: 55,),
                           Padding(
                             padding: const EdgeInsets.all(12.0),
                             child: Text('No Products',style: TextStyle(
                              fontSize: 18
                             ),),
                           )
                         ],
                       ),
                     ),
                   );
                 },
               );
             }).toList(),
           ),
         ),
       ),
//------------------------Dayoffers----------------------------------------------
//        SliverToBoxAdapter(
//          child: Column(
//            children: [
//              Padding(
//                padding: const EdgeInsets.only(top: 5.0, bottom: 5),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: [
//                    InkWell(
//                      onTap: () {},
//                      child: Text(
//                        'Day Offers',
//                        style: TextStyle(
//                            color: Colors.grey,
//                            fontWeight: FontWeight.bold,
//                            fontSize: 16),
//                      ),
//                    ),
//                    // InkWell(
//                    //   onTap: () {},
//                    //   child: Text(
//                    //     'Show All',
//                    //     style: TextStyle(
//                    //         color: Colors.grey,
//                    //         fontWeight: FontWeight.bold,
//                    //         fontSize: 17),
//                    //   ),
//                    // ),
//                  ],
//                ),
//              ),
//              // Container(
//              //   width: double.infinity,
//              //    height: 230,
//              //   child: ListView.builder(
//              //     physics: ClampingScrollPhysics(),
//              //     scrollDirection: Axis.horizontal,
//              //     itemCount: result.length,
//              //     itemBuilder: (context, index) {
//              //       return Stack(
//              //         children: [
//              //           Padding(
//              //             padding: const EdgeInsets.only(bottom: 15),
//              //             child: Container(
//              //               width: 135,
//              //               child: Column(
//              //                 children: [
//              //                   InkWell(
//              //                     onTap: (){
//              //                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddToCartPage(mycontext: context,resultoffer: result[index], ),));
//              //                     },
//              //                     child: Container(
//              //                       margin: EdgeInsets.all(10),
//              //                       height: MediaQuery.of(context)
//              //                           .size
//              //                           .height *
//              //                           .1,
//              //                       decoration: BoxDecoration(
//              //                         borderRadius: BorderRadius.all(
//              //                             Radius.circular(10)),
//              //                         color: Colors.grey.shade200,
//              //                         image: DecorationImage(
//              //                             image: AssetImage(
//              //                                 'assets/images/rz.jpg'),
//              //                             fit: BoxFit.cover),
//              //                       ),
//              //                     ),
//              //                   ),
//              //                   // Container(
//              //                   //   width: double.infinity,
//              //                   //   child: Padding(
//              //                   //     padding: const EdgeInsets.only(left: 15),
//              //                   //     child: Text(
//              //                   //       'sepette 12% indirem',
//              //                   //       style: TextStyle(
//              //                   //         fontSize: 10,
//              //                   //         color: Colors.green,
//              //                   //       ),
//              //                   //       textAlign: TextAlign.left,
//              //                   //     ),
//              //                   //   ),
//              //                   // ),
//              //                   Container(
//              //                     width: double.infinity,
//              //                     child: Padding(
//              //                       padding:
//              //                       const EdgeInsets.only(left: 15),
//              //                       child: Text(
//              //                         '${result[index].currency} ${result[index].price.toDouble()}',
//              //                         style: TextStyle(
//              //                           fontSize: 13,
//              //                           color: Colors.red,
//              //                         ),
//              //                         textAlign: TextAlign.left,
//              //                       ),
//              //                     ),
//              //                   ),
//              //
//              //                   Container(
//              //                     width: double.infinity,
//              //                     child: Padding(
//              //                       padding:
//              //                       const EdgeInsets.only(left: 15),
//              //                       child: Text(
//              //                         result[index].name,
//              //                         style: TextStyle(
//              //                           fontSize: 12,
//              //                           color: Colors.black,
//              //                         ),
//              //                         textAlign: TextAlign.left,
//              //                       ),
//              //                     ),
//              //                   )
//              //                 ],
//              //               ),
//              //             ),
//              //           ),
//              //           // Positioned(
//              //           //   right: 10,
//              //           //   top: 10,
//              //           //   child: Column(
//              //           //     children: [
//              //           //       Padding(
//              //           //         padding: const EdgeInsets.all(8.0),
//              //           //         child: Container(
//              //           //           height: 30,
//              //           //           width: 30,
//              //           //           decoration: BoxDecoration(
//              //           //             color: Color(0xff0E516E),
//              //           //             borderRadius: BorderRadius.all(Radius.circular(8))
//              //           //           ),
//              //           //           child: Center(
//              //           //             child: Icon(Icons.favorite_border,color: Colors.white,size: 15,),
//              //           //           ),
//              //           //         ),
//              //           //       ),
//              //           //       Container(
//              //           //         height: 30,
//              //           //         width: 30,
//              //           //         decoration: BoxDecoration(
//              //           //             color: Colors.orangeAccent,
//              //           //             borderRadius: BorderRadius.all(Radius.circular(8))
//              //           //         ),
//              //           //         child: Center(
//              //           //           child: Icon(Icons.add_shopping_cart,color: Colors.white,size: 20,),
//              //           //         ),
//              //           //       ),
//              //           //     ],
//              //           //   ),
//              //           // )
//              //         ],
//              //       );
//              //     },
//              //   ),
//              // )
//            ],
//          ),
//        ),
//----------------------------------------------------------------------------------
       SliverToBoxAdapter(
         child: Padding(
           padding: const EdgeInsets.only(top: 5.0, bottom: 5),
           child: InkWell(
             onTap: () {},
             child: Text(
               'Our Advantages',
               style: TextStyle(
                   color: Colors.grey,
                   fontWeight: FontWeight.bold,
                   fontSize: 17),
             ),
           ),
         ),
       ),

       SliverToBoxAdapter(
         child: Padding(
           padding: const EdgeInsets.only(bottom: 10.0),
           child: Row(
             children: [
               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     children: [
                       Container(
                         height: 100,
                         decoration: BoxDecoration(
                             image: DecorationImage(
                                 image: AssetImage('assets/images/np.png')
                             ),
                             borderRadius: BorderRadius.all(
                                 Radius.circular(10)),
                             color: Colors.grey.shade200),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text(
                           "Advantage 01",
                           style: TextStyle(
                               color: Colors.grey,
                               fontSize: 12,
                               fontWeight: FontWeight.bold),
                         ),
                       )
                     ],
                   ),
                 ),
               ),
               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     children: [
                       Container(
                         height: 100,
                         decoration: BoxDecoration(
                             image: DecorationImage(
                                 image: AssetImage('assets/images/np.png')
                             ),
                             borderRadius: BorderRadius.all(
                                 Radius.circular(10)),
                             color: Colors.grey.shade200),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text(
                           "Advantage 02",
                           style: TextStyle(
                               color: Colors.grey,
                               fontSize: 12,
                               fontWeight: FontWeight.bold),
                         ),
                       )
                     ],
                   ),
                 ),
               ),
               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     children: [
                       Container(
                         height: 100,
                         decoration: BoxDecoration(
                             image: DecorationImage(
                                 image: AssetImage('assets/images/np.png')
                             ),
                             borderRadius: BorderRadius.all(
                                 Radius.circular(10)),
                             color: Colors.grey.shade200),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text(
                           "Advantage 03",
                           style: TextStyle(
                               color: Colors.grey,
                               fontSize: 12,
                               fontWeight: FontWeight.bold),
                         ),
                       )
                     ],
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),
       SliverToBoxAdapter(
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.only(top: 5.0, bottom: 5),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   InkWell(
                     onTap: () {},
                     child: Text(
                       'seasonal Offers',
                       style: TextStyle(
                           color: Colors.grey,
                           fontWeight: FontWeight.bold,
                           fontSize: 16),
                     ),
                   ),
                   // InkWell(
                   //   onTap: () {},
                   //   child: Text(
                   //     'Show All',
                   //     style: TextStyle(
                   //         color: Colors.grey,
                   //         fontWeight: FontWeight.bold,
                   //         fontSize: 16),
                   //   ),
                   // ),
                 ],
               ),
             ),
             Container(
               width: MediaQuery.of(context).size.width,
               height: 230,
               child: PageView.builder(
                 itemCount: resultseassional.length,
                 controller: pageController,
                 itemBuilder:
                     (BuildContext context, int itemIndex) {
                   return Container(
                     width: MediaQuery.of(context).size.width - 20,
                     child: CarouselSlider(
                       options: CarouselOptions(
                         autoPlay: true,
                         // onScrolled: (inx){
                         //
                         // },
                         enableInfiniteScroll: false,
                         viewportFraction: 1,
                         onPageChanged: (inx, reason) {
                           if (inx == resultImgs.length - 1) {
                             setState(() {
                               changepage();
                             });
                           }
                         },
                       ),
                       items: resultImgs.map((i) {
                         return Builder(
                           builder: (BuildContext context) {
                             return Container(
                               margin: EdgeInsets.only(
                                   top: 10, bottom: 10),
                               width: MediaQuery.of(context)
                                   .size
                                   .width -
                                   2,
                               height: 200,
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.all(
                                     Radius.circular(15)),
                                 image: DecorationImage(
                                     image: NetworkImage(i),
                                     fit: BoxFit.contain),
                               ),
                             );
                           },
                         );
                       }).toList(),
                     ),
                   );
                 },
               ),
             )
//-----------------------------------------------------------------
           ],
         ),
       ),

         SliverList(delegate: SliverChildListDelegate(
           List.generate(resultlistCategoryOfProducts.length, (index) {
             return resultlistCategoryOfProducts[index].products.length>0?
             Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(
                       top: 5.0, bottom: 5),
                   child: Row(
                     mainAxisAlignment:
                     MainAxisAlignment.spaceBetween,
                     children: [
                       InkWell(
                         onTap: () {},
                         child: Text(
                           resultlistCategoryOfProducts[index]
                               .name
                               .toString(),
                           style: TextStyle(
                               color: Colors.grey,
                               fontWeight: FontWeight.bold,
                               fontSize: 16),
                         ),
                       ),

                     ],
                   ),
                 ),
                 Column(
                   children: [
                     Container(
                       width: double.infinity,height:230,
                       child: ListView.builder(
                         physics: ClampingScrollPhysics(),
                         scrollDirection: Axis.horizontal,
                         itemCount:
                         resultlistCategoryOfProducts[index]
                             .products
                             .length,
                         itemBuilder: (context, index2) {
                           return  InkWell(
                             onTap: (){
                               Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddToCartPage(isFromMain: true,resultApparel:  resultlistCategoryOfProducts[index].products[index2][0],),));
                             },
                             child: Padding(
                               padding:
                               const EdgeInsets.only(bottom: 15),
                               child: Container(
                                 width: 200,
                                 height: 500,
                                 child: Column(
                                   children: [
                                     Container(
                                       height: 160,
                                       child: CarouselSlider(
                                         options: CarouselOptions(
                                           // onScrolled: (inx){
                                           //
                                           // },
                                           enableInfiniteScroll:
                                           false,
                                           viewportFraction: 1,
                                         ),
                                         items:
                                         resultlistCategoryOfProducts[
                                         index]
                                             .products[index2][0]
                                             .picture
                                             .map((i) {
                                           return Builder(
                                             builder: (BuildContext
                                             context) {
                                               return Stack(
                                                 children: [
                                                   Container(
                                                     margin:
                                                     EdgeInsets.only(
                                                         top: 10,
                                                         bottom: 10),
                                                     width: MediaQuery.of(
                                                         context)
                                                         .size
                                                         .width -
                                                         2,
                                                     height: 270,
                                                     decoration:
                                                     BoxDecoration(
                                                       color:
                                                       Colors.white,
                                                       borderRadius: BorderRadius
                                                           .all(Radius
                                                           .circular(
                                                           15)),
                                                       image: DecorationImage(
                                                           image:
                                                           NetworkImage(i
                                                               .url),
                                                           fit: BoxFit
                                                               .contain),
                                                     ),
                                                   ),
                                                   // Positioned(
                                                   //   right: 10,
                                                   //   top: 10,
                                                   //   child: Column(
                                                   //     children: [
                                                   //       InkWell(
                                                   //         onTap: (){
                                                   //
                                                   //
                                                   //         },
                                                   //         child: Padding(
                                                   //           padding: const EdgeInsets.all(8.0),
                                                   //           child: Container(
                                                   //             height: 40,
                                                   //             width: 40,
                                                   //             decoration: BoxDecoration(
                                                   //                 color: Color(0xff0E516E),
                                                   //                 borderRadius: BorderRadius.all(Radius.circular(8))
                                                   //             ),
                                                   //             child: Center(
                                                   //               child: Icon(Icons.favorite_border,color: Colors.white,),
                                                   //             ),
                                                   //           ),
                                                   //         ),
                                                   //       ),
                                                   //       InkWell(
                                                   //         onTap: (){
                                                   //
                                                   //         },
                                                   //         child: Container(
                                                   //           height: 40,
                                                   //           width: 40,
                                                   //           decoration: BoxDecoration(
                                                   //               color: Colors.orangeAccent,
                                                   //               borderRadius: BorderRadius.all(Radius.circular(8))
                                                   //           ),
                                                   //           child: Center(
                                                   //             child: Icon(Icons.add_shopping_cart,color: Colors.white,),
                                                   //           ),
                                                   //         ),
                                                   //       ),
                                                   //     ],
                                                   //   ),
                                                   // )
                                                 ],
                                               );
                                             },
                                           );
                                         }).toList(),
                                       ),
                                     ),
                                     Container(
                                       width: double.infinity,
                                       child: Padding(
                                         padding:
                                         const EdgeInsets.only(
                                             left: 15),
                                         child: Text(
                                           '${resultlistCategoryOfProducts[index].products[index2][0].currency} ${resultlistCategoryOfProducts[index].products[index2][0].price}',
                                           style: TextStyle(
                                             fontSize: 13,
                                             color: Colors.red,
                                           ),
                                           textAlign: TextAlign.left,
                                           maxLines: 2,
                                         ),
                                       ),
                                     ),
                                     Container(
                                       width: double.infinity,
                                       child: Padding(
                                         padding:
                                         const EdgeInsets.only(
                                             left: 15),
                                         child: Text(
                                           '${resultlistCategoryOfProducts[index].products[index2][0].name}',maxLines: 2,
                                           style: TextStyle(
                                             fontSize: 12,
                                             color: Colors.black,
                                           ),
                                           textAlign: TextAlign.left,

                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           );
                         },
                       ),
                     ),
                   ],
                 )
               ],
             ):Container(color: Colors.red,);
           })
       )),
      ]
    ),
    );
  }
}
