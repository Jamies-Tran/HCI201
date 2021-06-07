// ToDo: reg 2
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_201/model/category.dart';
import 'package:hci_201/widgets/appbar.dart';
import 'package:hci_201/widgets/category_card.dart';

class Register2 extends StatefulWidget {
  const Register2({Key key}) : super(key: key);

  @override
  _Register2State createState() => _Register2State();
}

class _Register2State extends State<Register2> {

  List<Category> cateList = [
    Category(id: "cate01", title: "Breakfast and brunch", image: "assets/breakfast.jpg"),
    Category(id: "cate02", title: "Easy weeknight meat", image: "assets/breakfast.jpg"),
    Category(id: "cate03", title: "Make-ahead lunches", image: "assets/breakfast.jpg"),
    Category(id: "cate04", title: "Healthy receipt", image: "assets/breakfast.jpg"),
    Category(id: "cate05", title: "Deserts", image: "assets/breakfast.jpg"),
    Category(id: "cate06", title: "Drinks", image: "assets/breakfast.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, "Favorite"),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
        child: CategoryCard(cateList: cateList, isSelected: false),
      )
    );
  }
}
