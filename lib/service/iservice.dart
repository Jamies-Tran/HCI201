import 'package:hci_201/model/food.dart';

abstract class IService {
  Food findFoodByID(List<Food> foodList, String id);

  Food findFoodByName(List<Food> foodList, String name);
}