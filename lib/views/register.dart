import 'package:flutter/material.dart';
import 'package:hci_201/widgets/appbar.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, "Register"),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [

          ],
        )
      )
    );
  }
}
