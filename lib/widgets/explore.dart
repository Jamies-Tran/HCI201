// ToDo: explore
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hci_201/model/category.dart';
import 'package:hci_201/model/chef_food.dart';
import 'package:hci_201/model/consumer.dart';
import 'package:hci_201/model/get_enum.dart';
import 'package:hci_201/service/iservice.dart';
import 'package:hci_201/service/serviceimpl.dart';
import 'package:hci_201/widgets/cate_view.dart';
import 'package:hci_201/widgets/chef_card.dart';
import 'package:hci_201/widgets/food_card.dart';

class Explore extends StatefulWidget {

  Consumer con;

  Explore({this.con});

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  List<ChefFood> chefFoodList = [];

  IService service = ServiceImpl();

  List<Category> _cateList = [];

  String hintTest = 'Search chef...';


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _cateList = service.cateGoryList();
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(14, 50, 14, 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintTest,
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
                    borderSide: BorderSide(width: 3, color: Colors.red),
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
                onTap: () {
                  //showSearch(context: context, delegate: SearchService());
                },
              ),
            ),
            SizedBox(height: 30),
            Center(
                child: Row(
                  children: [
                    Icon(Icons.category, size: 35, color: Colors.redAccent),
                    Text(
                        " - Các loại món ăn",
                        style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'koho',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            color: Colors.redAccent
                        )
                    ),
                  ],
                )
            ),
            SizedBox(height: 5),
            Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 0.35,
              child:  Category_View(cateList: _cateList, conEmail: widget.con.email),
            ),
            Center(
              child: Row(
                children: [
                  Icon(Icons.map, size: 35, color: Colors.redAccent),
                  Text(
                      " - Đầu bếp gần bạn",
                      style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'koho',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          color: Colors.redAccent
                      )
                  ),
                ],
              )
            ),
            SizedBox(height: 5),
            Container(
              // day la height cua container chua container cua cac chefcard
              height: MediaQuery.of(context).size.height * 0.6,
              child: ChefCard(chefList: service.getChefList(), con: widget.con, scrollDicrect: Axis.horizontal, widType: Wid_Type.PROFILE_DISTANCE),
            ),
            Center(
                child: Row(
                  children: [
                    Icon(Icons.star, size: 35, color: Colors.redAccent),
                    Text(
                        " - Bảng xếp hạng",
                        style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'koho',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            color: Colors.redAccent
                        )
                    ),
                  ],
                )
            ),
            SizedBox(height: 5),
            Container(
              // day la height cua container chua container cua cac chefcard
              height: MediaQuery.of(context).size.height * 0.6,
              child: ChefCard(chefList: service.getChefList(), con: widget.con, scrollDicrect: Axis.horizontal, widType: Wid_Type.PROFILE_STAR),
            ),
            SizedBox(height: 10),
            Center(
                child: Row(
                  children: [
                    Icon(Icons.fastfood, size: 35, color: Colors.redAccent),
                    Text(
                        " - Ưu đãi",
                        style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'koho',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            color: Colors.redAccent
                        )
                    ),
                  ],
                )
            ),
            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.65,
              child: FoodCard(foodList: service.getFoodList(), con: widget.con),
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Container(
            //     height: MediaQuery.of(context).size.height * 0.5,
            //     width: MediaQuery.of(context).size.width * 1,
            //     child: ChefFoodCard(chefFoodList: _chefFoodList),
            //   ),
          ]
        ),
      ),
    );
  }
}
