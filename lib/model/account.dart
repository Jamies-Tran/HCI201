// đây là abstract class của 2 class là chef và consumer
abstract class Account {
  String email;
  String password;
  String name;
  String phone;
  String addr;

  Account({this.email, this.password, this.name, this.phone, this.addr});
}
