import 'package:flutter/cupertino.dart';
import 'package:hci_201/model/account.dart';
import 'package:hci_201/model/food.dart';

abstract class IService {
  Food findFoodByID(List<Food> foodList, String id);

  Food findFoodByName(List<Food> foodList, String name);

  Future<void> errChangeScreen(String err, BuildContext context);

  Future<void> loginChangeScreen(Account _acc, BuildContext context);

  Future<void> regChangeScreen(Account _acc, BuildContext context);

  List<Account> getAccountList();

  Account loginAcc(String email, String password);
}