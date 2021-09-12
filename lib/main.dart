import 'package:e_comerce/Screens/Pages/Main_Page.dart';
import 'package:e_comerce/traslations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Screens/Pages/Login_Page.dart';
import 'Utlitis/API.dart';
import 'Utlitis/General.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar'),Locale('tr')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        assetLoader: CodegenLoader(),
        child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  static List<String> langslist = new List<String>();
  static List<String> Currencylist = new List<String>();
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String token = '';
  @override
  void initState() {
    General().getUserCurrenc().then((value) {
      General.Currenc = value;
    });
    General().getUserLang().then((value) {
      General.Lang = value;
    });
    General().getUserToken().then((value) {
      setState(() {
        General.token = value;
        print('your token is '+ General.token);
      });
    });
    General().getUserId().then((value) {
      setState(() {
        General.user_id=value;
      });
    });
    Api.GetLang().then((value2) {
      setState(() {
        MyApp.langslist = value2;
      });
      Api.GetCurrency().then((value3) {
        setState(() {
          MyApp.Currencylist = value3;
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SplashScreen(
                seconds: 3,
                navigateAfterSeconds: MainPage(),
                image: Image(image: AssetImage('assets/images/aa.png')),
                backgroundColor: Colors.white,
                styleTextUnderTheLoader: new TextStyle(),
                photoSize: 150.0,
                loaderColor: Colors.orange)));
  }
}
