import 'package:hci_201/model/chef.dart';
import 'package:hci_201/model/food.dart';
import 'package:hci_201/service/iservice.dart';
import 'package:hci_201/service/serviceimpl.dart';


class ChefFood {

  String email;
  int id;
  IService service = ServiceImpl();

  // constructor
  ChefFood({this.email, this.id});

  Food getFood() {
    return service.getFoodByID(this.id);
  }

  Chef getChef() {
    return service.getChefByEmail(this.email);
  }

}