import 'package:flutter/material.dart';

class Accepted extends StatefulWidget {
  const Accepted({Key key}) : super(key: key);

  @override
  _AcceptedState createState() => _AcceptedState();
}

class _AcceptedState extends State<Accepted> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
              child: Text(
            'Checkout',
            style: TextStyle(
                color: Color(0xff0E516E),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          )),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 100),
            Container(
              height: 300,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/gift.png'),
                      fit: BoxFit.fitHeight)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Center(
                child: Text(
                  'Order Accepted',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Center(
              child: Container(
                  width: 300,
                  child: Text(
                    'Your order number #1223-444 has been placed',style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  )),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*.8,
                  height: 50,
                  child: Center(
                    child: Text(
                      'TRACK ORDERD',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xff0E516E),
                      borderRadius:
                      BorderRadius.all(Radius.circular(60))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
