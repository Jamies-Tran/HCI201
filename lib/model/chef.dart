import 'package:hci_201/model/account.dart';
import 'package:hci_201/model/category.dart';
import 'package:hci_201/model/chef_food.dart';
import 'package:hci_201/model/get_enum.dart';

class Chef extends Account {
  String addr;
  String email;
  String errMsg;
  String name;
  String password;
  String phone;
  String avatar;
  Account_Type role;
  List<Category> cateList = [];
  List<ChefFood> chefFood = [];
  double star;
  int price;
  double distance;
  bool isThereFollower = false;
  RegExp reg;

  String profile;
  int noWorkingDayFrom;
  int noWorkingDayTo;


  Chef(
      {this.email, this.password, this.name, this.phone, this.addr, this.star = 0, this.avatar, this.role, this.price, this.distance ,
       this.noWorkingDayFrom, this.noWorkingDayTo})
      :
        super(email: email,
          password: password,
          name: name,
          phone: phone,
          addr: addr,
          role: role);


  List<int> getWorkingDayList() {
    List<int> _workingDayList = [];
    for (int i = noWorkingDayFrom; i <= noWorkingDayTo; i++) {
      _workingDayList.add(i);
    }
    return _workingDayList;
  }

  bool isAvailable(int _day) {
    List<int> _workingDayList = getWorkingDayList();
    return _workingDayList.contains(_day);
  }

  DateTime getWorkingDayFrom(DateTime _date) {
    int countDay = 0;
    int day = 0;
    int getWeekDay = _date.weekday;
    if (_date.weekday == this.noWorkingDayFrom) {
      return _date;
    } else if (_date.weekday > this.noWorkingDayFrom) {
      while (day < this.noWorkingDayFrom) {
        while (getWeekDay < DateTime.daysPerWeek) {
          countDay = countDay + 1;
          getWeekDay = getWeekDay + 1;
        }
        countDay = countDay + 1;
        day = day + 1;
      }
      _date = _date.add(Duration(days: countDay));
      return _date;
    } else {
      while (getWeekDay < this.noWorkingDayFrom) {
        countDay = countDay + 1;
        getWeekDay = getWeekDay + 1;
      }
      _date = _date.add(Duration(days: countDay));
      return _date;
    }
  }

  DateTime getWorkingDayTo(DateTime _date) {
    int countDay = 0;
    int day = 0;
    int getWeekDay = _date.weekday;
    if (_date.weekday == this.noWorkingDayTo) {
      return _date;
    } else if (_date.weekday > this.noWorkingDayTo) {
      while (day < this.noWorkingDayTo) {
        while (getWeekDay < DateTime.daysPerWeek) {
          countDay = countDay + 1;
          getWeekDay = getWeekDay + 1;
        }
        countDay = countDay + 1;
        day = day + 1;
      }
      _date = _date.add(Duration(days: countDay));
      return _date;
    }else  {
      while (getWeekDay < this.noWorkingDayTo) {
        countDay = countDay + 1;
        getWeekDay = getWeekDay + 1;
      }
      _date = _date.add(Duration(days: countDay));
      return _date;
    }
  }


      // implement super class method (valid datata) - start
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

      @override
      bool validEmail() {
        reg = RegExp(r"^([a-zA-Z0-9]+)@([a-z]+)\.([a-z]+)$",
            multiLine: false, caseSensitive: false);
        if (!reg.hasMatch(email) || email.isEmpty || email == "") {
          errMsg = "Invalid email";
          return false;
        }
        return true;
      }

      @override
      bool validName() {
        reg = RegExp(r"^([a-zA-Z]+)([0-9]+)$",
            multiLine: false, caseSensitive: false);
        if (!reg.hasMatch(name) || name.isEmpty || name == "") {
          errMsg = "Invalid email(Ex: mealguru123@gmail.com).";
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
        reg = RegExp(r"^[0-9]$", multiLine: false, caseSensitive: false);
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

      // implement super class method (valid datata) - end

      bool validPrice() {
        reg = RegExp(r"^[0-9]$", multiLine: false, caseSensitive: false);
        if (!reg.hasMatch(price.toString()) || price
            .toString()
            .length < 4) {
          errMsg = "Invalid price(Ex: 5000)";
          return false;
        }
        return true;
      }

      // valid-data-end

      bool getIsFollowed() {
        return this.isThereFollower;
      }

      void setIsFollowed(bool isFollowed) {
        this.isThereFollower = isFollowed;
      }
    }
