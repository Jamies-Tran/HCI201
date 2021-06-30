import 'package:flutter/material.dart';

Widget myUserAppBar(String title, BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(70),
    child: AppBar(
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
            fontFamily: 'robo',
            letterSpacing: 2.0,
            color: Colors.white
        ),
      ),
      backgroundColor: Colors.redAccent,
      actions: [
        IconButton(
            icon: Icon(Icons.assignment_outlined, color: Colors.white, size: 40),
            onPressed: () {}
        )
      ],
    ),
  );
}