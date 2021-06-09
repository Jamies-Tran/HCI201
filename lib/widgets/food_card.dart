import 'package:flutter/material.dart';
import 'package:hci_201/model/chef.dart';
import 'package:hci_201/model/food.dart';

class FoodCard extends StatefulWidget {

  List<Food> foodList = [];
  List<Chef> chefList = [];

  FoodCard({this.foodList, this.chefList});

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.foodList.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage("${widget.foodList[index].getAvatar()}"),
                    fit: BoxFit.cover
                  )
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Card(
                  child: ListTile(
                    title: Text(
                      '${widget.foodList[index].getName()}',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'koho',
                        letterSpacing: 2.0
                      ),
                    ),
                    subtitle: Text(
                      '${widget.foodList[index].getName()} \n '
                          '${widget.chefList[index].getName()} - '
                          '${widget.chefList[index].getStar()}',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'koho',
                          letterSpacing: 1.0
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 30),
            ],
          );
        }
    );
  }
}
