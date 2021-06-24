import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hci_201/model/chef.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hci_201/model/consumer.dart';
import 'package:hci_201/model/food.dart';
import 'package:hci_201/model/get_enum.dart';
import 'package:hci_201/service/iservice.dart';
import 'package:hci_201/service/serviceimpl.dart';

class ChefCard extends StatefulWidget {

  List<Chef> chefList = [];

  Consumer con;

  Axis scrollDicrect;

  Wid_Type widType;

  Food food;

  ChefCard({this.chefList, this.con, this.food, this.scrollDicrect, this.widType});

  @override
  _ChefCardState createState() => _ChefCardState();
}

class _ChefCardState extends State<ChefCard> {

  IService service = ServiceImpl();

  void onTapFunc(int index, Consumer _con) {
    if(widget.widType != Wid_Type.BOOKING) {
      Navigator.pushNamed(context, "/chef_profile", arguments: {
        'widget' : widget.widType,
        'chef' : widget.chefList[index].email,
        'acc' : _con
      });
    }else if(widget.widType == Wid_Type.BOOKING){
      Navigator.pushNamed(context, "/booking", arguments: {
        'widget' : widget.widType,
        'chef' : widget.chefList[index].email,
        'food' : widget.food.id,
        'acc' : _con
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if(widget.widType != Wid_Type.BOOKING) {
      if(widget.widType == Wid_Type.PROFILE_DISTANCE) {
        widget.chefList.sort((a ,b) => a.distance.compareTo(b.distance));
      } else if(widget.widType == Wid_Type.PROFILE_STAR) {
        widget.chefList.sort((a ,b) => a.star.compareTo(b.star));
        widget.chefList = widget.chefList.reversed.toList();
      }
    }else {
      widget.chefList.sort((a ,b) => a.star.compareTo(b.star));
      widget.chefList = widget.chefList.reversed.toList();
    }
    return ListView.builder(
        scrollDirection: widget.scrollDicrect,
        itemCount: widget.chefList.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  onTapFunc(index, widget.con);
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(14, 20, 10, 0),
                  padding: EdgeInsets.fromLTRB(0, 250, 0, 0),
                  // cac widget duoc tao boi ListView.builder se phai duoc dat trong container de
                  // tranh truong hop height cua widget bang infinite
                  width: MediaQuery.of(context).size.width * 0.98,
                  // day la height container chua image avatar
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: AssetImage("${widget.chefList[index].avatar}"),
                          fit: BoxFit.cover
                      )
                  ),
                  child: Container(
                    color: Colors.black54,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(15, 15, 0, 15),
                              child: Text(
                                "${widget.chefList[index].name}",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'robo',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                            ),
                            RatingBar(
                                ignoreGestures: true,
                                allowHalfRating: true,
                                itemCount: 5,
                                direction: Axis.horizontal,
                                initialRating: widget.chefList[index].star,
                                ratingWidget: RatingWidget(
                                    empty: Icon(Icons.star_border_outlined, color: Colors.amber, size: 20),
                                    half: Icon(Icons.star_half, color: Colors.amber, size: 20),
                                    full: Icon(Icons.star, color: Colors.amber, size: 20)
                                )
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(15, 10, 0, 15),
                          child: Text(
                            "Location: ${widget.chefList[index].addr} - ${widget.chefList[index].distance}km",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'robo',
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(15, 10, 0, 15),
                          child: Row(
                            children: [
                              Text(
                                "Price: ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'robo',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                              Text(
                                "${widget.chefList[index].price}VND",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'robo',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red
                                ),
                              )
                            ]
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // SizedBox(width: 30),
              // Container(
              //   margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
              //   // cac widget duoc tao boi ListView.builder se phai duoc dat trong container de
              //   // tranh truong hop height cua widget bang infinite
              //   width: MediaQuery.of(context).size.width * 1.0,
              //   // day la height container chua cac listile
              //   height: MediaQuery.of(context).size.height * 0.3,
              //   child: Card(
              //     child: ListTile(
              //       title: Text(
              //         //name
              //         '${widget.chefList[index].name}',
              //         style: TextStyle(
              //             fontSize: 35,
              //             fontFamily: 'robo',
              //             fontWeight: FontWeight.bold,
              //             letterSpacing: 2.0
              //         ),
              //       ),
              //       subtitle: Text(
              //         '${widget.chefList[index].email} ''\n\n${widget.chefList[index].price} VND/hours , ${widget.chefList[index].star} star ''\n\n${widget.chefList[index].addr} - 4.3km \n',
              //         style: TextStyle(
              //             fontSize: 25,
              //             fontFamily: 'robo',
              //             letterSpacing: 1.0
              //         ),
              //       ),
              //       onTap: () {
              //         onTapFunc(index, widget.con);
              //       },
              //     ),
              //   ),
              // ),
              // SizedBox(width: 30),
            ]
          );
        }
    );
  }
}
