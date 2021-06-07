import 'package:flutter/material.dart';
import 'package:hci_201/model/account.dart';
import 'package:hci_201/widgets/account_profile.dart';
import 'package:hci_201/widgets/booking.dart';
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
  final List<Widget> widList = [
    Explore(),
    Search(),
    Booking(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    Account _acc = data['acc'];
    return Scaffold(
      appBar: myUserAppBar("${_acc.getName()}"),
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
              label: "home",
              backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "search",
              backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                size: 15,
              ),
              label: "story",
              backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_rounded),
              label: "account",
              backgroundColor: Colors.red,
          ),

        ],
      ),
    );
  }
}
