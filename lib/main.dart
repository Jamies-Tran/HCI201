import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_201/views/booking.dart';
import 'package:hci_201/views/change_password.dart';
import 'package:hci_201/views/chef_screen.dart';
import 'package:hci_201/views/err.dart';
import 'package:hci_201/views/forgot_password.dart';
import 'package:hci_201/views/loading.dart';
import 'package:hci_201/views/login.dart';
import 'package:hci_201/views/main_screen.dart';
import 'package:hci_201/views/new_visitor.dart';
import 'package:hci_201/views/register.dart';
import 'package:hci_201/views/food_category.dart';
import 'package:hci_201/views/show_cooker.dart';
import 'package:hci_201/views/show_food.dart';
import 'package:hci_201/widgets/chef_profile.dart';
import 'package:hci_201/widgets/search.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/' : (context) => Visitor(),
    '/login' : (context) => Login(),
    '/reg' : (context) => Register(),
    '/loading' : (context) => Loading(),
    '/reg2' : (context) => Register2(),
    '/search' : (context) => Search(),
    '/chef' : (context) => ChefScreen(),
    '/main' : (context) => MainScreen(),
    '/chef_profile' : (context) => ChefProfile(),
    '/show_cooker' : (context) => ShowCooker(),
    '/forgot_password' : (context) => ForgotPass(),
    '/change_password' : (context) => ChangePassword(),
    '/show_food' : (context) => ShowFood(),
    '/booking' : (context) => Booking(),
    '/err' : (context) => Error()
  },
));

