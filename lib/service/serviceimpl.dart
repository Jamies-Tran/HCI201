import 'package:flutter/cupertino.dart';
import 'package:hci_201/model/account.dart';
import 'package:hci_201/model/category.dart';
import 'package:hci_201/model/chef.dart';
import 'package:hci_201/model/chef_food.dart';
import 'package:hci_201/model/consumer.dart';
import 'package:hci_201/model/food.dart';
import 'package:hci_201/model/get_enum.dart';
import 'package:hci_201/service/iservice.dart';

class ServiceImpl implements IService {

  @override
  Food getFoodByID(int id) {
    for(Food x in getFoodList()) {
      if(x.id == id) {
        return x;
      }
    }
    return null;
  }

  @override
  Food getFoodByName(String name) {
    RegExp regex = RegExp(name, multiLine: false, caseSensitive: true);
    for(Food x in getFoodList()) {
      if(regex.hasMatch(x.name)) {
        return x;
      }
    }
    return null;
  }

  @override
  Future<void> errChangeScreen(String err, BuildContext context) async {
    await Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamed(context, "/err", arguments: {
        'err' : err
      });
    });
  }


  // gop hai list consumer va chef de kiem tra login
  @override
  List<Account> getAccountList() {
    List<Account> _list = [];
    _list.addAll(getConsumerList());
    _list.addAll(getChefList());
    return _list;
  }

  @override
  bool loginFunction(String email, String password, BuildContext context) {
    List<Account> accList = getAccountList();
    // lap qua account list
    for(int i = 0; i < accList.length; i++) {
      // tim account trung email va password, neu co thi check role
      if(accList[i].email.compareTo(email) == 0 && accList[i].password.compareTo(password) == 0) {
        // check neu role new account la consumer
        if(accList[i].role == Account_Type.values[0]) {
          Consumer _con = getConsumerByEmail(accList[i].email);
          // chuyen mang hinh sang consumer view
          loginChangeScreen(_con, context);
          return true;
          // neu account la chef
        }else if(accList[i].role == Account_Type.values[1]) {
          Chef _chef = getChefByEmail(accList[i].email);
          // chuyen mang hinh sang chef view
          loginChangeScreen(_chef, context);
          return true;
        }
      }
    }
    return false;
  }

  @override
  Consumer getConsumerByEmail(String email) {
    List<Consumer> _list = getConsumerList();
    for(Consumer _con in _list) {
      if(_con.email.compareTo(email) == 0) {
        return _con;
      }
    }
    return null;
  }

  @override
  Chef getChefByEmail(String email) {
    List<Chef> _list = getChefList();
    for(Chef _con in _list) {
      if(_con.email.compareTo(email) == 0) {
        return _con;
      }
    }
    return null;
  }

  @override
  Future<void> loginChangeScreen(Account _acc, BuildContext context) async {
    await Future.delayed(Duration(seconds: 5), () {
      if(_acc.role == Account_Type.values[0]) {
        Navigator.pushNamed(context, "/main", arguments: {
          'acc' : _acc
        });
      }else if(_acc.role == Account_Type.values[1]) {
        Navigator.pushNamed(context, "/chef", arguments: {
          'acc' : _acc
        });
      }
    });
  }

  @override
  Future<void> regChangeScreen(Consumer _acc, BuildContext context) async {
    await Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamed(context, "/reg2", arguments: {
        'acc' : _acc
      });
    });
  }

  @override
  List<Chef> getChefList() {
   return [
     Chef(email: "dongocduy@gmail.com", name: "Duy Do", password: "duy123",
       addr: "Cao Thang",
       role: Account_Type.values[1],
       phone: "0981874736",
       avatar: "assets/chef2.jpg",
       star: 4.5,
       price: 50000,
       distance: 5.0
     ),
     Chef(email: "tranquangminh@gmail.com", name: "Minh Tran", password: "minh123",
         addr: "phan van tri",
         role: Account_Type.values[1],
         phone: "0981874736",
         avatar: "assets/chef1.jpg",
         star: 5,
         price: 45000,
         distance: 4.5
     ),
     Chef(email: "phamnguyentrunghieu@gmail.com", name: "Hieu Pham", password: "minh123",
         addr: "Thu Duc",
         role: Account_Type.values[1],
         phone: "0981874736",
         avatar: "assets/chef3.jpg",
         star: 4.0,
         price: 60000,
         distance: 4.0
     ),
     Chef(email: "nguyenngocphieu@gmail.com", name: "Phieu Nguyen", password: "minh123",
         addr: "Duong so ba",
         role: Account_Type.values[1],
         phone: "0981874736",
         avatar: "assets/chef4.jpg",
         star: 3.5,
         price: 90000,
         distance: 3.5
     ),
     Chef(email: "phamngocnhan@gmail.com", name: "Nhan Pham", password: "minh123",
         addr: "Nguyen Dinh Chieu",
         role: Account_Type.values[1],
         phone: "0981874736",
         avatar: "assets/chef5.jpg",
         star: 3.0,
         price: 65000,
         distance: 6.0
     ),
   ];
  }

  @override
  List<Consumer> getConsumerList() {
    return [
      Consumer(
          email: 'minhtq2197@gmail.com', name: "minhtq2197",
          phone: "0981874736",password: "minhtq2197", addr: "nguyenvancu39", role: Account_Type.values[0]
      ),

      Consumer(
          email: 'nguyenduongmainhung@gmail.com', name: "nhung2611",
          phone: "0981874736",password: "nhung2611", addr: "caothang10", role: Account_Type.values[0]
      ),

      Consumer(
          email: 'denvau@gmail.com', name: "denvau1305",
          phone: "0981874736",password: "denvau1305", addr: "thaibinh54", role: Account_Type.values[0]
      ),
    ];
  }

  @override
  List<Food> getFoodList() {
    return [
      Food(id: 1, name: "Miso croque madame", title: "Miso croque",cateId: "cate01", avatar: "assets/food01.jpg"),
      Food(id: 2, name: "Berry muesli", title: "Berry muesli", cateId: "cate01", avatar: "assets/food02.jpg"),
      Food(id: 3, name: "Arabian buttered eggs", title: "Buttered eggs", cateId: "cate01", avatar: "assets/food03.jpg"),
      Food(id: 4, name: "Banana muffins with passionfruit glace icing", title: "Banana muffins", cateId: "cate01", avatar: "assets/food04.jpg"),
      Food(id: 5, name: "Poached rhubarb with labne", title: "Poached rhubarb",cateId: "cate01", avatar: "assets/food05.jpg"),
      Food(id: 6, name: "Tuna Carbonara", title: "Tuna Carbonara", cateId: "cate02", avatar: "assets/food06.jpg"),
      Food(id: 7, name: "Quick Shrimp Scampi", title: "Shrimp Scampi", cateId: "cate02", avatar: "assets/food07.jpg"),
      Food(id: 8, name: "Lemon Pasta With Pine Nuts and Broccoli", title: "Lemon Pasta",cateId: "cate02", avatar: "assets/food08.jpg"),
      Food(id: 9, name: "Spinach and Artichoke Stuffed Chicken Breast", title: "Spinach&Artichoke", cateId: "cate02", avatar: "assets/food09.jpg"),
      Food(id: 10, name: "BLT Pizza", title: "BLT Pizza", cateId: "cate02", avatar: "assets/food10.jpg"),
      Food(id: 11, name: "Grilled Steak Fajitas", title: "Grilled Steak",cateId: "cate03", avatar: "assets/food11.jpg"),
      Food(id: 12, name: "Shredded Chicken Gyros", title: "Chicken Gyros",cateId: "cate03", avatar: "assets/food12.jpg"),
      Food(id: 13, name: "Pepperoni Pizza Loaf", title: "Pepperoni Pizza",cateId: "cate03", avatar: "assets/food13.jpg"),
      Food(id: 14, name: "Cashew-Chicken Rotini Salad", title: "Cashew-Chicken",cateId: "cate03", avatar: "assets/food14.jpg"),
      Food(id: 15, name: "Honey-Lime Roasted Chicken", title: "Honey-Lime Chicken",cateId: "cate03", avatar: "assets/food15.jpg"),
      Food(id: 16, name: "Avocado Fries", title: "Avocado Fries",cateId: "cate04", avatar: "assets/food16.jpg"),
      Food(id: 17, name: "Baked Chicken Nuggets", title: "Chicken Nuggets",cateId: "cate04", avatar: "assets/food17.jpg"),
      Food(id: 18, name: "Egg Cups", title: "Egg Cups",cateId: "cate04", avatar: "assets/food18.jpg"),
      Food(id: 19, name: "Steak Tips and Mushrooms", title: "Steak Tips",cateId: "cate04", avatar: "assets/food19.jpg"),
      Food(id: 20, name: "Crab Cakes", title: "Crab Cakes",cateId: "cate04", avatar: "assets/food20.jpg"),
      Food(id: 21, name: "Raspberry and Pistachio Semifreddo", title: "Raspberry Semifreddo",cateId: "cate05", avatar: "assets/food21.jpg"),
      Food(id: 22, name: "Blueberry Whoopie Pies", title: "Blueberry Whoopie",cateId: "cate05", avatar: "assets/food22.jpg"),
      Food(id: 23, name: "Raspberry Crumb Bars", title: "Raspberry Crumb",cateId: "cate05", avatar: "assets/food23.jpg"),
      Food(id: 24, name: "Rainbow Waffle Sandwiches", title: "Waffle Sandwiches", cateId: "cate05", avatar: "assets/food24.jpg"),
      Food(id: 25, name: "Blueberry Mint Cocktail", title: "Blueberry Cocktail", cateId: "cate05", avatar: "assets/food25.jpg"),
      Food(id: 26, name: "Aperol Spritz", title: "Aperol Spritz", cateId: "cate06", avatar: "assets/food26.jpg"),
      Food(id: 27, name: "Bellini", title: "Bellini", cateId: "cate06", avatar: "assets/food27.jpg"),
      Food(id: 28, name: "Black Russian", title: "Black Russian", cateId: "cate06", avatar: "assets/food28.jpg"),
      Food(id: 29, name: "Bloody Mary", title: "Bloody Mary", cateId: "cate06", avatar: "assets/food29.jpg"),
      Food(id: 30, name: "Champagne Cocktail", title: "Champagne Cocktail", cateId: "cate06", avatar: "assets/food30.jpg"),
    ];
  }

  @override
  List<ChefFood> getChefFood() {
    return [
      ChefFood(chefEmail: "dongocduy@gmail.com", foodId: 1),
      ChefFood(chefEmail: "dongocduy@gmail.com", foodId: 2),
      ChefFood(chefEmail: "dongocduy@gmail.com", foodId: 3),
      ChefFood(chefEmail: "dongocduy@gmail.com", foodId: 4),
      ChefFood(chefEmail: "dongocduy@gmail.com", foodId: 5),
      ChefFood(chefEmail: "tranquangminh@gmail.com", foodId: 1),
      ChefFood(chefEmail: "tranquangminh@gmail.com", foodId: 2),
      ChefFood(chefEmail: "tranquangminh@gmail.com", foodId: 3),
      ChefFood(chefEmail: "tranquangminh@gmail.com", foodId: 4),
      ChefFood(chefEmail: "tranquangminh@gmail.com", foodId: 5),
      ChefFood(chefEmail: "phamnguyentrunghieu@gmail.com", foodId: 1),
      ChefFood(chefEmail: "phamnguyentrunghieu@gmail.com", foodId: 2),
      ChefFood(chefEmail: "phamnguyentrunghieu@gmail.com", foodId: 3),
      ChefFood(chefEmail: "phamnguyentrunghieu@gmail.com", foodId: 4),
      ChefFood(chefEmail: "phamnguyentrunghieu@gmail.com", foodId: 5),
      ChefFood(chefEmail: "nguyenngocphieu@gmail.com", foodId: 1),
      ChefFood(chefEmail: "nguyenngocphieu@gmail.com", foodId: 2),
      ChefFood(chefEmail: "nguyenngocphieu@gmail.com", foodId: 3),
      ChefFood(chefEmail: "nguyenngocphieu@gmail.com", foodId: 4),
      ChefFood(chefEmail: "nguyenngocphieu@gmail.com", foodId: 5),
      ChefFood(chefEmail: "phamngocnhan@gmail.com", foodId: 1),
      ChefFood(chefEmail: "phamngocnhan@gmail.com", foodId: 2),
      ChefFood(chefEmail: "phamngocnhan@gmail.com", foodId: 3),
      ChefFood(chefEmail: "phamngocnhan@gmail.com", foodId: 4),
      ChefFood(chefEmail: "phamngocnhan@gmail.com", foodId: 5),
    ];
  }

  @override
  List<Category> cateGoryList() {
    List<Food> getCateOneFoodList = [];
    List<Food> getCateTwoFoodList = [];
    List<Food> getCateThreeFoodList = [];
    List<Food> getCateFourFoodList = [];
    List<Food> getCateFiveFoodList = [];
    List<Food> getCateSixFoodList = [];
    getCateOneFoodList.addAll(getFoodList().where((element) => element.cateId.compareTo("cate01") == 0));
    getCateTwoFoodList.addAll(getFoodList().where((element) => element.cateId.compareTo("cate02") == 0));
    getCateThreeFoodList.addAll(getFoodList().where((element) => element.cateId.compareTo("cate03") == 0));
    getCateFourFoodList.addAll(getFoodList().where((element) => element.cateId.compareTo("cate04") == 0));
    getCateFiveFoodList.addAll(getFoodList().where((element) => element.cateId.compareTo("cate05") == 0));
    getCateSixFoodList.addAll(getFoodList().where((element) => element.cateId.compareTo("cate06") == 0));

    return [
      Category(id: "cate01", title: "Breakfast and brunch", image: "assets/cate_background.jpg", foodList: getCateOneFoodList),
      Category(id: "cate02", title: "Easy weeknight meat", image: "assets/cate_background.jpg", foodList: getCateTwoFoodList),
      Category(id: "cate03", title: "Make-ahead lunches", image: "assets/cate_background.jpg", foodList: getCateThreeFoodList),
      Category(id: "cate04", title: "Healthy receipt", image: "assets/cate_background.jpg", foodList: getCateFourFoodList),
      Category(id: "cate05", title: "Deserts", image: "assets/cate_background.jpg", foodList: getCateFiveFoodList),
      Category(id: "cate06", title: "Drinks", image: "assets/cate_background.jpg", foodList: getCateSixFoodList),
    ];
  }

  @override
  Category getCategoryById(String id) {
    List<Category> _cateList = cateGoryList();
    for(Category cate in _cateList) {
      if(cate.id.compareTo(id) == 0) {
        return cate;
      }
    }
    return null;
  }

}