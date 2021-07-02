import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_201/model/chef.dart';
import 'package:hci_201/model/chef_food.dart';
import 'package:hci_201/model/consumer.dart';
import 'package:hci_201/model/food.dart';
import 'package:hci_201/model/ingredient.dart';
import 'package:hci_201/service/iservice.dart';
import 'package:hci_201/service/serviceimpl.dart';
import 'package:hci_201/widgets/appbar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FoodInformation extends StatefulWidget {
  const FoodInformation({Key key}) : super(key: key);

  @override
  _FoodInformationState createState() => _FoodInformationState();
}

class _FoodInformationState extends State<FoodInformation> {

  int foodId;
  String chefEmail;
  String  conEmail;
  IService service;
  List<ChefFood> _chefFood;

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    service = ServiceImpl();
    foodId = data['food'];
    chefEmail = data['chef'];
    conEmail = data['conEmail'];
    Food _food = service.getFoodByID(foodId);
    Consumer _con = service.getConsumerByEmail(conEmail);
    _chefFood = [];
    _chefFood.addAll(service.getChefFood().where((e) => e.foodId.compareTo(foodId) == 0));
    Chef _chef = chefEmail != null ? service.getChefByEmail(chefEmail) : null;
    return Scaffold(
      appBar: MyAppBar(context, "${_food.title}"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height * 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //avatar
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("${_food.avatar}"),
                        fit: BoxFit.cover
                    )
                ),
              ),

              Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(_chef != null ? "${_chef.avatar}" : "assets/default_avatar.jpg"),
                            radius: 30,
                          ),
                          SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _chef != null ? "Bạn đang chọn " : "Bạn chưa chọn bếp cho món này",
                                style: TextStyle(
                                  fontSize: 23,
                                  fontFamily: 'robo',
                                  color: Colors.blueGrey
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if(_chef != null) {
                                    Navigator.pushNamed(context, "/chef_profile", arguments: {
                                    'chef' : _chef.email,
                                    'acc' : _con
                                    });
                                  }
                                  },
                                child: Text(
                                  _chef != null ? "${_chef.name}." : ".",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'robo',
                                      fontWeight: FontWeight.bold,
                                      color: _chef != null ? Colors.red : Colors.black,
                                      decoration: TextDecoration.underline
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.1,
                          buttonColor: _chef != null ? Colors.green : Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: RaisedButton(
                            onPressed: (){
                              if(_chef == null) {
                                Navigator.pushNamed(context, "/quick_review", arguments: {
                                  'food' : foodId,
                                  'conEmail' : conEmail,
                                });
                              }else {
                                Navigator.pushReplacementNamed(context, "/booking", arguments: {
                                  'chefEmail' : _chef.email,
                                  'conEmail' : _con.email,
                                  'food' : _food.id
                                });
                              }
                            },
                            child: Text(
                              _chef != null ? "Đặt món" : "Chọn bếp",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'robo',
                                  color: Colors.white,
                                  letterSpacing: 1.0
                              ),
                            ),
                          )
                      ),
                  ],
                )
              ),

              // tiêu đề thành phần nguyên lệ
              Container(
                margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Text(
                  "Thành phần nguyên liệu",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'robo',
                      color: Colors.blueGrey
                  ),
                ),
              ),

              //nguyên liệu
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.25,
                margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(color: Colors.grey[300], spreadRadius: 3)
                    ]
                ),
                child: ListView.builder(
                  itemCount: _food.ingredientList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "${_food.ingredientList[index].name}",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blueGrey,
                                  fontFamily: 'robo'
                              ),
                            ),
                            SizedBox(width: 30),
                            Text(
                              "${_food.ingredientList[index].outputQuantity()}",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.amber,
                                  fontFamily: 'robo'
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                      ],
                    );
                  },
                ),
              ),

              // giá món ăn
              Container(
                margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        "Giá món ăn : ",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'robo',
                            letterSpacing: 1.0
                        )
                    ),
                    Icon(Icons.account_balance_wallet, color: Colors.red),
                    Text(
                        "${_food.totalPriceByNumOrder(1).toInt()}.000 VND",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'robo',
                            letterSpacing: 1.0,
                            color: Colors.red
                        )
                    )
                  ],
                ),
              ),

              // tiêu đề đánh giá
              Container(
                margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Text(
                  "Đánh giá",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'robo',
                      color: Colors.blueGrey
                  ),
                ),
              ),

              // đánh giá sao
              Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RatingBar(
                        itemCount: 5,
                        itemSize: 50,
                        ignoreGestures: true,
                        allowHalfRating: true,
                        direction: Axis.horizontal,
                        initialRating: _food.star,
                        ratingWidget: RatingWidget(
                          full: Icon(Icons.star, color: Colors.amber),
                          half: Icon(Icons.star_half, color: Colors.amber),
                          empty: Icon(Icons.star_border_outlined, color: Colors.amber),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "${_food.star}/5 Sao",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'robo'
                        ),
                      )
                    ],
                  )
              ),

              // tiêu đề bình luận
              Container(
                margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Text(
                  "Bình luận",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'robo',
                      color: Colors.blueGrey
                  ),
                ),
              ),

              //bình luận
              Container(
                margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
                height: MediaQuery.of(context).size.height * 0.5,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("${service.getChefList()[0].avatar}"),
                            radius: 30,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${_con.name}",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'robo',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${_con.email}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'robo',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Row(
                                  children: [
                                    RatingBar(
                                      itemCount: 5,
                                      itemSize: 20,
                                      direction: Axis.horizontal,
                                      ignoreGestures: true,
                                      allowHalfRating: true,
                                      initialRating: 5,
                                      ratingWidget: RatingWidget(
                                          full: Icon(Icons.star, color: Colors.amber),
                                          half: Icon(Icons.star_half, color: Colors.amber),
                                          empty: Icon(Icons.star_border_outlined, color: Colors.amber)
                                      ),
                                    ),
                                    Text("1h")
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 250,
                        margin: EdgeInsets.fromLTRB(10, 15, 0, 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(color: Colors.grey[400],spreadRadius: 2.0)
                            ]
                        ),
                        child: Text(
                          "Món lạ nhưng vừa ăn, bếp nấu rất khéo vị vừa mồm không quá mặn hay quá nhạt",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'robo'
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("${service.getChefList()[1].avatar}"),
                            radius: 30,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${service.getConsumerList()[1].name}",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'robo',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${service.getConsumerList()[1].email}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'robo',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Row(
                                  children: [
                                    RatingBar(
                                      itemCount: 5,
                                      itemSize: 20,
                                      direction: Axis.horizontal,
                                      ignoreGestures: true,
                                      allowHalfRating: true,
                                      initialRating: 5,
                                      ratingWidget: RatingWidget(
                                          full: Icon(Icons.star, color: Colors.amber),
                                          half: Icon(Icons.star_half, color: Colors.amber),
                                          empty: Icon(Icons.star_border_outlined, color: Colors.amber)
                                      ),
                                    ),
                                    Text("1h")
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 250,
                        margin: EdgeInsets.fromLTRB(10, 15, 0, 20),
                        padding: EdgeInsets.fromLTRB(5, 5, 0, 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(color: Colors.grey[400],spreadRadius: 2.0)
                            ]
                        ),
                        child: Text(
                          "Một từ thôi, đỉnh của đỉnh",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'robo'
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("${service.getChefList()[2].avatar}"),
                            radius: 30,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${service.getConsumerList()[0].name}",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'robo',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${service.getConsumerList()[0].email}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'robo',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Row(
                                  children: [
                                    RatingBar(
                                      itemCount: 5,
                                      itemSize: 20,
                                      direction: Axis.horizontal,
                                      ignoreGestures: true,
                                      allowHalfRating: true,
                                      initialRating: 5,
                                      ratingWidget: RatingWidget(
                                          full: Icon(Icons.star, color: Colors.amber),
                                          half: Icon(Icons.star_half, color: Colors.amber),
                                          empty: Icon(Icons.star_border_outlined, color: Colors.amber)
                                      ),
                                    ),
                                    Text("1h")
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 250,
                        margin: EdgeInsets.fromLTRB(10, 15, 0, 20),
                        padding: EdgeInsets.fromLTRB(5, 5, 0, 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(color: Colors.grey[400],spreadRadius: 2.0)
                            ]
                        ),
                        child: Text(
                          "Well done good job em, món này quá oke em nhé, cứ thế phát huy. cho 5 sao nghen",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'robo'
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // if(chefEmail != null) {
    //   Chef _chef = service.getChefByEmail(chefEmail);
      // return Scaffold(
      //   appBar: MyAppBar(context, "${_food.title}"),
      //   body: SingleChildScrollView(
      //     scrollDirection: Axis.vertical,
      //     child: Container(
      //       height: MediaQuery.of(context).size.height * 1.75,
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           //avatar
      //           Container(
      //             width: MediaQuery.of(context).size.width,
      //             height: MediaQuery.of(context).size.height * 0.25,
      //             margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
      //             decoration: BoxDecoration(
      //                 image: DecorationImage(
      //                     image: AssetImage("${_food.avatar}"),
      //                     fit: BoxFit.cover
      //                 )
      //             ),
      //           ),
      //
      //           // chef infor
      //           Container(
      //             padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      //             margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.start,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 CircleAvatar(
      //                   backgroundImage: AssetImage("${_chef.avatar}"),
      //                   radius: 30,
      //                 ),
      //                 SizedBox(height: 20),
      //                 Row(
      //                   children: [
      //                     Text(
      //                       "Đây là món ${_food.name} của ",
      //                       style: TextStyle(
      //                           fontSize: 15,
      //                           fontFamily: 'robo',
      //                           color: Colors.blueGrey
      //                       ),
      //                     ),
      //                     GestureDetector(
      //                       onTap: () {
      //                         Navigator.pushNamed(context, "/chef_profile", arguments: {
      //                           'chef' : _chef.email,
      //                           'acc' : _con
      //                         });
      //                       },
      //                       child: Text(
      //                         "${_chef.name}",
      //                         style: TextStyle(
      //                             fontSize: 15,
      //                             fontFamily: 'robo',
      //                             fontWeight: FontWeight.bold,
      //                             color: Colors.red,
      //                             decoration: TextDecoration.underline
      //                         ),
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //
      //                 //ingredient
      //                 Container(
      //                   margin: EdgeInsets.fromLTRB(0, 30, 0, 5),
      //                   child: Text(
      //                     "Thành phần nguyên liệu",
      //                     style: TextStyle(
      //                         fontSize: 30,
      //                         fontWeight: FontWeight.bold,
      //                         fontFamily: 'robo',
      //                         color: Colors.blueGrey
      //                     ),
      //                   ),
      //                 ),
      //
      //                 Container(
      //                   width: MediaQuery.of(context).size.width * 0.95,
      //                   height: MediaQuery.of(context).size.height * 0.25,
      //                   margin: EdgeInsets.fromLTRB(0, 25, 0, 15),
      //                   decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(15),
      //                       boxShadow: [
      //                         BoxShadow(color: Colors.grey[300], spreadRadius: 3)
      //                       ]
      //                   ),
      //                   child: ListView.builder(
      //                     itemCount: _food.ingredientList.length,
      //                     itemBuilder: (context, index) {
      //                       return Column(
      //                         children: [
      //                           Row(
      //                             children: [
      //                               Text(
      //                                 "${_food.ingredientList[index].name}",
      //                                 style: TextStyle(
      //                                     fontSize: 20,
      //                                     color: Colors.blueGrey,
      //                                     fontFamily: 'robo'
      //                                 ),
      //                               ),
      //                               SizedBox(width: 10),
      //                               Text(
      //                                 "${_food.ingredientList[index].outputQuantity()}",
      //                                 style: TextStyle(
      //                                     fontSize: 20,
      //                                     color: Colors.blueGrey,
      //                                     fontFamily: 'robo'
      //                                 ),
      //                               ),
      //                               SizedBox(width: 10),
      //                               Text(
      //                                 "-",
      //                                 style: TextStyle(
      //                                     fontSize: 20,
      //                                     color: Colors.blueGrey,
      //                                     fontFamily: 'robo'
      //                                 ),
      //                               ),
      //                               SizedBox(width: 10),
      //                             ],
      //                           ),
      //                           SizedBox(height: 15),
      //                         ],
      //                       );
      //                     },
      //                   ),
      //                 ),
      //
      //                 Container(
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     children: [
      //                       Text(
      //                         "Giá món ăn : ",
      //                         style: TextStyle(
      //                           fontSize: 20,
      //                           fontFamily: 'robo',
      //                           letterSpacing: 1.0
      //                         )
      //                       ),
      //                       Icon(Icons.account_balance_wallet, color: Colors.red),
      //                       Text(
      //                           "${_food.totalPriceByNumOrder(1).toInt()}.000 VND",
      //                           style: TextStyle(
      //                               fontSize: 20,
      //                               fontFamily: 'robo',
      //                               letterSpacing: 1.0,
      //                               color: Colors.red
      //                           )
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //
      //                 Container(
      //                   margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
      //                   child: Text(
      //                     "Đánh giá",
      //                     style: TextStyle(
      //                         fontSize: 30,
      //                         fontWeight: FontWeight.bold,
      //                         fontFamily: 'robo',
      //                         color: Colors.blueGrey
      //                     ),
      //                   ),
      //                 ),
      //
      //                 Container(
      //                     margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       mainAxisAlignment: MainAxisAlignment.start,
      //                       children: [
      //                         RatingBar(
      //                           itemCount: 5,
      //                           itemSize: 50,
      //                           ignoreGestures: true,
      //                           allowHalfRating: true,
      //                           direction: Axis.horizontal,
      //                           initialRating: _food.star,
      //                           ratingWidget: RatingWidget(
      //                             full: Icon(Icons.star, color: Colors.amber),
      //                             half: Icon(Icons.star_half, color: Colors.amber),
      //                             empty: Icon(Icons.star_border_outlined, color: Colors.amber),
      //                           ),
      //                         ),
      //                         SizedBox(height: 10),
      //                         Text(
      //                           "${_food.star}/5 Sao",
      //                           style: TextStyle(
      //                               fontSize: 25,
      //                               fontFamily: 'robo'
      //                           ),
      //                         )
      //                       ],
      //                     )
      //                 ),
      //
      //                 Container(
      //                   margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
      //                   child: Text(
      //                     "Bình luận",
      //                     style: TextStyle(
      //                         fontSize: 30,
      //                         fontWeight: FontWeight.bold,
      //                         fontFamily: 'robo',
      //                         color: Colors.blueGrey
      //                     ),
      //                   ),
      //                 ),
      //
      //                 Container(
      //                   margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
      //                   height: MediaQuery.of(context).size.height * 0.5,
      //                   child: SingleChildScrollView(
      //                     scrollDirection: Axis.vertical,
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.start,
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Row(
      //                           children: [
      //                             CircleAvatar(
      //                               backgroundImage: AssetImage("${_chef.avatar}"),
      //                               radius: 30,
      //                             ),
      //                             Container(
      //                               child: Column(
      //                                 crossAxisAlignment: CrossAxisAlignment.start,
      //                                 mainAxisAlignment: MainAxisAlignment.start,
      //                                 children: [
      //                                   Text(
      //                                     "${_con.name}",
      //                                     style: TextStyle(
      //                                       fontSize: 25,
      //                                       fontFamily: 'robo',
      //                                       fontWeight: FontWeight.bold,
      //                                     ),
      //                                   ),
      //                                   Text(
      //                                     "${_con.email}",
      //                                     style: TextStyle(
      //                                       fontSize: 15,
      //                                       fontFamily: 'robo',
      //                                       fontWeight: FontWeight.normal,
      //                                     ),
      //                                   ),
      //                                   Row(
      //                                     children: [
      //                                       RatingBar(
      //                                         itemCount: 5,
      //                                         itemSize: 20,
      //                                         direction: Axis.horizontal,
      //                                         ignoreGestures: true,
      //                                         allowHalfRating: true,
      //                                         initialRating: 5,
      //                                         ratingWidget: RatingWidget(
      //                                             full: Icon(Icons.star, color: Colors.amber),
      //                                             half: Icon(Icons.star_half, color: Colors.amber),
      //                                             empty: Icon(Icons.star_border_outlined, color: Colors.amber)
      //                                         ),
      //                                       ),
      //                                       Text("1h")
      //                                     ],
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                         Container(
      //                           width: 250,
      //                           margin: EdgeInsets.fromLTRB(10, 15, 0, 20),
      //                           decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(15),
      //                               boxShadow: [
      //                                 BoxShadow(color: Colors.grey[400],spreadRadius: 2.0)
      //                               ]
      //                           ),
      //                           child: Text(
      //                             "Món lạ nhưng vừa ăn, bếp nấu rất khéo vị vừa mồm không quá mặn hay quá nhạt",
      //                             style: TextStyle(
      //                                 fontSize: 20,
      //                                 fontFamily: 'robo'
      //                             ),
      //                           ),
      //                         ),
      //                         Row(
      //                           children: [
      //                             CircleAvatar(
      //                               backgroundImage: AssetImage("${service.getChefList()[1].avatar}"),
      //                               radius: 30,
      //                             ),
      //                             Container(
      //                               child: Column(
      //                                 crossAxisAlignment: CrossAxisAlignment.start,
      //                                 mainAxisAlignment: MainAxisAlignment.start,
      //                                 children: [
      //                                   Text(
      //                                     "${service.getConsumerList()[1].name}",
      //                                     style: TextStyle(
      //                                       fontSize: 25,
      //                                       fontFamily: 'robo',
      //                                       fontWeight: FontWeight.bold,
      //                                     ),
      //                                   ),
      //                                   Text(
      //                                     "${service.getConsumerList()[1].email}",
      //                                     style: TextStyle(
      //                                       fontSize: 15,
      //                                       fontFamily: 'robo',
      //                                       fontWeight: FontWeight.normal,
      //                                     ),
      //                                   ),
      //                                   Row(
      //                                     children: [
      //                                       RatingBar(
      //                                         itemCount: 5,
      //                                         itemSize: 20,
      //                                         direction: Axis.horizontal,
      //                                         ignoreGestures: true,
      //                                         allowHalfRating: true,
      //                                         initialRating: 5,
      //                                         ratingWidget: RatingWidget(
      //                                             full: Icon(Icons.star, color: Colors.amber),
      //                                             half: Icon(Icons.star_half, color: Colors.amber),
      //                                             empty: Icon(Icons.star_border_outlined, color: Colors.amber)
      //                                         ),
      //                                       ),
      //                                       Text("1h")
      //                                     ],
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                         Container(
      //                           width: 250,
      //                           margin: EdgeInsets.fromLTRB(10, 15, 0, 20),
      //                           padding: EdgeInsets.fromLTRB(5, 5, 0, 10),
      //                           decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(15),
      //                               boxShadow: [
      //                                 BoxShadow(color: Colors.grey[400],spreadRadius: 2.0)
      //                               ]
      //                           ),
      //                           child: Text(
      //                             "Một từ thôi, đỉnh của đỉnh",
      //                             style: TextStyle(
      //                                 fontSize: 20,
      //                                 fontFamily: 'robo'
      //                             ),
      //                           ),
      //                         ),
      //                         Row(
      //                           children: [
      //                             CircleAvatar(
      //                               backgroundImage: AssetImage("${service.getChefList()[2].avatar}"),
      //                               radius: 30,
      //                             ),
      //                             Container(
      //                               child: Column(
      //                                 crossAxisAlignment: CrossAxisAlignment.start,
      //                                 mainAxisAlignment: MainAxisAlignment.start,
      //                                 children: [
      //                                   Text(
      //                                     "${service.getConsumerList()[0].name}",
      //                                     style: TextStyle(
      //                                       fontSize: 25,
      //                                       fontFamily: 'robo',
      //                                       fontWeight: FontWeight.bold,
      //                                     ),
      //                                   ),
      //                                   Text(
      //                                     "${service.getConsumerList()[0].email}",
      //                                     style: TextStyle(
      //                                       fontSize: 15,
      //                                       fontFamily: 'robo',
      //                                       fontWeight: FontWeight.normal,
      //                                     ),
      //                                   ),
      //                                   Row(
      //                                     children: [
      //                                       RatingBar(
      //                                         itemCount: 5,
      //                                         itemSize: 20,
      //                                         direction: Axis.horizontal,
      //                                         ignoreGestures: true,
      //                                         allowHalfRating: true,
      //                                         initialRating: 5,
      //                                         ratingWidget: RatingWidget(
      //                                             full: Icon(Icons.star, color: Colors.amber),
      //                                             half: Icon(Icons.star_half, color: Colors.amber),
      //                                             empty: Icon(Icons.star_border_outlined, color: Colors.amber)
      //                                         ),
      //                                       ),
      //                                       Text("1h")
      //                                     ],
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                         Container(
      //                           width: 250,
      //                           margin: EdgeInsets.fromLTRB(10, 15, 0, 20),
      //                           padding: EdgeInsets.fromLTRB(5, 5, 0, 10),
      //                           decoration: BoxDecoration(
      //                               borderRadius: BorderRadius.circular(15),
      //                               boxShadow: [
      //                                 BoxShadow(color: Colors.grey[400],spreadRadius: 2.0)
      //                               ]
      //                           ),
      //                           child: Text(
      //                             "Well done good job em, món này quá oke em nhé, cứ thế phát huy. cho 5 sao nghen",
      //                             style: TextStyle(
      //                                 fontSize: 20,
      //                                 fontFamily: 'robo'
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Center(
      //             child: ButtonTheme(
      //                 minWidth: MediaQuery.of(context).size.width * 0.75,
      //                 height: MediaQuery.of(context).size.height * 0.1,
      //                 buttonColor: Colors.red,
      //                 shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(15)
      //                 ),
      //                 child: RaisedButton(
      //                   onPressed: (){},
      //                   child: Text(
      //                     "Đặt món",
      //                     style: TextStyle(
      //                         fontSize: 25,
      //                         fontWeight: FontWeight.bold,
      //                         fontFamily: 'robo',
      //                         color: Colors.white,
      //                         letterSpacing: 1.0
      //                     ),
      //                   ),
      //                 )
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // );
    // }else {
    //   return Scaffold(
    //     appBar: MyAppBar(context, "${_food.title}"),
    //     body: SingleChildScrollView(
    //       scrollDirection: Axis.vertical,
    //       child: Container(
    //         height: MediaQuery.of(context).size.height * 1.75,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             //avatar
    //             Container(
    //               width: MediaQuery.of(context).size.width,
    //               height: MediaQuery.of(context).size.height * 0.25,
    //               margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
    //               decoration: BoxDecoration(
    //                   image: DecorationImage(
    //                       image: AssetImage("${_food.avatar}"),
    //                       fit: BoxFit.cover
    //                   )
    //               ),
    //             ),
    //
    //             // chef infor
    //             Container(
    //               padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
    //               margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Container(
    //                     child: TextButton(
    //                       child: Text(
    //                           "Chọn bếp",
    //                           style: TextStyle(
    //                             fontSize: 25,
    //                             fontFamily: 'robo',
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.red,
    //                             decoration: TextDecoration.underline
    //                           ),
    //                       ),
    //                       onPressed: () {
    //                         Navigator.pushNamed(context, "/quick_review", arguments: {
    //                           'foodId' : foodId,
    //                           'conEmail' : conEmail
    //                         });
    //                       },
    //                     ),
    //                   ),
    //
    //                   //ingredient
    //                   Container(
    //                     margin: EdgeInsets.fromLTRB(0, 30, 0, 5),
    //                     child: Text(
    //                       "Thành phần nguyên liệu",
    //                       style: TextStyle(
    //                           fontSize: 30,
    //                           fontWeight: FontWeight.bold,
    //                           fontFamily: 'robo',
    //                           color: Colors.blueGrey
    //                       ),
    //                     ),
    //                   ),
    //
    //                   Container(
    //                     width: MediaQuery.of(context).size.width * 0.95,
    //                     height: MediaQuery.of(context).size.height * 0.25,
    //                     margin: EdgeInsets.fromLTRB(0, 25, 0, 15),
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(15),
    //                         boxShadow: [
    //                           BoxShadow(color: Colors.grey[300], spreadRadius: 3)
    //                         ]
    //                     ),
    //                     child: ListView.builder(
    //                       itemCount: _food.ingredientList.length,
    //                       itemBuilder: (context, index) {
    //                         return Column(
    //                           children: [
    //                             Row(
    //                               children: [
    //                                 Text(
    //                                   "${_food.ingredientList[index].name}",
    //                                   style: TextStyle(
    //                                       fontSize: 20,
    //                                       color: Colors.blueGrey,
    //                                       fontFamily: 'robo'
    //                                   ),
    //                                 ),
    //                                 SizedBox(width: 10),
    //                                 Text(
    //                                   "-",
    //                                   style: TextStyle(
    //                                       fontSize: 20,
    //                                       color: Colors.blueGrey,
    //                                       fontFamily: 'robo'
    //                                   ),
    //                                 ),
    //                                 SizedBox(width: 10),
    //                                 Text(
    //                                   "${_food.ingredientList[index].outputQuantity()}",
    //                                   style: TextStyle(
    //                                       fontSize: 20,
    //                                       color: Colors.blueGrey,
    //                                       fontFamily: 'robo'
    //                                   ),
    //                                 ),
    //                                 SizedBox(width: 10),
    //                                 Text(
    //                                   "-",
    //                                   style: TextStyle(
    //                                       fontSize: 20,
    //                                       color: Colors.blueGrey,
    //                                       fontFamily: 'robo'
    //                                   ),
    //                                 ),
    //                                 SizedBox(width: 10),
    //                                 Icon(Icons.account_balance_wallet, color: Colors.red, size: 20),
    //                                 Text(
    //                                   "${_food.ingredientList[index].price.toInt()}.000",
    //                                   style: TextStyle(
    //                                       fontSize: 20,
    //                                       color: Colors.red,
    //                                       fontFamily: 'robo'
    //                                   ),
    //                                 )
    //                               ],
    //                             ),
    //                             SizedBox(height: 15),
    //                           ],
    //                         );
    //                       },
    //                     ),
    //                   ),
    //
    //                   Container(
    //                     margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
    //                     child: Text(
    //                       "Đánh giá",
    //                       style: TextStyle(
    //                           fontSize: 30,
    //                           fontWeight: FontWeight.bold,
    //                           fontFamily: 'robo',
    //                           color: Colors.blueGrey
    //                       ),
    //                     ),
    //                   ),
    //
    //                   Container(
    //                       margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         children: [
    //                           RatingBar(
    //                             itemCount: 5,
    //                             itemSize: 50,
    //                             ignoreGestures: true,
    //                             allowHalfRating: true,
    //                             direction: Axis.horizontal,
    //                             initialRating: _food.star,
    //                             ratingWidget: RatingWidget(
    //                               full: Icon(Icons.star, color: Colors.amber),
    //                               half: Icon(Icons.star_half, color: Colors.amber),
    //                               empty: Icon(Icons.star_border_outlined, color: Colors.amber),
    //                             ),
    //                           ),
    //                           SizedBox(height: 10),
    //                           Text(
    //                             "${_food.star}/5 Sao",
    //                             style: TextStyle(
    //                                 fontSize: 25,
    //                                 fontFamily: 'robo'
    //                             ),
    //                           )
    //                         ],
    //                       )
    //                   ),
    //
    //                   Container(
    //                     margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
    //                     child: Text(
    //                       "Bình luận",
    //                       style: TextStyle(
    //                           fontSize: 30,
    //                           fontWeight: FontWeight.bold,
    //                           fontFamily: 'robo',
    //                           color: Colors.blueGrey
    //                       ),
    //                     ),
    //                   ),
    //
    //                   Container(
    //                     margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
    //                     height: MediaQuery.of(context).size.height * 0.5,
    //                     child: SingleChildScrollView(
    //                       scrollDirection: Axis.vertical,
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Row(
    //                             children: [
    //                               CircleAvatar(
    //                                 backgroundImage: AssetImage("${service.getChefList()[0].avatar}"),
    //                                 radius: 30,
    //                               ),
    //                               Container(
    //                                 child: Column(
    //                                   crossAxisAlignment: CrossAxisAlignment.start,
    //                                   mainAxisAlignment: MainAxisAlignment.start,
    //                                   children: [
    //                                     Text(
    //                                       "${_con.name}",
    //                                       style: TextStyle(
    //                                         fontSize: 25,
    //                                         fontFamily: 'robo',
    //                                         fontWeight: FontWeight.bold,
    //                                       ),
    //                                     ),
    //                                     Text(
    //                                       "${_con.email}",
    //                                       style: TextStyle(
    //                                         fontSize: 15,
    //                                         fontFamily: 'robo',
    //                                         fontWeight: FontWeight.normal,
    //                                       ),
    //                                     ),
    //                                     Row(
    //                                       children: [
    //                                         RatingBar(
    //                                           itemCount: 5,
    //                                           itemSize: 20,
    //                                           direction: Axis.horizontal,
    //                                           ignoreGestures: true,
    //                                           allowHalfRating: true,
    //                                           initialRating: 5,
    //                                           ratingWidget: RatingWidget(
    //                                               full: Icon(Icons.star, color: Colors.amber),
    //                                               half: Icon(Icons.star_half, color: Colors.amber),
    //                                               empty: Icon(Icons.star_border_outlined, color: Colors.amber)
    //                                           ),
    //                                         ),
    //                                         Text("1h")
    //                                       ],
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                           Container(
    //                             width: 250,
    //                             margin: EdgeInsets.fromLTRB(10, 15, 0, 20),
    //                             decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.circular(15),
    //                                 boxShadow: [
    //                                   BoxShadow(color: Colors.grey[400],spreadRadius: 2.0)
    //                                 ]
    //                             ),
    //                             child: Text(
    //                               "Món lạ nhưng vừa ăn, bếp nấu rất khéo vị vừa mồm không quá mặn hay quá nhạt",
    //                               style: TextStyle(
    //                                   fontSize: 20,
    //                                   fontFamily: 'robo'
    //                               ),
    //                             ),
    //                           ),
    //                           Row(
    //                             children: [
    //                               CircleAvatar(
    //                                 backgroundImage: AssetImage("${service.getChefList()[1].avatar}"),
    //                                 radius: 30,
    //                               ),
    //                               Container(
    //                                 child: Column(
    //                                   crossAxisAlignment: CrossAxisAlignment.start,
    //                                   mainAxisAlignment: MainAxisAlignment.start,
    //                                   children: [
    //                                     Text(
    //                                       "${service.getConsumerList()[1].name}",
    //                                       style: TextStyle(
    //                                         fontSize: 25,
    //                                         fontFamily: 'robo',
    //                                         fontWeight: FontWeight.bold,
    //                                       ),
    //                                     ),
    //                                     Text(
    //                                       "${service.getConsumerList()[1].email}",
    //                                       style: TextStyle(
    //                                         fontSize: 15,
    //                                         fontFamily: 'robo',
    //                                         fontWeight: FontWeight.normal,
    //                                       ),
    //                                     ),
    //                                     Row(
    //                                       children: [
    //                                         RatingBar(
    //                                           itemCount: 5,
    //                                           itemSize: 20,
    //                                           direction: Axis.horizontal,
    //                                           ignoreGestures: true,
    //                                           allowHalfRating: true,
    //                                           initialRating: 5,
    //                                           ratingWidget: RatingWidget(
    //                                               full: Icon(Icons.star, color: Colors.amber),
    //                                               half: Icon(Icons.star_half, color: Colors.amber),
    //                                               empty: Icon(Icons.star_border_outlined, color: Colors.amber)
    //                                           ),
    //                                         ),
    //                                         Text("1h")
    //                                       ],
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                           Container(
    //                             width: 250,
    //                             margin: EdgeInsets.fromLTRB(10, 15, 0, 20),
    //                             padding: EdgeInsets.fromLTRB(5, 5, 0, 10),
    //                             decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.circular(15),
    //                                 boxShadow: [
    //                                   BoxShadow(color: Colors.grey[400],spreadRadius: 2.0)
    //                                 ]
    //                             ),
    //                             child: Text(
    //                               "Một từ thôi, đỉnh của đỉnh",
    //                               style: TextStyle(
    //                                   fontSize: 20,
    //                                   fontFamily: 'robo'
    //                               ),
    //                             ),
    //                           ),
    //                           Row(
    //                             children: [
    //                               CircleAvatar(
    //                                 backgroundImage: AssetImage("${service.getChefList()[2].avatar}"),
    //                                 radius: 30,
    //                               ),
    //                               Container(
    //                                 child: Column(
    //                                   crossAxisAlignment: CrossAxisAlignment.start,
    //                                   mainAxisAlignment: MainAxisAlignment.start,
    //                                   children: [
    //                                     Text(
    //                                       "${service.getConsumerList()[0].name}",
    //                                       style: TextStyle(
    //                                         fontSize: 25,
    //                                         fontFamily: 'robo',
    //                                         fontWeight: FontWeight.bold,
    //                                       ),
    //                                     ),
    //                                     Text(
    //                                       "${service.getConsumerList()[0].email}",
    //                                       style: TextStyle(
    //                                         fontSize: 15,
    //                                         fontFamily: 'robo',
    //                                         fontWeight: FontWeight.normal,
    //                                       ),
    //                                     ),
    //                                     Row(
    //                                       children: [
    //                                         RatingBar(
    //                                           itemCount: 5,
    //                                           itemSize: 20,
    //                                           direction: Axis.horizontal,
    //                                           ignoreGestures: true,
    //                                           allowHalfRating: true,
    //                                           initialRating: 5,
    //                                           ratingWidget: RatingWidget(
    //                                               full: Icon(Icons.star, color: Colors.amber),
    //                                               half: Icon(Icons.star_half, color: Colors.amber),
    //                                               empty: Icon(Icons.star_border_outlined, color: Colors.amber)
    //                                           ),
    //                                         ),
    //                                         Text("1h")
    //                                       ],
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                           Container(
    //                             width: 250,
    //                             margin: EdgeInsets.fromLTRB(10, 15, 0, 20),
    //                             padding: EdgeInsets.fromLTRB(5, 5, 0, 10),
    //                             decoration: BoxDecoration(
    //                                 borderRadius: BorderRadius.circular(15),
    //                                 boxShadow: [
    //                                   BoxShadow(color: Colors.grey[400],spreadRadius: 2.0)
    //                                 ]
    //                             ),
    //                             child: Text(
    //                               "Well done good job em, món này quá oke em nhé, cứ thế phát huy. cho 5 sao nghen",
    //                               style: TextStyle(
    //                                   fontSize: 20,
    //                                   fontFamily: 'robo'
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Center(
    //               child: ButtonTheme(
    //                   minWidth: MediaQuery.of(context).size.width * 0.75,
    //                   height: MediaQuery.of(context).size.height * 0.1,
    //                   buttonColor: Colors.red,
    //                   shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(15)
    //                   ),
    //                   child: RaisedButton(
    //                     onPressed: (){},
    //                     child: Text(
    //                       "Đặt món",
    //                       style: TextStyle(
    //                           fontSize: 25,
    //                           fontWeight: FontWeight.bold,
    //                           fontFamily: 'robo',
    //                           color: Colors.white,
    //                           letterSpacing: 1.0
    //                       ),
    //                     ),
    //                   )
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
    }
  }

