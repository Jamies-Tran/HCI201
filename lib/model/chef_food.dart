import 'package:hci_201/model/chef.dart';
import 'package:hci_201/model/food.dart';

class ChefFood {
  Chef chef;
  Food food;

  // constructor
  ChefFood({this.chef, this.food});

  // getter-setter-start

  Chef getChef() {
    return this.chef;
  }

  Food getFood() {
    return this.food;
  }

  // getter-setter-end

}