import 'package:flutter/material.dart';
import 'package:hci_201/model/account.dart';
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(14, 20, 10, 0),
                width: MediaQuery.of(context).size.width * 0.98,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage("${widget.foodList[index].avatar}"),
                    fit: BoxFit.cover
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Card(
                  child: ListTile(
                    title: Text(
                      '${widget.foodList[index].name}',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'koho',
                        letterSpacing: 2.0
                      ),
                    ),
                    subtitle: Text(
                      '${widget.foodList[index].name} \n '
                          '${widget.chefList[index].name} - '
                          '${widget.chefList[index].star}',
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
