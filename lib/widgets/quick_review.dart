import 'package:flutter/material.dart';
import 'package:hci_201/model/chef.dart';
import 'package:hci_201/model/chef_food.dart';
import 'package:hci_201/model/consumer.dart';
import 'package:hci_201/service/iservice.dart';
import 'package:hci_201/service/serviceimpl.dart';
import 'package:hci_201/widgets/appbar.dart';

class QuickReview extends StatefulWidget {
  const QuickReview({Key key}) : super(key: key);

  @override
  _QuickReviewState createState() => _QuickReviewState();
}

class _QuickReviewState extends State<QuickReview> {
  int foodId;
  IService service;
  List<ChefFood> _listChefFood = [];
  String conEmail;
  Consumer _con;

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    service = ServiceImpl();
    foodId = data['food'];
    conEmail = data['conEmail'];
    _listChefFood.addAll(service.getChefFood().where((e) => e.foodId.compareTo(foodId) == 0));
    _con = service.getConsumerByEmail(conEmail);

    return Scaffold(
      appBar: MyAppBar(context, "Chọn bếp"),
      body: Container(
          child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _listChefFood.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/booking",
                            arguments: {
                              'chefEmail': _listChefFood[index].chefEmail,
                              'conEmail': conEmail,
                              'food': foodId
                            });
                      },
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            "${service.getChefByEmail(_listChefFood[index].chefEmail).avatar}"),
                        radius: 20,
                      ),
                      title: Text(
                        "${service.getChefByEmail(_listChefFood[index].chefEmail).name}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'robo',
                            color: Colors.blueGrey),
                      ),
                      subtitle: Text(
                        "${service.getChefByEmail(_listChefFood[index].chefEmail).email}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'robo',
                            color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/chef_profile", arguments: {
                          'chef' : service.getChefByEmail(_listChefFood[index].chefEmail).email,
                          'acc' : _con,
                        });
                      },
                      child: Text(
                          "Thông tin",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'robo',
                            color: Colors.red
                          ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
