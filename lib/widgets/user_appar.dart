import 'package:flutter/material.dart';

Widget myUserAppBar(String title) {
  return AppBar(
    leading: CircleAvatar(
      backgroundImage: AssetImage("assets/default_avatar.jpg"),
      radius: 10,
    ),
    title: Text(
      '$title',
      style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: 'flower',
          letterSpacing: 2.0,
          color: Colors.red
      ),
    ),
    backgroundColor: Colors.white,
  );
}