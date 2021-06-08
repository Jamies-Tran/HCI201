import 'package:hci_201/model/chef_food.dart';

class Food {
  String id;
  String name;
  List<String> receiptList = [];
  List<ChefFood> chefFood = [];

  Food({this.id, this.name, this.receiptList});

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
    return this.chefFood;
  }

  void setChefFood(List<ChefFood> chefFood) {
    this.chefFood = chefFood;
  }

  // getter-setter-end

}