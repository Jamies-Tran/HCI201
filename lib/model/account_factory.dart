import 'package:hci_201/model/account.dart';
import 'package:hci_201/model/chef.dart';
import 'package:hci_201/model/consumer.dart';

class AccountFactory{
  String email;
  String password;
  String name;
  String phone;
  String addr;

  AccountFactory({this.email, this.password ,this.name, this.phone, this.addr});

  Account getAccount(String accountType) {
    if (accountType == "CONSUMER") {
      return Consumer(email: email, password: password ,name: name, phone: phone, addr: addr);
    } else if(accountType == "CHEF"){
      return Chef(email: email, password: password , name: name, phone: phone, addr: addr);
    }
  }
}
