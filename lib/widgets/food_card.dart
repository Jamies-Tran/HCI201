import 'package:flutter/material.dart';
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
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("${widget.foodList[index].avatar}"),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(15)
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
