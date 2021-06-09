import 'package:hci_201/model/chef.dart';
import 'package:hci_201/model/chef_food.dart';

class Food {
  String id;
  String name;
  String avatar;
  List<String> receiptList = [];
  List<ChefFood> chefFood = [];

  Food({this.id, this.name, this.receiptList, this.avatar});

  // getter-setter-start

  String getId() {
    return this.id;
  }

  void setId(String id) {
    this.id = id;
  }

  String getName() {
    return this.name;
  }

  void setName(String name) {
    this.name = name;
  }

  List<String> getReceiptList() {
    return this.receiptList;
  }

  void setReceiptList(List<String> receiptList) {
    this.receiptList = receiptList;
  }

  List<ChefFood> getChefFood() {
    this.chefFood.sort((a,b) => a.getChef().getStar().compareTo(b.getChef().getStar()));
    this.chefFood.reversed;
    return this.chefFood;
  }

  void setChefFood(List<ChefFood> chefFood) {
    this.chefFood = chefFood;
  }

  String getAvatar() {
    return this.avatar;
  }

  void setAvatar(String avatar) {
    this.avatar = avatar;
  }

  // getter-setter-end

}