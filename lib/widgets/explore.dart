// ToDo: explore
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hci_201/model/account.dart';
import 'package:hci_201/model/chef.dart';
import 'package:hci_201/model/chef_food.dart';
import 'package:hci_201/model/food.dart';
import 'package:hci_201/model/get_enum.dart';
import 'package:hci_201/service/iservice.dart';
import 'package:hci_201/service/serviceimpl.dart';
import 'package:hci_201/widgets/chef_card.dart';
import 'package:hci_201/widgets/food_card.dart';

class Explore extends StatefulWidget {
  const Explore({Key key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  List<ChefFood> chefFoodList = [];


  IService service = ServiceImpl();



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(14, 50, 14, 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search chef',
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'koho',
                    letterSpacing: 2.0
                  ),
                  // dat icon vao cuoi cua textfield (suffix - cuoi)
                  suffixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.black),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.blue),
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
                onTap: () {
                  //showSearch(context: context, delegate: SearchService());
                },
              ),
            ),
            SizedBox(height: 30),
            Text(
                "Chef around me",
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'koho',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0
                )
            ),
            SizedBox(height: 30),
            Container(
              // day la height cua container chua container cua cac chefcard
              height: MediaQuery.of(context).size.height * 0.8,
              child: ChefCard(chefList: service.getChefList()),
            ),
            SizedBox(height: 30),
            Text(
              'Chef\'s food ',
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'koho',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0
                )
            ),
            SizedBox(height: 30),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: FoodCard(chefList: service.getChefList(), foodList: service.getFoodList()),
            )
          ]
        ),
      ),
    );
  }
}
