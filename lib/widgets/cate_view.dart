import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_201/model/category.dart';
import 'package:hci_201/model/category.dart';
import 'package:hci_201/model/consumer.dart';
import 'package:hci_201/service/iservice.dart';
import 'package:hci_201/service/serviceimpl.dart';


class Category_View extends StatelessWidget {

  List<Category> cateList;
  String conEmail;
  Category_View({this.cateList, this.conEmail});
  void onTapFunc(BuildContext context , String cateId) {
    Navigator.pushNamed(context, '/show_food', arguments: {
      'cateId' : cateId,
      'conEmail' : conEmail
    });
  }

  @override
  Widget build(BuildContext context) {
    Map category = {
      "breakfast" : cateList[0].id,
      "dinner" : cateList[1].id,
      "lunch" : cateList[2].id,
      "healthy" : cateList[3].id,
      "desert" : cateList[4].id,
      "drink" : cateList[5].id,
    };
    IService service = ServiceImpl();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      onTapFunc(context, category["breakfast"]);
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 60, 0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("${service.getCategoryById(category["breakfast"]).image}"),
                            radius: 35,
                          ),
                          Text(
                              "${service.getCategoryById(category["breakfast"]).title}",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'robo'
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onTapFunc(context, category["lunch"]);
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("${service.getCategoryById(category["lunch"]).image}"),
                            radius: 35,
                          ),
                          Text(
                            "${service.getCategoryById(category["lunch"]).title}",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'robo'
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onTapFunc(context, category["dinner"]);
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(80, 0, 0, 0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("${service.getCategoryById(category["dinner"]).image}"),
                            radius: 35,
                          ),
                          Text(
                            "${service.getCategoryById(category["dinner"]).title}",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'robo'
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      onTapFunc(context, category["healthy"]);
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 60, 0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("${service.getCategoryById(category["healthy"]).image}"),
                            radius: 35,
                          ),
                          Text(
                            "${service.getCategoryById(category["healthy"]).title}",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'robo'
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onTapFunc(context, category["desert"]);
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("${service.getCategoryById(category["desert"]).image}"),
                            radius: 35,
                          ),
                          Text(
                            "${service.getCategoryById(category["desert"]).title}",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'robo'
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onTapFunc(context, category["drink"]);
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("${service.getCategoryById(category["drink"]).image}"),
                            radius: 35,
                          ),
                          Text(
                            "${service.getCategoryById(category["drink"]).title}",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'robo'
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ]
          ),
        ),
        // child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: cateList.length - 3,
        //     itemBuilder: (context, index) {
        //       if(index != 0) {
        //         index = cache + 1;
        //       }
        //       cache = index + 1;
        //       return Row(
        //         children: [
        //           Column(
        //             children: [
        //               GestureDetector(
        //                 onTap: () {
        //                   onTapFunc(context, index);
        //                 },
        //                 child: Container(
        //                   width: 350,
        //                   height: 150,
        //                   margin: EdgeInsets.all(10),
        //                   padding: EdgeInsets.fromLTRB(50, 60, 50, 0),
        //                   //padding: EdgeInsets.fromLTRB(50, 70, 50, 50),
        //                   decoration: BoxDecoration(
        //                       image: DecorationImage(
        //                         image: AssetImage("${cateList[index].image}"),
        //                         fit: BoxFit.cover
        //                       ),
        //                       border: Border.all(
        //                         width: 3.0,
        //                         color: Colors.redAccent
        //                       ),
        //                       borderRadius: BorderRadius.circular(15)
        //                   ),
        //                   child: Text(
        //                     "${cateList[index].title}",
        //                     style: TextStyle(
        //                       fontSize: 25,
        //                       fontFamily: 'robo',
        //                       fontWeight: FontWeight.bold,
        //                       color: Colors.white
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               GestureDetector(
        //                 onTap: () {
        //                   onTapFunc(context, index + 1);
        //                 },
        //                 child: Container(
        //                   width: 350,
        //                   height: 150,
        //                   margin: EdgeInsets.all(10),
        //                   padding: EdgeInsets.fromLTRB(50, 60, 50, 0),
        //                   decoration: BoxDecoration(
        //                       image: DecorationImage(
        //                           image: AssetImage("${cateList[cache].image}"),
        //                           fit: BoxFit.cover
        //                       ),
        //                       border: Border.all(
        //                           width: 3.0,
        //                           color: Colors.redAccent
        //                       ),
        //                       borderRadius: BorderRadius.circular(15)
        //                   ),
        //                   child: Text(
        //                     "${cateList[cache].title}",
        //                     style: TextStyle(
        //                         fontSize: 25,
        //                         fontFamily: 'robo',
        //                         fontWeight: FontWeight.bold,
        //                         color: Colors.white
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //
        //         ],
        //       );
        //     }
        // ),
      ),
    );
  }
}
