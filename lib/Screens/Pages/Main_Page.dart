import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_comerce/Screens/Helpers/DrawerScreen.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Pages/Cart_Page.dart';
import 'package:e_comerce/Screens/Pages/Categories_Page.dart';
import 'package:e_comerce/Screens/Pages/DrawerScreen.dart';
import 'package:e_comerce/Screens/Pages/Home_Page.dart';
import 'package:e_comerce/Screens/Pages/Login_Page.dart';
import 'package:e_comerce/Screens/Pages/WishList.dart';
import 'package:e_comerce/Screens/Pages/user_profile.dart';
import 'package:e_comerce/Utlitis/General.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Fav_Page.dart';
import 'MyOrder_Page.dart';
import 'cartwidget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit the Application'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  int _currentIndex = 0;
  PageController _pageController;

  void bottomTapped(int index) {
    setState(() {
      _currentIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  int _counter = 0;

  @override
  void initState() {
    setState(() {
      test='Home';
    });
    if (General.cart.products == null) {
      setState(() {
        General.cart.products = [];
      });
    }
    super.initState();
    _pageController = PageController();
  }

  void pageChanged(int index) {}

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  String test;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: WillPopScope(
          onWillPop: _onWillPop,
          child: SafeArea(
            child: Column(
              children: [
                HeaderApp(
                  c: context,
                  Title: test,
                  icon: Icons.menu_sharp,
                ),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                        switch (index) {
                          case 0:
                            setState(() {
                              test = 'Home';
                            });
                            break;
                          case 1:
                            setState(() {
                              test = 'Favourite';
                            });
                            break;
                          case 2:
                            setState(() {
                              test = 'Categories';
                            });
                            break;
                          case 3:
                            setState(() {
                              test = 'My Orders';
                            });
                            break;
                          case 4:
                            setState(() {
                              test = 'Profile';
                            });
                            break;
                          default: setState(() {
                            test = 'ssss';
                          });
                        }
                      });
                    },
                    children: <Widget>[
                      HomePage(),
                      WishListPage(),
                      CategoriesPage(
                        mycontext: this.context,
                      ),
                      MyOrderPage(isFrag: true,),
                      Profile(mycontext: this.context,isFrag: true,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: Theme(
            data: Theme.of(context).copyWith(
              // Set the transparency here
              canvasColor: Colors
                  .transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
            ),
            child: DrawerScreen()),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orange,
          currentIndex: _currentIndex,
          onTap: (index) => setState(() {
            if(General.token==""&&index==3)
            {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));
            }
            else{  bottomTapped(index);}



          } ),

            type : BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Wish List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Orders',
            ),BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
