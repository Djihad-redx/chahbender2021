import 'package:e_comerce/Models/ProductCat.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Utlitis/API.dart';
import 'package:e_comerce/Utlitis/General.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WishListPage extends StatefulWidget {
  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {

  List<Product> wishlistresult = [];
  bool isloading = false;
  @override
  void initState() {
    isloading = true;
 General().getProductfromWishList().then((value) {
   print(value.length);
   wishlistresult = value;
   setState(() {
     isloading = false;
   });

 });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return isloading == true? Loading():ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: wishlistresult.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.only(left:15,right: 5,top: 0),
            child:Container(
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
                                image: wishlistresult[index].productPicture.isEmpty? AssetImage('assets/images/np.png'):
                                NetworkImage(wishlistresult[index].productPicture[0].url)
                                ,
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*.35,
                            child: Padding(
                              padding:  EdgeInsets.only(left:15.0,top: 15,bottom: 15),
                              child: Text(
                               wishlistresult[index].name,
                                style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
                                maxLines: 2,
                              ),
                            ),
                          ),
                          Text(' \$ ${wishlistresult[index].price[0].priceNow}',style: TextStyle(
                              fontSize: 22,
                              color: Colors.orangeAccent
                          )),

                        ],
                      ),
                      SizedBox(height: 5),
                      Row(

                        children: [
                          InkWell(
                            onTap: () {
                              if (General.token != "") {
                                setState(() {
                                  isloading = true;
                                });
                                Api.AddToCart(
                                    wishlistresult

                                        [index]
                                        .id,
                                    1,
                                    wishlistresult[index]
                                        .price[0]
                                        .priceNow,
                                    wishlistresult[index]
                                        .price[0]
                                        .currency
                                        .code)
                                    .then((value) {
                                  print(value);
                                  print('add to server');

                                  setState(() {
                                    isloading = false;
                                  });
                                  Fluttertoast.showToast(
                                      msg: "Added to cart",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.blue,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                });
                              } else {
                                General()
                                    .setProductincart(
                                    wishlistresult[index],
                                    1)
                                    .then((value) {
                                  print("added to local");
                                  Fluttertoast.showToast(
                                      msg: "Added to cart",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.blue,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                  //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPagep(),));
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0,left: 10),
                              child: Container(
                                height: 45,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Color(0xff0E516E),
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                child: Center(child: Text('Add to Cart',style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.white
                                ),)),
                              ),
                            ),
                          ),
                          Container(width: 15,),
                          InkWell(
                            onTap: (){
                              General().deletproductFromwish(index).then((value) {
                                General().getProductfromWishList().then((value) {
                                  print(value.length);
                                  setState(() {
                                    wishlistresult = value;
                                  });

                                  setState(() {
                                    isloading = false;
                                  });
                                });
                              });

                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0,left: 10),
                              child: Container(
                                height: 45,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Color(0xff0E516E),
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                child: Center(child: Text('Delete',style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.white
                                ),)),
                              ),
                            ),
                          )
                        ],
                      )


                    ],
                  )
                ],
              ),
            )
        );
      },

    );
  }
}
