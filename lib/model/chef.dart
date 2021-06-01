import 'package:hci_201/model/account.dart';
import 'package:hci_201/input_convention/verify.dart';

class Chef extends Account implements Verify /* Verify trong package input_convention */ {

  String email;
  String name;
  String phone;

  Chef({this.email, this.name, this.phone}) : super();

  @override
  bool validData() {
    RegExp reg;
    bool valid = true;
    reg = RegExp(r"^([a-zA-Z0-9]+)@([a-z]+)\.([a-z]+)$", multiLine: false, caseSensitive: false);
    if (!reg.hasMatch(email)) {
      valid = false;
    }
    reg = RegExp(r"^([a-zA-Z]+)([0-9]+)$", multiLine: false, caseSensitive: false);
    if (!reg.hasMatch(name)) {
      valid = false;
    }
    reg = RegExp(r"^[0-9]+$", multiLine: false, caseSensitive: false);
    if (!reg.hasMatch(email)) {
      valid = false;
    }
    return valid;
  }
}