import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:e_comerce/Models/ProductCat.dart';


import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class General {

  static String token = "";
  static String user_id = "";
  static String Lang = "";
  static String Currenc = "";
  static String Stringproduct = "";
  static DataCat cart = new DataCat();
  static DataCat WishList = new DataCat();



  Future<String> getUserToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString("token") ?? "";
    return token;
  }

  void setUserToken(String tokenSet) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = tokenSet;
    pref.setString("token", tokenSet);
  }

  Future<String> getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    user_id = pref.getString("user_id") ?? "";
    return user_id;
  }

  void setUserID(String UserId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    user_id = UserId;
    pref.setString("user_id", user_id);
  }

  Future<String> getUserLang() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Lang = pref.getString("Lang") ?? "";
    return Lang;
  }

  void setUserLang(String LangSet) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Lang = LangSet;
    pref.setString("Lang", LangSet);
  }

  Future<String> getUserCurrenc() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Currenc = pref.getString("Currenc") ?? "";
    return Currenc;
  }

  Future<void> setProductincart(Product cartproduct, int Quantity) async {
    cart.products = [];
   getProductfromCart().then((value) {
     print(value);
     if (value == null){
       cart.products = [];
     }else
       cart.products = value;
   });
    SharedPreferences shared = await SharedPreferences.getInstance();

    cartproduct.quantity = Quantity;
    int ok = 0;

   int count = cart.products.length == null?0 : cart.products.length;
   print(count);
    for(int i = 0;i<count;i++){
      if(cartproduct.id == cart.products[i].id){
        cart.products[i].quantity = cart.products[i].quantity + Quantity;
        Map product = cart.toJson2();
        String Stringproduct = jsonEncode(product);
        shared.setString('cart', Stringproduct);
      }else{
      ok++;
      }
    }
    if(ok == cart.products.length){
      cart.products.add(cartproduct);
      Map product = cart.toJson2();
      String Stringproduct = jsonEncode(product);
      shared.setString('cart', Stringproduct);
    }

  }

  Future<bool> setProductinWishList(Product productt, int Quantity) async {

    WishList.products = [];
    getProductfromCart().then((value) {
      print(value);
      if (value == null){
        WishList.products = [];
      }else
        WishList.products = value;
    });
    SharedPreferences shared = await SharedPreferences.getInstance();

    productt.quantity = Quantity;
    int ok = 0;

    int count = WishList.products.length == null?0 : WishList.products.length;
    print(count);
    for(int i = 0;i<count;i++){
      if(productt.id == WishList.products[i].id){
        WishList.products[i].quantity = WishList.products[i].quantity + Quantity;
        Map product = WishList.toJson2();
        String Stringproduct = jsonEncode(product);
        shared.setString('WishList', Stringproduct);
      }else{
        ok++;
      }
    }
    if(ok == WishList.products.length){
      WishList.products.add(productt);
      Map product = WishList.toJson2();
      String Stringproduct = jsonEncode(product);
      shared.setString('WishList', Stringproduct);
      return true;
    }

  }

  Future<void> editaddQuantity(String ProductID) async {
    cart.products = [];
    getProductfromCart().then((value) {
      print(value);
      if (value == null){
        cart.products = [];
      }else
        cart.products = value;
    });
    SharedPreferences shared = await SharedPreferences.getInstance();
   for(int i=0;i<cart.products.length;i++){
     if (ProductID == cart.products[i].id){
       cart.products[i].quantity++;
     }
   }
    Map product = cart.toJson2();
    String Stringproduct = jsonEncode(product);
    shared.setString('cart', Stringproduct);
  }

  Future<void> editsubQuantity(String ProductID) async {
    cart.products = [];
    getProductfromCart().then((value) {
      print(value);
      if (value == null){
        cart.products = [];
      }else
        cart.products = value;
    });
    SharedPreferences shared = await SharedPreferences.getInstance();
    for(int i=0;i<cart.products.length;i++){
      if (ProductID == cart.products[i].id){
        cart.products[i].quantity--;
      }
    }
    Map product = cart.toJson2();
    String Stringproduct = jsonEncode(product);
    shared.setString('cart', Stringproduct);
  }

  Future<void> deletproduct(int index) async{
    SharedPreferences shared = await SharedPreferences.getInstance();
    General.cart.products.removeAt(index);
    Map product = cart.toJson2();
    String Stringproduct = jsonEncode(product);
    shared.setString('cart', Stringproduct);
  }
  Future<void> deletproductFromwish(int index) async{
    SharedPreferences shared = await SharedPreferences.getInstance();
    General.WishList.products.removeAt(index);
    Map product = WishList.toJson2();
    String Stringproduct = jsonEncode(product);
    shared.setString('WishList', Stringproduct);
  }

  Future<void> setProductincartnull() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    cart.products = [];
    shared.setString('cart', "[]");
  }

  Future<List<Product>> getProductfromCart() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Stringproduct = pref.getString("cart") ?? "";
    if(Stringproduct != null && Stringproduct != ""){
      Map cartt = jsonDecode(Stringproduct);
      if(cartt != null){
     cart.products =  DataCat.fromJson2(cartt).products;
      }
    }else{
      cart.products = null;
    }
    return cart.products;
  }

  Future<List<Product>> getProductfromWishList() async {

    SharedPreferences pref = await SharedPreferences.getInstance();

    Stringproduct = pref.getString("WishList") ?? "";

    if(Stringproduct != null && Stringproduct != ""){

      Map WishList2 = jsonDecode(Stringproduct);
      if(WishList2 != null){
        WishList.products =  DataCat.fromJson2(WishList2).products;
      }
    }
    else{
      WishList.products = null;
    }
    return WishList.products;
  }

  void setUserCurrenc(String CurrencSet) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Currenc = CurrencSet;
    pref.setString("Currenc", CurrencSet);
  }

  // checkConnection(BuildContext context) async{
  //   listener = DataConnectionChecker().onStatusChange.listen((status) {
  //     switch (status){
  //       case DataConnectionStatus.connected:
  //         InternetStatus = "Connected to the Internet";
  //         contentmessage = "Connected to the Internet";
  //         _showDialog(InternetStatus,contentmessage,context);
  //         break;
  //       case DataConnectionStatus.disconnected:
  //         InternetStatus = "You are disconnected to the Internet. ";
  //         contentmessage = "Please check your internet connection";
  //         _showDialog(InternetStatus,contentmessage,context);
  //         break;
  //     }
  //   });
  //   return await DataConnectionChecker().connectionStatus;
  // }

}