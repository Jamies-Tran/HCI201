import 'package:flutter/material.dart';
import 'package:hci_201/model/chef_food.dart';
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

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    service = ServiceImpl();
    foodId = data['foodId'];
    conEmail = data['conEmail'];
    _listChefFood.addAll(service.getChefFood().where((e) => e.foodId.compareTo(foodId) == 0));
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
                  return ListTile(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/food_info", arguments: {
                        'chef' : _listChefFood[index].chefEmail,
                        'conEmail' : conEmail,
                        'food' : foodId
                      });
                    },
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("${service.getChefByEmail(_listChefFood[index].chefEmail).avatar}"),
                      radius: 20,
                    ),
                    title: Text(
                        "${service.getChefByEmail(_listChefFood[index].chefEmail).name}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'robo',
                          color: Colors.blueGrey
                        ),
                    ),
                    subtitle: Text(
                      "${service.getChefByEmail(_listChefFood[index].chefEmail).email}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'robo',
                          color: Colors.black
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}
