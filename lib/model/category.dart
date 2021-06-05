import 'package:hci_201/model/food.dart';

class Category {
  String id;
  String title;
  String image;
  List<Food> foodList;

  Category({this.id, this.title, this.image, this.foodList});

  String getId() {
    return this.id;
  }

  void setId(String id) {
    this.id = id;
  }

  String getTitle() {
    return this.title;
  }

  void setTitle(String title) {
    this.title = title;
  }

  List<Food> getFoodList() {
    return this.foodList;
  }

  void setFoodList(List<Food> foodList) {
    this.foodList = foodList;
  }

  String getImage() {
    return this.image;
  }

  void setImage(String image) {
    this.image = image;
  }

}