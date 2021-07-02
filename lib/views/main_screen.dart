import 'package:flutter/material.dart';
import 'package:hci_201/model/account.dart';
import 'package:hci_201/model/consumer.dart';
import 'package:hci_201/widgets/account_profile.dart';
import 'package:hci_201/widgets/chat.dart';
import 'package:hci_201/widgets/explore.dart';
import 'package:hci_201/widgets/search.dart';
import 'package:hci_201/widgets/user_appar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;
  List<Widget> widList;

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    Consumer _acc = data['acc'];
    widList = [
      Explore(con: _acc),
      Profile(con: _acc)
    ];
    return Scaffold(
      appBar: myUserAppBar("${_acc.name}", context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart, size: 30),
        backgroundColor: Colors.redAccent,
        onPressed: (){},
        heroTag: null,
      ),
      body: widList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Khám phá",
              backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined),
              label: "Tài khoản",
              backgroundColor: Colors.red,
          ),

        ],
      ),
    );
  }
}
