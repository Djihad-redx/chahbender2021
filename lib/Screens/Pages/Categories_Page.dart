import 'package:e_comerce/Models/HomePageCat.dart';
import 'package:e_comerce/Screens/Helpers/HeaderAppBare.dart';
import 'package:e_comerce/Screens/Helpers/Loading.dart';
import 'package:e_comerce/Screens/Pages/SubCategories.dart';
import 'package:e_comerce/Utlitis/API.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({this.mycontext});

  BuildContext mycontext;

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  static Categories result = null;
  bool isloading = false;
  int page = 1;
  int index = 0;

  @override
  void initState() {
    page = 1;

    if (result == null) {
      setState(() {
        isloading = true;
      });
      Api.LoadCategoriesCat().then((value) {
        result = value;
        setState(() {
          isloading = false;
        });
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: isloading == true
            ? Loading()
            : page == 1
                ? Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                        padding: EdgeInsets.only(top: 0),
                        itemCount: result.data.menuCategory.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                page = 2;
                                this.index = index;
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(5, 0, 15, 0),
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/np.png')),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: Colors.grey.shade200),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .35,
                                              child: Text(
                                                result.data.menuCategory[index]
                                                    .name,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0),
                                              child: Text(
                                                '$index Items',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 25,
                                      ),
                                    )
                                  ],
                                )),
                          );
                        },
                      ))
                    ],
                  )
                : SubCategories(
                    result: result,
                    subcategories: result.data.menuCategory[index].children,
                    mycontext: widget.mycontext,
                  ));
  }
}
