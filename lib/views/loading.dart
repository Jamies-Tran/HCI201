import 'package:flutter/material.dart';
import 'package:hci_201/model/account.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hci_201/service/iservice.dart';
import 'package:hci_201/service/serviceimpl.dart';

class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  Account _acc;
  String email;
  String password;
  int flag;
  String err;
  IService service = ServiceImpl();
  
  @override
  build(BuildContext context)  {
    Map data = ModalRoute.of(context).settings.arguments;
    flag = data['flag'];
    if(flag == 0) {
      email = data['email'];
      password = data['password'];
      _acc = service.loginAcc(email, password);
      if(_acc == null) {
        err = 'Wrong email or password';
        service.errChangeScreen(err, context);
      }else {
        service.loginChangeScreen(_acc, context);
      }
    }
    return Container(
      child: SpinKitPumpingHeart(
        color: Colors.white,
      ),
      color: Colors.red,
    );
  }
}
