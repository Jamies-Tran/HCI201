import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_201/model/account.dart';
import 'package:hci_201/model/consumer.dart';
import 'package:hci_201/widgets/appbar.dart';

// ToDo: login

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _email;
  TextEditingController _password;
  String email;
  String password;
  int flag = 0;
  Account _acc = Consumer();
  GlobalKey<FormState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _saveForm() {
    bool isValid = _key.currentState.validate();
    if(isValid == true) {
      Navigator.pushNamed(context, "/loading", arguments: {
        'email' : email,
        'password' : password,
        'flag' : flag
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, "Login"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(50, 200, 50, 50),
          child: Form(
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  controller: _email,
                  validator: (String value) {
                    setState(() {
                      email = value;
                    });
                    _acc.email = email;
                    if(_acc.validEmail() == false) {
                      return _acc.errMsg;
                    }else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'koho',
                        letterSpacing: 2.0
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _password,
                  validator: (String value) {
                    setState(() {
                      password = value;
                    });
                    _acc.password = password;
                    if(_acc.validPassword() == false) {
                      return _acc.errMsg;
                    }else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontSize: 20,
                          fontFamily: 'koho',
                          letterSpacing: 2.0
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2),
                          borderRadius: BorderRadius.circular(15)
                      )
                  ),
                ),
                SizedBox(height: 30),
                ButtonTheme(
                    minWidth: 400,
                    height: 50,
                    child: RaisedButton(
                      onPressed: _saveForm,
                      color: Colors.red,
                      child: Text(
                          'Let\'s go',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'koho',
                            letterSpacing: 2.0,
                            color: Colors.white
                        ),
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
