import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget MyAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        fontFamily: 'flower',
        letterSpacing: 2.0
      ),
    ),
    backgroundColor: Colors.red,
    centerTitle: true,
  );
}