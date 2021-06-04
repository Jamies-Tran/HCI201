// đây là abstract class của 2 class là chef và consumer
abstract class Account {
  String email;
  String password;
  String name;
  String phone;
  String addr;
  String errMsg;

  Account({this.email, this.password, this.name, this.phone, this.addr});

  bool validEmail() {
    throw UnimplementedError();
  }

  bool validPassword() {
    throw UnimplementedError();
  }

  bool validName() {
    throw UnimplementedError();
  }

  bool validPhone() {
    throw UnimplementedError();
  }

  bool validAddr() {
    throw UnimplementedError();
  }
}
