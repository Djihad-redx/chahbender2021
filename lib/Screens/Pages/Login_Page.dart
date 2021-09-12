import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/InputFild.dart';
import 'package:e_comerce/Screens/Helpers/InputPasswordFild.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Screens/Helpers/or_divider.dart';
import 'package:e_comerce/Screens/Pages/Forgot_Password_Page.dart';
import 'package:e_comerce/Screens/Pages/Main_Page.dart';
import 'package:e_comerce/Screens/Pages/SignUp_Page.dart';
import 'package:e_comerce/Utlitis/API.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart' as toast;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  TextEditingController Email = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [HeaderApp(c: context,islogin: true,Title: 'Login',),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: ListView(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height*.04,),
                            Container(
                            width: double.infinity,
                            child: Center(
                              child: Text('Login',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                color: Colors.black
                              ),),
                            ),
                          ),
                            SizedBox(height: MediaQuery.of(context).size.height*.15,),
                            InputFild(Title: 'EMAIL',Controler: Email,),
                            InputPasswordFild(Title: 'Password',Controler: Password,),
                            Padding(
                              padding: const EdgeInsets.only(top:12),
                              child: Container(
                                  width: double.infinity,
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPaswordPage(),));
                                    },
                                    child: Text('Forgot Password?',textAlign: TextAlign.end,style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),),
                                  )),
                            ),
                            SizedBox(height: 70,),
                            Center(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    isLoading =true;
                                  });
                                  Api.Login(Email.text, Password.text).then((value) {
                                    if(value == true){
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainPage(),));
                                    }else{
                                      showToast('failed');
                                    }
                                    setState(() {
                                      isLoading = false;
                                    });
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left:2,right: 2),
                                  height: 60,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Colors.red
                                  ),
                                  child: Center(child: Text('LOGIN',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20
                                  ),)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Dont have an account?.',style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16
                                  ),),
                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage(),));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:4.0),
                                      child: Text('Register Now',style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                       // fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                      ),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30,),
                        ],),
                      ),
                    ),
                  ),
                ],
              ),
              isLoading == true ?Loading():Container()
            ],
          ),
        ),
      ),
    );

  }
  void showToast(String msg, {int duration, int gravity}) {
    toast.Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
