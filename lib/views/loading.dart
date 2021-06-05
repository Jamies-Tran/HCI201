import 'package:flutter/material.dart';
import 'package:hci_201/model/account.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Account _acc;

  void changeScreen() async {
    await Future.delayed(Duration(seconds: 10), () {
      Navigator.pushReplacementNamed(context, "/reg2", arguments: {
        'acc' : _acc
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    _acc = data['acc'];
    print('${_acc.getEmail()} - ${_acc.getPassword()} - ${_acc.getName()} - ${_acc.getPhone()} - ${_acc.getAddr()}');
    changeScreen();
    return Container(
      child: SpinKitPumpingHeart(
        color: Colors.white,
      ),
      color: Colors.red,
    );
  }
}
