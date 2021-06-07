import 'package:hci_201/model/account.dart';
import 'package:hci_201/model/category.dart';
import 'package:hci_201/model/get_enum.dart';

class Consumer extends Account {
  String addr;
  String email;
  String errMsg;
  String name;
  String password;
  String phone;
  List<Category> cateList = [];
  Account_Type role;
  RegExp reg;

  Consumer({this.email, this.password, this.name, this.phone, this.addr, this.role})
      : super(
            email: email,
            password: password,
            name: name,
            phone: phone,
            addr: addr,
            role: role);



  // validate-start

  @override
  bool validEmail() {
    reg = RegExp(r"^([a-zA-Z0-9]+)@([a-z]+)\.([a-z]+)$",
        multiLine: false, caseSensitive: false);
    if (!reg.hasMatch(email) || email.isEmpty || email == "") {
      errMsg = "Invalid email(Ex: mealguru@gmail.com)";
      return false;
    }
    return true;
  }

  @override
  bool validName() {
    reg = RegExp(r"^([a-zA-Z]+)([0-9]+)$",
        multiLine: false, caseSensitive: false);
    if (!reg.hasMatch(name) || name.isEmpty || name == "") {
      errMsg = "Invalid username(Ex: jamies123).";
      return false;
    }
    if (name.length < 5 || name.length > 10) {
      errMsg = "Username length between 5 and 10.";
      return false;
    }
    return true;
  }

  @override
  bool validPassword() {
    reg = RegExp(r"^([a-zA-Z]+)([0-9]+)$",
        multiLine: false, caseSensitive: false);
    if (!reg.hasMatch(password) || password.isEmpty || password == "") {
      errMsg = "invalid password(Ex: mealguru123).";
      return false;
    }
    if (password.length < 5 || password.length > 10) {
      errMsg = "Password length between 5 and 10.";
      return false;
    }
    return true;
  }

  @override
  bool validPhone() {
    reg = RegExp(r"^([0-9]+)$", multiLine: false, caseSensitive: false);
    if (!reg.hasMatch(phone) ||
        phone.isEmpty ||
        phone == "" ||
        phone.length < 10 ||
        phone.length > 10) {
      errMsg = "invalid phone number(Ex: 0981874736).";
      return false;
    }
    return true;
  }

  @override
  bool validAddr() {
    reg = RegExp(r"^([a-zA-Z]+)([0-9]+)$",
        multiLine: false, caseSensitive: false);
    if (!reg.hasMatch(addr) || addr.isEmpty || addr == "") {
      errMsg = "Invalid address";
      return false;
    }
    return true;
  }

  // validate-end

  //getter-setter-start

  @override
  String getAddr() {
    return this.addr;
  }

  @override
  String getEmail() {
    return this.email;
  }

  @override
  String getName() {
    return this.name;
  }

  @override
  String getPassword() {
    return this.password;
  }

  @override
  String getPhone() {
    return this.phone;
  }

  @override
  Account_Type getRole() {
    return this.role;
  }

  @override
  void setAddr(String addr) {
    this.addr = addr;
  }

  @override
  void setEmail(String email) {
    this.email = email;
  }

  @override
  void setName(String name) {
    this.name = name;
  }

  @override
  void setPassword(String password) {
    this.password = password;
  }

  @override
  void setPhone(String phone) {
    this.phone = phone;
  }

  @override
  List<Category> getCateList() {
    return this.cateList;
  }

  @override
  void setCateList(List<Category> cateList) {
    this.cateList = cateList;
  }

  //getter-setter-end

  @override
  void addCategory(Category _cate) {
    if(_cate.getSelectedChoice() == true) {
      this.cateList.add(_cate);
      print('has added ${_cate.getTitle()}');
      print('${this.cateList.length}');
    }else {
      if(this.cateList.contains(_cate)) {
        this.cateList.remove(_cate);
        print('has remove ${_cate.getTitle()}');
        print('${this.cateList.length}');
      }
    }
  }

}
