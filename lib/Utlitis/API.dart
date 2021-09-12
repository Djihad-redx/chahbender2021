import 'dart:convert';

import 'package:e_comerce/Models/Cart.dart';
import 'package:e_comerce/Models/Currency.dart';
import 'package:e_comerce/Models/DeleteAddress.dart';
import 'package:e_comerce/Models/HomePageCat.dart';
import 'package:e_comerce/Models/Language.dart';
import 'package:e_comerce/Models/LocationInfo.dart';
import 'package:e_comerce/Models/ProductCat.dart';
import 'package:e_comerce/Models/Profile.dart';
import 'package:e_comerce/Models/ProvinceInfo.dart';

import 'package:e_comerce/Models/newcart.dart';
import 'package:e_comerce/Models/token.dart';
import 'package:e_comerce/Utlitis/General.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Api {
  Api({this.dataOrder});

  final dataOrder;

  static const String uri = 'https://chahbandarapi1.herokuapp.com';

  static const String urlSignIn =
      'https://chahbandarapi1.herokuapp.com/api/auth/login';
  static const String urlSignUp =
      'https://chahbandarapi1.herokuapp.com/api/auth/register';
  static const String urlgetLang =
      'https://chahbandarapi1.herokuapp.com/api/language/';
  static const String urlgetCurrency =
      'https://chahbandarapi1.herokuapp.com/api/currency/list';
  static const String urlloadcategories =
      'https://chahbandarapi1.herokuapp.com/api/mobile/home';
  static const String urladdtocart =
      'https://chahbandarapi1.herokuapp.com/api/cart/add-to-cart';
  static const String urlprofileInfo =
      'https://chahbandarapi1.herokuapp.com/api/auth/me';
  static const String urldelete =
      'https://chahbandarapi1.herokuapp.com/api/locations/address/';
  static const String urllocation =
      'https://chahbandarapi1.herokuapp.com/api/locations/countryManagement/';
  static const String urlprovince =
      'https://chahbandarapi1.herokuapp.com/api/locations/get-country-provinces/';

  static Future<bool> Login(String email, String password) async {
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Cookie':
          'token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MDY5MGYxMmUwYzU4NjAwMTcwODM2N2EiLCJyb2xlSWQiOiI2MDBlOWVhNGZjNzMwODQyMDQxYTMwYWIiLCJpYXQiOjE2MTc0OTc4NzUsImV4cCI6MTYyMDA4OTg3NX0.RcB-vzjaGrs9fS0v9WQmjwHvkl_9AVtbfKGyUGZuHkQ'
    };
    var body = '''{"email":"$email","password":"$password"}''';
    http.Response response =
        await http.post(urlSignIn, headers: headers, body: body);

    if (response.statusCode == 200) {
      print(response.body);
      Token result = tokenFromJson(response.body);
      General().setUserToken(result.token);
      General().setUserID(result.data.id);
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  static Future<bool> Sign_up(String name, String lastName, String email,
      String password, String role, String active, String phone) async {
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    var body = '''{\r\n
  "name":"$name",\r\n
  "lastName":"$lastName",\r\n
  "email":"$email",\r\n
  "password":"$password",\r\n
  "phone":"$phone",\r\n
  "role":"$role",\r\n
  "active":$active,\r\n
  "token":{}\r\n
  }''';

    // print(body);
    http.Response response =
        await http.post(urlSignUp, headers: headers, body: body);

    if (response.statusCode == 200) {
      Token result = tokenFromJson(response.body);
      print(response.body);
      General().setUserToken(result.token);
      return true;
    } else {
      print(response.body);
    }
  }

  static Future<bool> Logout() async {
    var headers = {'accept': '*/*', 'Cookie': 'token=none'};
    var request = http.Request('GET',
        Uri.parse('https://chahbandarapi1.herokuapp.com/api/auth/logout'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      General().setUserToken('');
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<List<String>> GetLang() async {
    var headers = {'accept': 'application/json'};
    http.Response response = await http.get(
      urlgetLang,
      headers: headers,
    );

    Lang result = langFromJson(response.body);
    List<String> langsrsult = new List<String>();

    if (response.statusCode == 200) {
      for (var x in result.data.languages) {
        langsrsult.add(x.name.toString());
      }
      return langsrsult;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<List<String>> GetCurrency() async {
    var headers = {'accept': 'application/json'};
    http.Response response = await http.get(
      urlgetCurrency,
      headers: headers,
    );

    CurrencyClass result = currencyFromJson(response.body);
    Datum data = new Datum();

    if (response.statusCode == 201) {
      List<String> Currensrsult = new List<String>();
      for (var x in result.data) {
        data.code = x.code;
        Currensrsult.add(data.code.toString());
      }
      print(Currensrsult);
      return Currensrsult;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<Map<String, dynamic>> LoadCategories() async {
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var body = '''{"uniqueSeoCode":"en","currencyCode":"USD"}''';
    http.Response response =
        await http.post(urlloadcategories, headers: headers, body: body);
    Map<String, dynamic> data = jsonDecode(response.body);
    Map<String, dynamic> dataCat = data["data"];
    List<dynamic> resmenucat = dataCat['menuCategory'];
    //print(resmenucat);

    if (response.statusCode == 200) {
      List<MenuCategory> result = <MenuCategory>[];
      for (var x in resmenucat) {
        MenuCategory item = new MenuCategory();
        item = MenuCategory.fromJson(x);
        result.add(item);
      }
      return dataCat;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<Categories> LoadCategoriesCat() async {
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var body = '''{"uniqueSeoCode":"en","currencyCode":"USD"}''';
    http.Response response =
        await http.post(urlloadcategories, headers: headers, body: body);
    if (response.statusCode == 200) {
      Categories res = new Categories();
      res = categoriesFromJson(response.body);
      return res;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  static Future<ProductPageCat> LoadProduct(String id) async {
    var headers = {'accept': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://chahbandarapi1.herokuapp.com/api/product/bycat/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String res = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      ProductPageCat result = new ProductPageCat();
      result = productPageCatFromJson(res);
      // print(res);
      // print('------------------------------------');
      return result;
    } else {
      print(response.reasonPhrase);
      print('fffffffffffffffffffffffffffff');
      return null;
    }
  }

  static Future<bool> AddToCart(
      String productId,
      int quantity,
      int price,
      String currency) async {
    var headers = {
      'Authorization': 'Bearer ${General.token}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST',
        Uri.parse('https://chahbandarapi1.herokuapp.com/api/cart/add-to-cart'));
    request.body = json.encode({
      "productId": "$productId",
      "quantity": quantity,
      "price": price,
      "currency": "$currency"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      print(await response.stream.bytesToString());
      print("ezzzzzzzzzzzzzzzzzzzzzzz");
    } else {
      print(response.reasonPhrase);
      print(response.statusCode);
    }
  }

  static Future<bool> RemoveProductCart(String productId, remove) async {
    var headers = {
      'Authorization': 'Bearer ${General.token}',
      'Content-Type': 'application/json'
    };
    print(productId);
    var request = http.Request(
        'PUT',
        Uri.parse(
            'https://chahbandarapi1.herokuapp.com/api/cart/remove-item-cart'));
    request.body = json.encode({"productId": "$productId", "remove": true});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String x = await response.stream.bytesToString();
    print(x);
    if (response.statusCode == 200) {

      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  static Future<bool> UpdateProductCart(String productId, int quantity) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MDY5MTczMGUwYzU4NjAwMTcwODM2OGMiLCJyb2xlSWQiOiI2MDBlOWVhNGZjNzMwODQyMDQxYTMwYWIiLCJpYXQiOjE2MjI0MDg4NTUsImV4cCI6MTYyNTAwMDg1NX0.f4ahogCHeZ_4Woe-Je5EOzkgqs5iptDXmz2hcoCkduY',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'PUT',
        Uri.parse(
            'https://chabandarapi1.herokuapp.com/api/cart/remove-item-cart'));
    request.body =
        json.encode({"productId": "$productId", "quantity": quantity});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<Cartitem> LoadProductCart() async {
    var headers = {'Authorization': 'Bearer ${General.token}'};
    http.Response response = await http.get(
      'https://chahbandarapi1.herokuapp.com/api/cart/get-carts',
      headers: headers,
    );

    String x = response.body;

    if (response.statusCode == 200) {
      //  print(x);
      Cartitem result = new Cartitem();
      result = cartitemFromJson(x);

      return result;
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<Cartitem> AddLocalCarttoServer(String userid) async {
    var headers = {
      'Authorization': 'Bearer ${General.token}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST',
        Uri.parse('https://chahbandarapi1.herokuapp.com/api/cart/add-to-cart'));
    request.body = json.encode({
      "userId": General.user_id,
      "items": General.cart.products,
      "active": true,
      "totalQty": 4,
      "totalCost": 2000
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<bool> AddListToCart(DataCat LocalCart) async {
    for (int i = 0; i < LocalCart.products.length; i++) {
      AddToCart(
              LocalCart.products[i].productId,
              LocalCart.products[i].quantity,
              LocalCart.products[i].price[0].priceNow,
              LocalCart.products[i].price[0].currency.code)
          .then((value) {
        return value;
      });
    }
  }

  static Future<UserProfile> getUserProfileInfo() async {
    var headers = {
      'Authorization': 'Bearer ${General.token}'
    };
    var request = http.Request('GET', Uri.parse(urlprofileInfo));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(response.statusCode);
      String res = await response.stream.bytesToString();
      return userProfileFromJson(res);
    } else {
      print(response.reasonPhrase);
      print(response.statusCode);
    }
  }

  static Future<DeleteAddress> deleteAddress(String id) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MGIzMzZhZmU5YzBkYjAwMTc0YzhjZjkiLCJyb2xlSWQiOiI2MDBlOWVhNGZjNzMwODQyMDQxYTMwYWIiLCJpYXQiOjE2MjI1MzU3OTcsImV4cCI6MTYyNTEyNzc5N30.KIwE1FaQvirKB1PLadm1YUl3qnUc_813rjlQa3-SiNo',
      'Content-Type': 'application/json'
    };
    var request = http.Request('DELETE', Uri.parse(urldelete + id));
    request.body = json.encode({"customer": "60b336afe9c0db00174c8cf9"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String res = await response.stream.bytesToString();
      return deleteAddressFromJson(res);
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<LocationInfo> getLocationInfo() async {
    var request = http.Request('GET', Uri.parse(urllocation));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String res = await response.stream.bytesToString();
      return locationInfoFromJson(res);
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<ProvinceInfo> getprovince(String country_id) async {
    var request = http.Request('GET', Uri.parse(urlprovince + country_id));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String res = await response.stream.bytesToString();
      return provinceInfoFromJson(res);
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<int> AddProvince(
      String nameAddresses,
      String firstName,
      String lastName,
      int phone,
      String country_id,
      String province_id,
      String country_name,
      String province_name,
      String zip_code) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MGIzMzZhZmU5YzBkYjAwMTc0YzhjZjkiLCJyb2xlSWQiOiI2MDBlOWVhNGZjNzMwODQyMDQxYTMwYWIiLCJpYXQiOjE2MjI1MzU3OTcsImV4cCI6MTYyNTEyNzc5N30.KIwE1FaQvirKB1PLadm1YUl3qnUc_813rjlQa3-SiNo',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://chahbandarapi1.herokuapp.com/api/locations/address'));
    request.body = json.encode({
      "nameAddresses": nameAddresses,
      "firstName": firstName,
      "lastName": lastName,
      "phone": phone,
      "location": {
        "country": {"id": country_id, "name": country_name},
        "province": {"id": province_id, "name": province_name},
        "district": {"id": "600ea8eedb6dda1d90fff78c", "name": "Beşiktaş"}
      },
      "address1": nameAddresses,
      "address2": nameAddresses,
      "zipCode": zip_code,
      "addressType": "ShippingAddress"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String res = await response.stream.bytesToString();
      return response.statusCode;
    } else {
      print(response.reasonPhrase);
      return 0;
    }
  }

  static Future<int> EditAddress(
      String nameAddresses,
      String firstName,
      String lastName,
      int phone,
      String country_id,
      String province_id,
      String country_name,
      String province_name,
      String zip_code,
      String AddressId) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MGIzMzZhZmU5YzBkYjAwMTc0YzhjZjkiLCJyb2xlSWQiOiI2MDBlOWVhNGZjNzMwODQyMDQxYTMwYWIiLCJpYXQiOjE2MjI1MjgyOTQsImV4cCI6MTYyNTEyMDI5NH0.aj6zz4g1OsqE5jnULyb-UtJJOuik5crHSNjna-wuBFg',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'PUT',
        Uri.parse(
            'https://chahbandarapi1.herokuapp.com/api/locations/address/'+AddressId));
    request.body = json.encode({
      "nameAddresses": nameAddresses,
      "firstName": firstName,
      "lastName": lastName,
      "phone": phone,
      "location": {
        "country": {"id": country_id, "name": country_name},
        "province": {"id": province_id, "name": province_name},
        "district": {"id": "600ea8eedb6dda1d90fff78c", "name": "Beşiktaş"}
      },
      "address1": nameAddresses,
      "address2": nameAddresses,
      "zipCode": zip_code,
      "addressType": "ShippingAddress"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200||response.statusCode==202) {
      print(await response.stream.bytesToString());
      return response.statusCode;
    } else {
      print(response.reasonPhrase);
      print(response.statusCode);
    }
  }
  //test
}
