import 'package:flutter/material.dart';

class ChefProfile extends StatefulWidget {
  const ChefProfile({Key key}) : super(key: key);

  @override
  _ChefProfileState createState() => _ChefProfileState();
}

class _ChefProfileState extends State<ChefProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Chef profile."),
      ),
    );
  }
}
