import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comerce/Models/HomePageCat.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Utlitis/API.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoryAll extends StatefulWidget {
  CategoryAll({this.resSeasonaloffers,this.resDailyoffers,this.result,this.resultImgs,this.resultseassional});
  List<dynamic> resDailyoffers = <dynamic>[];
  List<dynamic> resSeasonaloffers = <dynamic>[];
 List<Offer> result =  <Offer>[];
  List<String> resultImgs =  <String>[];
  List<Offer> resultseassional =  <Offer>[];
  @override
  _CategoryAllState createState() => _CategoryAllState();
}

class _CategoryAllState extends State<CategoryAll> {
  bool isloading = false;

  PageController _pageController;
  int index = 0;
  void changepage(){
    index++;
    pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
  }
  void changepageback(){
    index--;
    pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
  }
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: SingleChildScrollView(
            child: Column(
              children: [

//------------------------Dayoffers----------------------------------------------
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Day Offers',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Show All',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 360,
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.result.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Container(
                              width: 200,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    height: MediaQuery.of(context).size.height * .3,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.grey.shade200,
                                      image: DecorationImage(
                                          image: AssetImage('assets/images/rz.jpg'),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  // Container(
                                  //   width: double.infinity,
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.only(left: 15),
                                  //     child: Text(
                                  //       'sepette 12% indirem',
                                  //       style: TextStyle(
                                  //         fontSize: 10,
                                  //         color: Colors.green,
                                  //       ),
                                  //       textAlign: TextAlign.left,
                                  //     ),
                                  //   ),
                                  // ),
                                  Container(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        '${widget.result[index].currency} ${widget.result[index].price}',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.red,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   width: double.infinity,
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.only(left: 15),
                                  //     child: Text(
                                  //       '\$250 USD',
                                  //       style: TextStyle(
                                  //           fontSize: 8,
                                  //           color: Colors.grey,
                                  //           decoration: TextDecoration.lineThrough),
                                  //       textAlign: TextAlign.left,
                                  //     ),
                                  //   ),
                                  // ),
                                  Container(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        widget.result[index].name,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )


                  ],
                ),

//----------------------------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      'Our Advantages',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.grey.shade200),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Advantage 01",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.grey.shade200),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Advantage 02",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.grey.shade200),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Advantage 03",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'seasonal Offers',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Show All',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child:PageView.builder(
                        itemCount: widget.resultseassional.length,
                        controller: pageController,
                        itemBuilder: (BuildContext context, int itemIndex) {
                          return Container(
                            width: MediaQuery.of(context).size.width-20,
                            child: CarouselSlider(
                              options: CarouselOptions(
                                // onScrolled: (inx){
                                //
                                // },
                                enableInfiniteScroll: false,
                                viewportFraction: 1,
                                onPageChanged: (inx, reason) {
                                  if(inx == widget.resultImgs.length-1){
                                    setState(() {
                                      changepage();
                                    });
                                  }

                                },
                              ),
                              items: widget.resultImgs.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return   Container(
                                      margin: EdgeInsets.only(top: 10, bottom: 10),
                                      width: MediaQuery.of(context).size.width-2,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                        image: DecorationImage(
                                            image: NetworkImage(i),
                                            fit: BoxFit.contain),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          );
                        },
                      ),

                    )
//-----------------------------------------------------------------
                  ],
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      'Choose your style',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/img06.webp'),
                        fit: BoxFit.fill),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'for you',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Show All',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * .3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey.shade200,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/img08.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'sepette 12% indirem',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$150 USD',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$250 USD',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'AirPod 2020',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey.shade200,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/img09.webp'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'sepette 12% indirem',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$150 USD',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$250 USD',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'Galaxy Note 10 ultra',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Recently viewed',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Show All',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * .3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey.shade200,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/img08.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'sepette 12% indirem',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$150 USD',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$250 USD',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'AirPod 2020',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * .3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey.shade200,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/img09.webp'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'sepette 12% indirem',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$150 USD',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$250 USD',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'Galaxy Note 10 ultra',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Phones',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Show All',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * .3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey.shade200,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/img08.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'sepette 12% indirem',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$150 USD',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$250 USD',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'AirPod 2020',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * .3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey.shade200,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/img09.webp'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'sepette 12% indirem',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$150 USD',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$250 USD',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'Galaxy Note 10 ultra',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Televizyon',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Show All',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * .3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey.shade200,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/img08.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'sepette 12% indirem',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$150 USD',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$250 USD',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'AirPod 2020',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * .3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey.shade200,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/img09.webp'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'sepette 12% indirem',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$150 USD',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$250 USD',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'Galaxy Note 10 ultra',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Home shop',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Show All',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * .3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey.shade200,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/img08.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'sepette 12% indirem',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$150 USD',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$250 USD',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'AirPod 2020',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * .3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey.shade200,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/img09.webp'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'sepette 12% indirem',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$150 USD',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$250 USD',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'Galaxy Note 10 ultra',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Books',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Show All',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * .3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey.shade200,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/img08.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'sepette 12% indirem',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$150 USD',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$250 USD',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'AirPod 2020',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height * .3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey.shade200,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/img09.webp'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'sepette 12% indirem',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$150 USD',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  '\$250 USD',
                                  style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  'Galaxy Note 10 ultra',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        isloading == true ?Loading():Container(),
      ],
    );
  }
}
