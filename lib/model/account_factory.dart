import 'package:hci_201/model/account.dart';
import 'package:hci_201/model/chef.dart';
import 'package:hci_201/model/consumer.dart';

class AccountFactory{
  String email;
  String name;
  String phone;
  
  AccountFactory({this.email, this.name, this.phone});

  Account getAccount(bool isConsumer) {
    if (isConsumer == true) {
      return Consumer(email: email, name: name, phone: phone);
    } else {
      return Chef(email: email, name: name, phone: phone);
    }
  }
}
