import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hci_201/model/consumer.dart';
import 'package:hci_201/model/food.dart';
import 'package:hci_201/service/iservice.dart';
import 'package:hci_201/service/serviceimpl.dart';

class FoodCard extends StatefulWidget {

  List<Food> foodList = [];
  Consumer con;

  FoodCard({this.foodList, this.con});

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {

  IService service = ServiceImpl();

  String name;

  Consumer _con2;

  void onTapFunc(int index) {
    Navigator.pushNamed(context, '/show_cooker', arguments: {
      'food' : widget.foodList[index],
      'conEmail' : widget.con.email
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        itemCount: widget.foodList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return Row(
            children: [
              GestureDetector(
                onTap: (){
                  onTapFunc(index);
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(14, 20, 10, 0),
                        padding: EdgeInsets.fromLTRB(0, 250, 0, 0),
                        width: MediaQuery.of(context).size.width * 0.98,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("${widget.foodList[index].avatar}"),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Container(
                          color: Colors.black54,
                          child: Column(
                            children: [
                              RatingBar(
                                  itemCount: 5,
                                  allowHalfRating: true,
                                  ignoreGestures: true,
                                  initialRating: widget.foodList[index].star,
                                  direction: Axis.horizontal,
                                  itemSize: 25,
                                  ratingWidget: RatingWidget(
                                    full: Icon(Icons.star, color: Colors.amber),
                                    half: Icon(Icons.star_half, color: Colors.amber),
                                    empty: Icon(Icons.star_border_outlined, color: Colors.amber,)
                                  ),
                              ),
                              Text("${widget.foodList[index].totalPrice().toInt()}.000 VND", style: TextStyle(fontSize: 25, fontFamily: 'robo', fontWeight: FontWeight.bold, color: Colors.amberAccent)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Text(
                          "${widget.foodList[index].title}",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'robo'
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20)
            ],
          );
        },
      ),
    );
  }
}
