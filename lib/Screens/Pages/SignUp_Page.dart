import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/InputFild.dart';
import 'package:e_comerce/Screens/Helpers/InputPasswordFild.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Screens/Helpers/or_divider.dart';
import 'package:e_comerce/Screens/Pages/Login_Page.dart';
import 'package:e_comerce/Screens/Pages/Main_Page.dart';
import 'package:e_comerce/Utlitis/API.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController FirstName = new TextEditingController();
  TextEditingController LastName = new TextEditingController();
  TextEditingController Email = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  TextEditingController Phone = new TextEditingController();
  TextEditingController Role = new TextEditingController();

  bool isLoading = false;

  bool rememberMe = false;
  void _onRememberMeChanged(bool newValue) => setState(() {
    rememberMe = newValue;
    if (rememberMe) {
    } else {
    }
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  HeaderApp(Title: "Create New Account",c: this.context,icon: Icons.arrow_back,islogin: true,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25,0,25,0),
                      child: ListView(children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: [
                              Expanded(child: InputFild(Title: "First Name",Controler: FirstName,)),
                              Container(height: 40,width: 5,),
                              Container(height: 40,width: 1,color: Colors.grey,),
                              Container(height: 50,width: 5,),
                              Expanded(child: InputFild(Title: "Last Name",Controler: LastName,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15,bottom: 15),
                          child: InputFild(Title: 'Role',Controler: Role,),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 0),
                          child:   IntlPhoneField(
                            controller: Phone,
                            decoration: InputDecoration(
                              labelText: 'Phone Number',contentPadding: EdgeInsets.only(top: 5),

                            ),
                            initialCountryCode: 'TR',
                            onChanged: (phone) {
                              print(phone.completeNumber);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0,bottom: 0),
                          child: InputFild(Title: 'Email',Controler: Email,),
                        ),

                        InputPasswordFild(Title: 'Password',Controler: Password,),
                        Padding(
                          padding: const EdgeInsets.only(top:12),
                          child: Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Checkbox(
                                    activeColor: Colors.black,
                                  value: rememberMe,
                                  onChanged: (_onRememberMeChanged)
                                         ),
                                  Text('By signing up, you agree to Terms of use',textAlign: TextAlign.start,style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),),
                                ],
                              )),
                        ),
                        SizedBox(height: 20,),
                        Center(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                isLoading = true;
                              });

                              Api.Sign_up(FirstName.text,LastName.text,Email.text,Password.text,Role.text,rememberMe.toString(),Phone.text).then((value){
                               if(value == true){
                                 // AwesomeDialog(
                                 //   context: context,
                                 //   animType: AnimType.SCALE,
                                 //   dialogType: DialogType.SUCCES,
                                 //   body: Center(child: Text(
                                 //     "The Sign-up has been successfully",
                                 //     style: TextStyle(),
                                 //   ),),
                                 //   title: '',
                                 //   desc:   '',
                                 //   btnOkOnPress: () {
                                 //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainPage(),));
                                 //   },
                                 // ).show();
                                 Fluttertoast.showToast(
                                     msg: "Successful..",
                                     toastLength: Toast.LENGTH_SHORT,
                                     gravity: ToastGravity.CENTER,
                                     timeInSecForIosWeb: 1,
                                     backgroundColor: Colors.red,
                                     textColor: Colors.white,
                                     fontSize: 16.0
                                 );

                               }else{
                                 // AwesomeDialog(
                                 //   btnOkColor: Colors.red,
                                 //   context: context,
                                 //   animType: AnimType.SCALE,
                                 //   dialogType: DialogType.ERROR,
                                 //   body: Center(child: Text(
                                 //     'Somthing went wrong make sure of your informations',textAlign: TextAlign.center,
                                 //     style: TextStyle(),
                                 //   ),),
                                 //   title: '',
                                 //   desc:   '',
                                 //   btnOkOnPress: () {
                                 //     Navigator.pop(context);
                                 //   },
                                 // ).show();
                                 Fluttertoast.showToast(
                                     msg: "Failed ... Try Again",
                                     toastLength: Toast.LENGTH_SHORT,
                                     gravity: ToastGravity.CENTER,
                                     timeInSecForIosWeb: 1,
                                     backgroundColor: Colors.red,
                                     textColor: Colors.white,
                                     fontSize: 16.0
                                 );
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
                                  color: Colors.orange
                              ),
                              child: Center(child: Text('CREATE ACCOUNT',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17
                              ),)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already a member?.',style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16
                              ),),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));

                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left:4.0),
                                  child: Text('Sign in',style: TextStyle(
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
                        // SizedBox(height: 10,),
                        // Center(child: OrDivider(OrTitle: "OR Register With",)),
                        // Padding(
                        //   padding: const EdgeInsets.only(top:10,bottom: 10),
                        //   child: Row(children: [
                        //     Expanded(
                        //       child: Padding(
                        //         padding: const EdgeInsets.only(right:4.0,top: 8),
                        //         child: Container(height: 60,
                        //           decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.all(Radius.circular(10)),
                        //               color: Color(0XFF4267B2)
                        //           ),
                        //           child: Padding(
                        //             padding: const EdgeInsets.only(right: 20,left: 20),
                        //             child: Row(
                        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //               children: [
                        //                 Icon(FontAwesomeIcons.facebookF,color: Colors.white,size: 30,),
                        //                 Text('Facebook',style: TextStyle(
                        //                     fontSize: 20,
                        //                     fontWeight: FontWeight.bold,
                        //                     color: Colors.white
                        //                 ),)
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //
                        //     ),
                        //     Expanded(
                        //       child: Padding(
                        //         padding: const EdgeInsets.only(right:5.0,top: 8),
                        //         child: Container(height: 60,
                        //           decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.all(Radius.circular(10)),
                        //               color: Color(0XFFDB4437)
                        //           ),
                        //           child: Padding(
                        //             padding: const EdgeInsets.only(left:25,right: 30),
                        //             child: Row(
                        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //               children: [
                        //                 Icon(FontAwesomeIcons.google,color: Colors.white,size: 30,),
                        //                 Text('Google',style: TextStyle(
                        //                     fontSize: 20,
                        //                     fontWeight: FontWeight.bold,
                        //                     color: Colors.white
                        //                 ),)
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     )
                        //   ],),
                        // ),

                      ],),
                    ),
                  ),

                ],),
              isLoading == true ?Loading():Container()
            ],
          ),
        ),


    );
  }
}
