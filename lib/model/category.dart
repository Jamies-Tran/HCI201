import 'package:flutter/material.dart';
import 'package:hci_201/model/food.dart';

class Category {
  String id;
  String title;
  String image;
  List<Food> foodList;
  bool isSelected = false;

  Category({this.id, this.title, this.image, this.foodList});

  Color setColor() {
    if(this.isSelected == true) {
      return Colors.red;
    }else {
      return Colors.white;
    }
  }

}