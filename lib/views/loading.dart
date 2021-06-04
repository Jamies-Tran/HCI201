import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String email;
  String password;
  String name;
  String phone;
  String addr;

  void changeScreen() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/login", arguments: {
        'email' : email,
        'password' : password,
        'name' : name,
        'phone' : phone,
        'addr' : addr
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    email = data['email'];
    password = data['password'];
    name = data['name'];
    phone = data['phone'];
    addr = data['addr'];
    print('$email - $password - $name - $phone - $addr');
    return Container();
  }
}
