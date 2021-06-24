import 'package:hci_201/model/chef_food.dart';

class Food {
  int id;
  String title;
  String name;
  String avatar;
  String cateId;
  List<String> receiptList = [];
  List<ChefFood> chefFood = [];

  Food({this.id, this.title, this.name, this.receiptList, this.cateId, this.avatar});

}