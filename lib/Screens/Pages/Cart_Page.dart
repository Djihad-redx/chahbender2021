import 'package:e_comerce/Models/Cart.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Screens/Helpers/cart_card.dart';
import 'package:e_comerce/Screens/Helpers/check_out_card.dart';
import 'package:e_comerce/Screens/Helpers/default_button.dart';
import 'package:e_comerce/Screens/Pages/checkout_page1.dart';
import 'package:e_comerce/Utlitis/API.dart';
import 'package:e_comerce/Utlitis/General.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'cartwidget.dart';

class CartPagep extends StatefulWidget {
  CartPagep({this.isheader});
  bool isheader;
  @override
  _CartPagepState createState() => _CartPagepState();
}

class _CartPagepState extends State<CartPagep> {
  double total = 0.0;
  bool isloading = false;
  Cartitem cartlist = new Cartitem();

  @override
  void initState() {
      // cartlist.data.cartItems.items = [];
      // General.token == "";
        if(General.token == ""){
          setState(() {
            isloading = true;
          });
          General().getProductfromCart().then((value) {
            General.cart.products = value;
            setState(() {
              isloading = false;
              if(value!=null){
                for(int i=0;i<value.length;i++){
                  total = total+value[i].price[0].priceNow * value[i].quantity;
                }
              }
            });
          });
        }else{
          setState(() {
            isloading = true;
          });
          Api.AddListToCart(General.cart).then((value2) {
            print(value2);
            Api.LoadProductCart().then((value) {
              setState(() {
                cartlist = value;
                if(cartlist!= null){
                  for(int i = 0;i<cartlist.data.cartItems.items.length;i++){
                    total = total + cartlist.data.cartItems.items[i].price*cartlist.data.cartItems.items[i].quantity;
                  };
                }
                setState(() {
                  isloading = false;
                });
              });
            });
            General().setProductincartnull();

          });
        }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:SafeArea(
          child: isloading == true?  Expanded(child: Loading()):
          General.cart.products == null && cartlist.data == null?
          Center(
            child: Container(child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.remove_shopping_cart_outlined,size: 55,),
                ),
                Text('Cart is empty',style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),)
              ],
            ),),
          ):
          Column(
            children: [
              HeaderApp(c: context,Title: "Cart",icon: Icons.arrow_back,),
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget> [
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                       return  Padding(
                         padding: const EdgeInsets.only(left:20,right: 20,top: 10),
                         child:  Container(
                           padding: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                           ),
                           child: Row(
                             children: [
                               SizedBox(
                                 width: 100,
                                 height: 100,
                                 child: AspectRatio(
                                   aspectRatio: 0.88,
                                   child: Container(
                                     padding: EdgeInsets.all(10),
                                     decoration: BoxDecoration(
                                         border: Border.all(width: 2,color: Colors.grey),
                                         borderRadius: BorderRadius.circular(22),
                                         image: DecorationImage(
                                             image:General.token !=""? cartlist.data.cartItems.items[index].productPictureUrl.isNotEmpty? NetworkImage(cartlist.data.cartItems.items[index].productPictureUrl):AssetImage('assets/images/np.png'):General.cart.products[index].productPicture.isNotEmpty? NetworkImage(General.cart.products[index].productPicture[0].url):AssetImage('assets/images/np.png'),
                                             fit: BoxFit.cover
                                         )
                                     ),
                                   ),
                                 ),
                               ),
                               // SizedBox(width: 20),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Padding(
                                     padding:  EdgeInsets.only(left:15.0,top: 15),
                                     child: Container(
                                       //width: MediaQuery.of(context).size.width*.6,
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Container(
                                             width: MediaQuery.of(context).size.width*.30,
                                             child: Text(
                                               General.token != ""? cartlist.data.cartItems.items[index].name:General.cart.products[index].name,
                                               style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
                                               maxLines:2,
                                             ),
                                           ),
                                           Container(
                                             //width: 100,
                                             child: Text(' \$ ${General.token != ""?cartlist.data.cartItems.items[index].price*cartlist.data.cartItems.items[index].quantity:General.cart.products[index].price[0].priceNow*General.cart.products[index].quantity}',style: TextStyle(
                                                 fontSize: 22,
                                                 color: Colors.orangeAccent
                                             ),),
                                           )
                                         ],
                                       ),
                                     ),
                                   ),
                                   SizedBox(height: 15),
                                   Container(
                                     width: MediaQuery.of(context).size.width*.55,
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.only(left:15),
                                           child: Container(
                                             height: 60,
                                             width: 130,
                                             margin: EdgeInsets.only(top: 4),
                                             padding: EdgeInsets.only(left:3,right: 3,top: 1,bottom: 1),
                                             decoration: BoxDecoration(
                                               borderRadius: BorderRadius.all(Radius.circular(5)),

                                             ),
                                             child:Row(
                                               children: [
                                                 Expanded(
                                                   child: InkWell(
                                                     onTap: (){
                                                       setState(() {
                                                         if( General.cart.products[index].quantity <10){
                                                           setState(() {
                                                             General().editaddQuantity(General.cart.products[index].id).then((value){
                                                               setState(() {
                                                                 total = total + General.cart.products[index].price[0].priceNow;
                                                               });
                                                             });
                                                           });
                                                         }
                                                       });
                                                     },
                                                     child: Container(
                                                       height: 40,
                                                       decoration: BoxDecoration(
                                                           color: Colors.grey.shade200,
                                                           borderRadius: BorderRadius.only(topLeft:Radius.circular(20),bottomLeft: Radius.circular(20))
                                                       ),
                                                       child: Icon(FontAwesomeIcons.plus,size: 18),
                                                     ),
                                                   ),
                                                 ),
                                                 Expanded(
                                                   child: Container(
                                                     height: 40,
                                                     color: Colors.grey.shade200,
                                                     child: Center(
                                                       child: Text( General.token != ""? cartlist.data.cartItems.items[index].quantity.toString():General.cart.products[index].quantity.toString(), style: TextStyle(
                                                           fontSize: 20,
                                                           fontWeight: FontWeight.bold
                                                       ),),
                                                     ),
                                                   ),
                                                 ),
                                                 Expanded(
                                                   child: InkWell(
                                                     onTap: (){
                                                       setState(() {
                                                         if( General.cart.products[index].quantity >1){
                                                           setState(() {
                                                             General().editsubQuantity(General.cart.products[index].id).then((value){
                                                               setState(() {
                                                                 total = total - General.cart.products[index].price[0].priceNow;
                                                               });
                                                             });
                                                           });
                                                         }
                                                       });

                                                     },
                                                     child: Container(
                                                       height: 40,
                                                       decoration: BoxDecoration(
                                                           borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topRight: Radius.circular(20)),
                                                           color: Colors.grey.shade200
                                                       ),
                                                       child: Icon(FontAwesomeIcons.minus,size: 17,),
                                                     ),
                                                   ),
                                                 ),
                                               ],
                                             ),
                                           ),
                                         ),
                                         InkWell(
                                           onTap: (){

                                             if (General.token!=""){
                                               setState(() {
                                                 isloading = true;
                                               });
                                               Api.RemoveProductCart(cartlist.data.cartItems.items[index].productId, true).then((value2) {
                                                 Api.LoadProductCart().then((value) {
                                                   setState(() {
                                                     cartlist = value;
                                                     print (value);
                                                     if(cartlist!= null){
                                                       for(int i = 0;i<cartlist.data.cartItems.items.length;i++){
                                                         total = total + cartlist.data.cartItems.items[i].price*cartlist.data.cartItems.items[i].quantity;
                                                       };
                                                     }
                                                     setState(() {
                                                       isloading = false;
                                                     });
                                                   });
                                                 });
                                               });
                                             }else{
                                               General().deletproduct(index).then((value) {
                                                 General().getProductfromCart().then((value) {
                                                   setState(() {
                                                     General.cart.products = value;
                                                     total = total- General.cart.products[index].price[0].priceNow*General.cart.products[index].quantity;
                                                   });
                                                 });
                                               });
                                             }
                                             setState(() {
                                               isloading = false;

                                             });
                                           },
                                           child: Container(
                                             height: 45,
                                             width: 45,
                                             decoration: BoxDecoration(
                                                 color: Color(0xff0E516E),
                                                 borderRadius: BorderRadius.all(Radius.circular(15))
                                             ),
                                             child: Center(child: Icon(FontAwesomeIcons.trashAlt,color: Colors.white,size: 17,)),
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                 ],
                               )
                             ],
                           ),
                         ),
                       );
                    },
                    childCount: General.token == ""? General.cart.products.length: cartlist.data.cartItems.items.length,
                ),
        ),
                      SliverToBoxAdapter(
                      child:   Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.only(right: 20,left: 20,bottom: 10,top: 10),
                        decoration: BoxDecoration(
                          //color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, -15),
                              blurRadius: 20,
                              color: Color(0xFFDADADA).withOpacity(0.15),
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Totals",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),textAlign: TextAlign.start,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Subtotal:",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),textAlign: TextAlign.start,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:  Text(General.cart.products.isEmpty?"0.0 \$":"${General.token==""?total:cartlist.data.cartItems.totalCost} \$",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.orangeAccent
                                  ),),
                                ),
                              ],),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Total",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),textAlign: TextAlign.start,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(" 0.0  \$",style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.orangeAccent
                                    ),),
                                  ),
                                ],),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 180,
                                  child: DefaultButton(
                                    text: "Check Out",
                                    press: () {
                                      setState(() {
                                        //General().setProductincartnull();
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Checkout1(),));
                                        total = 0.0;
                                      });


                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

        )
      ),
    );
  }
}


