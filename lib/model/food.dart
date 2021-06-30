import 'package:hci_201/model/chef_food.dart';
import 'package:hci_201/model/ingredient.dart';

class Food {
  int id;
  String title;
  String name;
  String avatar;
  String cateId;
  double star;
  List<Ingredient> ingredientList = [];
  List<ChefFood> chefFood = [];

  Food({this.id, this.title, this.name, this.ingredientList, this.cateId, this.avatar , this.star});

  double totalPrice() {
    double price = 0;
    for(Ingredient x in ingredientList) {
      price = price + x.price;
    }
    return price;
  }

}