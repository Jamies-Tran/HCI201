import 'package:flutter/material.dart';
import 'package:hci_201/login.dart';
import 'package:hci_201/views/new_visitor.dart';
import 'package:hci_201/views/register.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/' : (context) => Visitor(),
    '/login' : (context) => Login(),
    '/reg' : (context) => Register()
  },
));

