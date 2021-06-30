// ToDo: reg 2
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_201/model/account.dart';
import 'package:hci_201/model/category.dart';
import 'package:hci_201/model/consumer.dart';
import 'package:hci_201/widgets/appbar.dart';
import 'package:hci_201/widgets/category_card.dart';

class Register2 extends StatefulWidget {
  const Register2({Key key}) : super(key: key);

  @override
  _Register2State createState() => _Register2State();
}

class _Register2State extends State<Register2> {

  List<Category> cateList = [
    Category(id: "cate01", title: "Bữa sáng", image: "assets/breakfast.jpg"),
    Category(id: "cate02", title: "Bữa tối", image: "assets/dinnner.jpg"),
    Category(id: "cate03", title: "Bữa trưa", image: "assets/lunch.jpg"),
    Category(id: "cate04", title: "Sức khỏe", image: "assets/healthy.jpg"),
    Category(id: "cate05", title: "Tráng miệng", image: "assets/desert.png"),
    Category(id: "cate06", title: "Đồ uống", image: "assets/drink.jpg"),
  ];



  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    Account _acc = data["acc"];
    return Scaffold(
      appBar: MyAppBar(context, "Welcome"),
      body: Column(
        children: [
          Text(
            "choose your favourite food's categories.",
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'koho',
                letterSpacing: 2.0
            ),
          ),
          Expanded(
              child: CategoryCard(cateList: cateList, isSelected: false),
          ),
          ButtonTheme(
            minWidth: 400,
            height: 50,
            buttonColor: Colors.black,
            child: RaisedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/main', arguments: {
                  'acc' : _acc
                });
              },
              child: Text(
                "Complete",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'koho',
                    letterSpacing: 2.0,
                    color: Colors.white
                ),
              ),
              color: Colors.red,
            ),
          ),
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}
