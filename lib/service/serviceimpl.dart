import 'package:flutter/cupertino.dart';
import 'package:hci_201/model/account.dart';
import 'package:hci_201/model/consumer.dart';
import 'package:hci_201/model/food.dart';
import 'package:hci_201/model/get_enum.dart';
import 'package:hci_201/service/iservice.dart';

class ServiceImpl implements IService {

  @override
  Food findFoodByID(List<Food> foodList, String id) {
    for(Food x in foodList) {
      if(x.getId() == id) {
        return x;
      }
    }
    return null;
  }

  @override
  Food findFoodByName(List<Food> foodList, String name) {
    RegExp regex = RegExp(name, multiLine: false, caseSensitive: true);
    for(Food x in foodList) {
      if(regex.hasMatch(x.getName())) {
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

  @override
  List<Account> getAccountList() {
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
  Account loginAcc(String email, String password) {
    List<Account> accList = getAccountList();
    for(int i = 0; i < accList.length; i++) {
      if(accList[i].getEmail().compareTo(email) == 0 && accList[i].getPassword().compareTo(password) == 0) {
        return accList[i];
      }
    }
    return null;
  }

  @override
  Future<void> loginChangeScreen(Account _acc, BuildContext context) async {
    await Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamed(context, "/main", arguments: {
        'acc' : _acc
      });
    });
  }

  @override
  Future<void> regChangeScreen(Account _acc, BuildContext context) async {
    await Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamed(context, "/reg2", arguments: {
        'acc' : _acc
      });
    });
  }

}