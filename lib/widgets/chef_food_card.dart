import 'package:flutter/material.dart';
import 'package:hci_201/model/chef_food.dart';
import 'package:hci_201/model/consumer.dart';
import 'package:hci_201/model/food.dart';
import 'package:hci_201/service/iservice.dart';
import 'package:hci_201/service/serviceimpl.dart';

class ChefFoodCard extends StatelessWidget {

  List<ChefFood> chefFoodList = [];
  IService service = ServiceImpl();
  Food _getFood(int id) => service.getFoodByID(id);
  String conEmail;

  ChefFoodCard({this.chefFoodList, this.conEmail});


  void onTapFunc(BuildContext context, int index) {
    Navigator.pushNamed(context, '/food_info', arguments: {
      'food' : chefFoodList[index].foodId,
      'chef' : chefFoodList[index].chefEmail,
      'conEmail' : conEmail
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        itemCount: chefFoodList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return Row(
            children: [
              GestureDetector(
                onTap: (){
                  onTapFunc(context, index);
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("${_getFood(chefFoodList[index].foodId).avatar}"),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Container(

                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Text(
                          "${_getFood(chefFoodList[index].foodId).title}",
                          style: TextStyle(
                              fontSize: 30,
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
