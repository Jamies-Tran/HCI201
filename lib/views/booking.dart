import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hci_201/model/chef.dart';
import 'package:hci_201/model/consumer.dart';
import 'package:hci_201/model/food.dart';
import 'package:hci_201/model/ingredient.dart';
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

  String conEmail;

  int foodId;

  Food _food;

  Chef _chef;

  DateTime _bookingDate;
  
  DateTime _bookingTime;

  String _showDate = "";
  
  String _showTime = "";

  Consumer _con;

  int count = 1;

  String _location;

  String street;

  String district;

  String ward;

  String _menuItem = "Your account location";

  String _districtItem = "chọn quận";

  List<String> districtList;

  List<String> wardList;

  List<String> getAddressList;

  GlobalKey<FormState> _key = GlobalKey();

  TextEditingController _streetTEC;

  TextEditingController _wardTextEditTEC;

  @override
  void initState() {
    super.initState();
    _streetTEC = TextEditingController();
    _wardTextEditTEC = TextEditingController();
  }

  @override
  void dispose() {
    _streetTEC.dispose();
    _wardTextEditTEC.dispose();
    super.dispose();
  }

  void _validateForm() {
    bool isValid = _key.currentState.validate();
    if(isValid == true) {
      Navigator.pop(context, {
        'street': street,
        'district' : district,
        'ward' : ward
      });
    }

  }

  double getTotalPrice() {
    double total = 0;
    for(Ingredient x in _food.ingredientList) {
      total = (total + x.price);
    }
    return total * count;
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    chefEmail = data['chef'];
    foodId = data['food'];
    _con = data['acc'];
    getAddressList = _con.addr.split(",");
    //_districtItem = getAddressList[2];
    _chef = service.getChefByEmail(chefEmail);
    _food = service.getFoodByID(foodId);
    districtList = ["chọn quận" ,"quận 1", "quận 2", "quận 3", "quận 4", "quận 5", "quận 6", "quận 7", "quận 8", "quận 9", "quận 10", "quận 11", "quận 12",
      "Bình Tân", "Bình Thạnh", "Gò Vấp", "Phú Nhuận", "Tân Bình", "Tân Phú", "Thủ Đức", "Bình Chánh", "Cần Giờ", "Củ Chi", "Hóc Môn", "Nhà bè"];
    print("$_districtItem");
    print("${getAddressList[0]}");
    return Scaffold(
      appBar: MyAppBar(context, "Booking"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 3,
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
                    margin: EdgeInsets.fromLTRB(0, 50, 0, 50),
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
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
                          "Quick review",
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
                  child: CircleAvatar(
                    backgroundImage: AssetImage("${_chef.avatar}"),
                    radius: 55,
                  ),
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.person, size: 25, color: Colors.red),
                              Text(
                                "${_chef.name}",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'robo',
                                    color: Colors.blueGrey
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.email, size: 25, color: Colors.red),
                              Text(
                                "${_chef.email}",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'robo',
                                    color: Colors.blueGrey
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.phone, size: 25, color: Colors.red),
                              Text(
                                "${_chef.phone}",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'robo',
                                    color: Colors.blueGrey
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.map, size: 25, color: Colors.red),
                              Text(
                                "${_chef.addr}",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'robo',
                                    color: Colors.blueGrey
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.account_balance_wallet, size: 25, color: Colors.red),
                              Text(
                                "${_chef.price}.000",
                                style: TextStyle(
                                    fontSize: 25,
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
                ),

                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    itemCount: _food.ingredientList.length,
                    itemBuilder: (context, index) {
                      return Table(
                        border: TableBorder.all(color: Colors.white),
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        columnWidths: <int, TableColumnWidth>{
                          0 : FixedColumnWidth(140)
                        },
                        children: [
                          TableRow(
                            children: [
                              Container(
                                height: 50,
                                color: Colors.red,
                                padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                                child: Text(
                                  "${_food.ingredientList[index].name}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'robo',
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      letterSpacing: 1.0
                                  ),
                                ),
                              ),
                              Text(
                                "${_food.ingredientList[index].outputQuantity()}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'robo',
                                    letterSpacing: 1.0
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.account_balance_wallet, size: 25, color: Colors.red),
                                  Text(
                                      "${_food.ingredientList[index].price.toInt()}.000",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'robo',
                                        letterSpacing: 1.0
                                    ),
                                  ),
                                ],
                              )
                            ]
                          )
                        ],
                      );
                    },
                  ),
                ),

                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                              "Total price: ",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'robo'
                              ),
                          ),
                          Text(
                              "${getTotalPrice().toInt()}.000 VND",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'robo',
                                fontWeight: FontWeight.bold,
                                color: Colors.red
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "How many do you want?",
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'robo'
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  if(count > 1) {
                                    count = count - 1;
                                  }
                                });
                              }
                          ),
                          Text(
                              "$count",
                              style: TextStyle(
                                fontSize: 20
                              ),
                          ),
                          IconButton(
                              icon: Icon(Icons.arrow_forward_ios, size: 20, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  count = count + 1;
                                });
                              }
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Form(
                    key: _key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          //controller: _streetTEC,
                          initialValue: getAddressList[0],
                          validator: (value) {
                            if(value.length == 0 || value == "") {
                              return "Điền số nhà và tên đường.";
                            }
                            setState(() {
                              street = value;
                            });
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(width: 1.0, color: Colors.black)
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(width: 1.0, color: Colors.blue)
                            ),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(width: 1.0, color: Colors.red)
                            ),
                          )
                        ),
                        TextFormField(
                          //controller: _wardTextEditTEC,
                          initialValue: getAddressList[1],
                          validator: (value) {
                            if(value.length == 0 || value == "") {
                              return "Điền tên huyện.";
                            }
                            setState(() {
                              ward = value;
                            });
                            return null;
                          },
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(width: 1.0, color: Colors.black)
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(width: 1.0, color: Colors.blue)
                            ),
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(width: 1.0, color: Colors.red)
                            ),
                          ),

                        ),
                        Row(
                          children:[
                            DropdownButton(
                                elevation: 1,
                                value: _districtItem,
                                underline: Container(height: 2,color: Colors.grey),
                                items: districtList.map<DropdownMenuItem<String>>((value) => DropdownMenuItem(
                                  value: value,
                                  child: Text("$value"),
                                )
                                ).toList(),
                              onChanged: (newValue) {
                                  setState(() {
                                    _districtItem = newValue;
                                    district = newValue;
                                  });
                              },
                            )
                          ]
                        ),
                      ],
                    )
                  ),
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
                          "Setup schedual",
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
                                  currentTime: DateTime.now().add(Duration(hours: 5)),
                                  onConfirm: (value) {
                                    setState(() {
                                      _bookingTime = value;
                                      _showTime = "${formatDate(_bookingTime, [HH,":",nn])}";
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
