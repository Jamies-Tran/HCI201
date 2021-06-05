import 'package:flutter/material.dart';
import 'package:hci_201/views/loading.dart';
import 'package:hci_201/views/login.dart';
import 'package:hci_201/views/new_visitor.dart';
import 'package:hci_201/views/register.dart';
import 'package:hci_201/views/register_2.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/' : (context) => Visitor(),
    '/login' : (context) => Login(),
    '/reg' : (context) => Register(),
    '/loading' : (context) => Loading(),
    '/reg2' : (context) => Register2(),
  },
));

