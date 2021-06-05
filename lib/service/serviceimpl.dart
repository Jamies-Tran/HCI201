import 'package:hci_201/model/food.dart';
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

}