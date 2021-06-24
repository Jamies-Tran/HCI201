import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_201/model/category.dart';
import 'package:hci_201/model/category.dart';


class Category_View extends StatelessWidget {

  List<Category> cateList;
  Category_View({this.cateList});
  void onTapFunc(BuildContext context , int index) {
    Navigator.pushNamed(context, '/show_food', arguments: {
      'cateId' : cateList[index].id
    });
  }

  @override
  Widget build(BuildContext context) {
    int cache = 0;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 2.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cateList.length - 3,
            itemBuilder: (context, index) {
              if(index != 0) {
                index = cache + 1;
              }
              cache = index + 1;
              return Row(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          onTapFunc(context, index);
                        },
                        child: Container(
                          width: 350,
                          height: 150,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.fromLTRB(50, 60, 50, 0),
                          //padding: EdgeInsets.fromLTRB(50, 70, 50, 50),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("${cateList[index].image}"),
                                fit: BoxFit.cover
                              ),
                              border: Border.all(
                                width: 3.0,
                                color: Colors.redAccent
                              ),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Text(
                            "${cateList[index].title}",
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'robo',
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          onTapFunc(context, index + 1);
                        },
                        child: Container(
                          width: 350,
                          height: 150,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.fromLTRB(50, 60, 50, 0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("${cateList[cache].image}"),
                                  fit: BoxFit.cover
                              ),
                              border: Border.all(
                                  width: 3.0,
                                  color: Colors.redAccent
                              ),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Text(
                            "${cateList[cache].title}",
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'robo',
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              );
            }
        ),
      ),
    );
  }
}
