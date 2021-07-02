import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hci_201/model/chef.dart';
import 'package:hci_201/model/consumer.dart';
import 'package:hci_201/model/food.dart';
import 'package:hci_201/model/get_enum.dart';
import 'package:hci_201/model/ingredient.dart';
import 'package:hci_201/service/iservice.dart';
import 'package:hci_201/service/serviceimpl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hci_201/widgets/appbar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class Booking extends StatefulWidget {

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  String strDate = formatDate(DateTime.now(), [dd, "/", mm, "/", yyyy]);
  String chefEmail;
  int foodId;
  IService service;
  Chef _chef;
  Food _food;
  DateTime strNotify = DateTime.now();
  String dropDownValue = "Địa chỉ hiện tại";
  int numOrder = 1;

  String getDayName(Day_List _day) {
    if(_day == Day_List.T2) {
      return "Thứ 2";
    }else if(_day == Day_List.T3) {
      return "Thứ 3";
    }else if(_day == Day_List.T4) {
      return "Thứ 4";
    }else if(_day == Day_List.T5) {
      return "Thứ 5";
    }else if(_day == Day_List.T6) {
      return "Thứ 6";
    }else if(_day == Day_List.T7) {
      return "Thứ 7";
    }else {
      return "Chủ nhật";
    }
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    service = ServiceImpl();
    chefEmail = data['chefEmail'];
    foodId = data['food'];
    _chef = service.getChefByEmail(chefEmail);
    _food = service.getFoodByID(foodId);

    bool _isAvailable = _chef.isAvailable(strNotify.weekday);

    return Scaffold(
      appBar: MyAppBar(context, "Đặt lịch hẹn"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 50, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Note: ",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'robo',
                        color: Colors.red
                    ),
                  ),
                  Text(
                    "Bêp ${_chef.name} hoạt động từ ${getDayName(Day_List.values[_chef.noWorkingDayFrom])} đến ${getDayName(Day_List.values[_chef.noWorkingDayTo])}",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'robo',
                        color: Colors.blueGrey
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              // thiết lập địa điểm
              Container(
                child: DropdownButton(
                  icon: Icon(Icons.location_pin, size: 20, color: Colors.red),
                  elevation: 3,
                  value: dropDownValue,
                  items: ["Địa chỉ hiện tại", "Địa chỉ đăng kí"].map<DropdownMenuItem<String>>((value) => DropdownMenuItem(
                      value: value,
                      child: Text(value)
                  )).toList(),
                  underline: Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                  onChanged: (value) {
                    setState(() {
                      dropDownValue = value;
                    });
                  },
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/map.png"),
                    fit: BoxFit.fill
                  )
                ),
              ),

              SizedBox(height: 30),

              Row(
                children: [
                  Text("*", style: TextStyle(fontSize: 20, fontFamily: 'robo', fontWeight: FontWeight.bold)),
                  Text("Click để chọn ngày khác", style: TextStyle(fontSize: 20, fontFamily: 'robo', fontWeight: FontWeight.bold)),
                ],
              ),
              
              SizedBox(height: 10),
              
              RaisedButton.icon(
                  onPressed: (){
                    DatePicker.showDatePicker(
                        context,
                        minTime: DateTime.now(),
                        maxTime: DateTime.now().add(Duration(days: 120)),
                        locale: LocaleType.vi,
                        showTitleActions: true,
                        currentTime: DateTime.now(),
                        onConfirm: (value) {
                          String strGetDate = formatDate(value, [dd, "/", mm, "/",yyyy]);
                          setState(() {
                            strDate = strGetDate;
                            strNotify = value;
                          });
                        }
                    );
                  },
                  elevation: 3,
                  icon: Icon(Icons.calendar_today_sharp, color: _isAvailable == true ? Colors.green : Colors.red, size: 25),
                  label: Text(
                      "Chọn ngày: $strDate",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'robo',
                        fontWeight: FontWeight.bold,
                        color: _isAvailable == true ? Colors.green : Colors.red
                      ),
                  ),
              ),
              Text(
                  _isAvailable == true ? "Bếp online" : "Bếp offline",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'robo',
                    color: _isAvailable == true ? Colors.green : Colors.red
                  ),
              ),



              SizedBox(height: 30),
              
              Container(
                child: Column(
                  children: [
                    Text("Ghi chú",style: TextStyle(fontSize: 20,fontFamily: 'robo', fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                    Card(
                      color: Colors.grey,
                      child: TextField(maxLines: 8, decoration: InputDecoration.collapsed(hintText: "Hãy gửi ghi chú đến bếp của bạn")),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 30),

              Container(
                child: Row(
                  children: [
                    Text(
                      "Bạn đặt bao nhiêu suất ăn",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'robo',
                          color: Colors.blueGrey
                      ),
                    ),
                    SizedBox(width: 20),
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          if(numOrder > 2)  {
                            numOrder = numOrder - 1;
                          }
                        });
                      },
                    ),
                    Text(
                      "$numOrder",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'robo',
                          color: Colors.blueGrey
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios, size: 20, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          numOrder = numOrder + 1;
                        });
                      },
                    ),
                  ],
                ),
              ),

              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        "Ưu đãi: ",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "robo",
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                        ),
                      ),
                      Text(
                          "giảm 5% trên tổng đơn giá mỗi 5 món ngoài ra còn có thể áp dụng các mã khuyến mãi",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: "robo",
                            color: Colors.blueGrey
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30),

              ButtonTheme(
                minWidth: 400,
                height: 50,
                buttonColor: _isAvailable == true ? Colors.green : Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(width: 3, color: Colors.black)
                ),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    _isAvailable == true ? "Giá: ${_food.totalPriceByNumOrder(numOrder).toInt()}.000 VND" : "Bếp đang offline",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'robo',
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}