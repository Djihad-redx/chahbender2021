import 'package:e_comerce/Screens/Pages/checkout_page1.dart';
import 'package:e_comerce/Utlitis/General.dart';
import 'package:flutter/material.dart';

import 'default_button.dart';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({
    Key key,
  }) : super(key: key);

  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(right: 20,left: 20,bottom: 10,top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Total:",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                  ),
                  Text("75.15 \$",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.green
                  ),),
                ],
              ),
              SizedBox(
                width: 230,
                child: DefaultButton(
                  text: "Check Out",
                  press: () {
                    setState(() {
                    //  General().setProductincartnull();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Checkout1(),));
                    });


                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
