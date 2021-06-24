import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hci_201/model/chef.dart';
import 'package:hci_201/model/food.dart';
import 'package:hci_201/service/iservice.dart';
import 'package:hci_201/service/serviceimpl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hci_201/widgets/appbar.dart';
import 'package:date_format/date_format.dart';

class Booking extends StatefulWidget {

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  IService service = ServiceImpl();

  String chefEmail;

  int foodId;

  Food _food;

  Chef _chef;

  DateTime _bookingDate;
  
  DateTime _bookingTime;

  String _showDate = "";
  
  String _showTime = "";

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    chefEmail = data['chef'];
    foodId = data['food'];
    _chef = service.getChefByEmail(chefEmail);
    _food = service.getFoodByID(foodId);
    return Scaffold(
      appBar: MyAppBar(context, "Booking"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 2,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("${_food.avatar}"),
                  fit: BoxFit.cover
              )
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 2,
            margin: EdgeInsets.fromLTRB(20, 100, 20, 10),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
                  child: Text(
                    "Make your arrangement",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'robo',
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700]
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Icon(
                      Icons.check_circle_outline,
                      color: Colors.green[700],
                      size: 40,
                    )
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("${_food.avatar}"),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Container(
                          child: Text(
                            "You have picked up ",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'robo',
                                letterSpacing: 1.0,
                                color: Colors.black54
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${_food.title}",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'robo',
                                letterSpacing: 1.0,
                                color: Colors.redAccent
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.accessibility,
                          size: 30,
                          color: Colors.blueGrey,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Chef information",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'robo',
                              letterSpacing: 1.0,
                              color: Colors.blueGrey
                          ),
                        ),
                      ],
                    )
                ),

                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("${_chef.avatar}"),
                          radius: 45,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person_outline, size: 20, color: Colors.red),
                            Text(
                              "${_chef.name}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'robo',
                                  color: Colors.blueGrey
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email, size: 20, color: Colors.red),
                            Text(
                              "${_chef.email}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'robo',
                                  color: Colors.blueGrey
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone, size: 20, color: Colors.red),
                            Text(
                              "${_chef.phone}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'robo',
                                  color: Colors.blueGrey
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.map_outlined, size: 20, color: Colors.red),
                            Text(
                              "${_chef.addr}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'robo',
                                  color: Colors.blueGrey
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.attach_money, size: 20, color: Colors.red),
                            Text(
                              "${_chef.price}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'robo',
                                  color: Colors.blueGrey
                              ),
                            )
                          ],
                        )
                      ],
                    )
                ),

                Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            Icons.calendar_today_outlined,
                            size: 30
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Set up calendar",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'robo',
                              letterSpacing: 1.0,
                              color: Colors.blueGrey
                          ),
                        ),
                      ],
                    )
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 20, 20),
                        child: RaisedButton.icon(
                            onPressed: () {
                              DatePicker.showDatePicker(
                                  context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  maxTime: DateTime.now().add(Duration(days: 120)),
                                  onConfirm: (value) {
                                    setState(() {
                                      _bookingDate = value;
                                      _showDate = '${formatDate(_bookingDate, [yyyy, '-', mm, '-', dd])}';
                                    });
                                  }
                              );
                            },
                            icon: Icon(
                                Icons.calendar_today_outlined,
                                color: Colors.redAccent),
                            label: Text(
                              "Pick up your date here",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'robo',
                                  color: Colors.redAccent
                              ),
                            )
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Date: ",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'robo',
                                  letterSpacing: 1.0,
                                  color: Colors.black54
                              ),
                            ),
                            Text(
                              "$_showDate",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'robo',
                                  letterSpacing: 1.0,
                                  color: Colors.greenAccent
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 20, 20),
                        child: RaisedButton.icon(
                            onPressed: () {
                              DatePicker.showTime12hPicker(
                                  context,
                                  showTitleActions: true,
                                  currentTime: DateTime.now(),
                                  onConfirm: (value) {
                                    setState(() {
                                      _bookingTime = value;
                                      _showTime = "${formatDate(_bookingTime.add(Duration(hours: 5)), [HH,":",nn])}";
                                    });
                                  }
                              );
                            },
                            icon: Icon(
                                Icons.timelapse,
                                color: Colors.redAccent),
                            label: Text(
                              "Pick up your time here",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'robo',
                                  color: Colors.redAccent
                              ),
                            )
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Time: ",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'robo',
                                  letterSpacing: 1.0,
                                  color: Colors.black54
                              ),
                            ),
                            Text(
                              "$_showTime",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'robo',
                                  letterSpacing: 1.0,
                                  color: Colors.greenAccent
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
