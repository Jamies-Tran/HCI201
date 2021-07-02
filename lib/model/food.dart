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

  double totalPriceByNumOrder(int numOrder) {
    double price = totalPrice();
    // for(Ingredient x in _food.ingredientList) {
    //   price = (price + x.price) * numOrder;
    // }
    if (numOrder > 5) {
      double totalPrice = price * numOrder;
      double discount = (price * 5) * 5 / 100;
      int numDiscount = 0;
      int count = numOrder;
      while (count >= 0) {
        count = count - 5;
        numDiscount = numDiscount + 1;
      }
      discount = discount * numDiscount;
      totalPrice = totalPrice - discount;
      return totalPrice;
    }else if(numOrder == 5) {
      double totalPrice = price * numOrder;
      double discount = (price * 5) * 5 / 100;
      totalPrice = totalPrice - discount;
      return totalPrice;
    }else {
      double totalPrice = price * numOrder;
      return totalPrice;
    }
  }

  // double totalPrice(int numOrder) {
  //   double price = 0;
  //   int discountCounter = 0;
  //   for(Ingredient x in ingredientList) {
  //     price = (price + x.price) * numOrder;
  //   }
  //   double discount = (price/numOrder * 5) * 5 / 100;
  //   double discountPrice = price * 5;
  //   while((price - discountPrice) % (price/numOrder) == 0) {
  //     discountCounter = discountCounter + 1;
  //     discount = discount * discountCounter;
  //   }
  //   price = price - discount;
  //   return price;
  // }

}