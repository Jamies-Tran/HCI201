import 'package:flutter/material.dart';
import 'package:hci_201/model/consumer.dart';
import 'package:hci_201/service/iservice.dart';
import 'package:hci_201/service/serviceimpl.dart';
import 'package:hci_201/widgets/appbar.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String email;
  String password;
  TextEditingController _password;
  GlobalKey<FormState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _password.dispose();
    super.dispose();
  }

  void _saveForm() {
    bool isValid = _key.currentState.validate();
    if(isValid == true) {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    IService service = ServiceImpl();
    email = data["email"];
    Consumer _acc = service.getConsumerByEmail(email);
    return Scaffold(
      appBar: MyAppBar(context, "Change password"),
      body: Container(
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                controller: _password,
                validator: (String value) {
                  setState(() {
                    password = value;
                  });
                  _acc.password = password;
                  if(_acc.validPassword() == false) {
                    return _acc.errMsg;
                  }
                  return null;
                },
              ),
              RaisedButton(
                  onPressed: _saveForm,
                  color: Colors.redAccent,
                  child: Text(
                    "Change",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'koho',
                        letterSpacing: 2.0,
                        color: Colors.white
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
