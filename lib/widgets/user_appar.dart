import 'package:flutter/material.dart';

Widget myUserAppBar(String title, BuildContext context) {
  return AppBar(
    leadingWidth: 70,
    leading: CircleAvatar(
      backgroundImage: AssetImage("assets/default_avatar.jpg"),
      radius: 5,
    ),
    title: Text(
      '$title',
      style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: 'flower',
          letterSpacing: 2.0,
          color: Colors.white
      ),
    ),
    backgroundColor: Colors.redAccent,
    actions: [
      IconButton(
          icon: Icon(Icons.search),
          onPressed: () {

          })
    ],
  );
}