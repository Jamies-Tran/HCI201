// ToDo: explore
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hci_201/model/account.dart';
import 'package:hci_201/model/chef.dart';
import 'package:hci_201/model/get_enum.dart';
import 'package:hci_201/widgets/chef_card.dart';

class Explore extends StatefulWidget {
  const Explore({Key key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  List<Chef> chefList = [
    Chef(email: "dongocduy@gmail.com", name: "Duy Do", password: "duy123",
        addr: "Cao Thang",
        role: Account_Type.values[1],
        phone: "0981874736",
        avatar: "assets/chef1.jpg"
      ),
    Chef(email: "tranquangminh@gmail.com", name: "Minh Tran", password: "minh123",
        addr: "phan van tri",
        role: Account_Type.values[1],
        phone: "0981874736",
        avatar: "assets/chef2.jpg"
      ),
    Chef(email: "phamnguyentrunghieu@gmail.com", name: "Hieu Pham", password: "minh123",
        addr: "Thu Duc",
        role: Account_Type.values[1],
        phone: "0981874736",
        avatar: "assets/chef3.jpg"
      ),
    Chef(email: "nguyenngocphieu@gmail.com", name: "Phieu Nguyen", password: "minh123",
        addr: "Duong so ba",
        role: Account_Type.values[1],
        phone: "0981874736",
        avatar: "assets/chef4.jpg"
      ),
    Chef(email: "phamngocnhan@gmail.com", name: "Nhan Pham", password: "minh123",
        addr: "Nguyen Dinh Chieu",
        role: Account_Type.values[1],
        phone: "0981874736",
        avatar: "assets/chef5.jpg"
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Text(
              "Chef around me",
              style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'koho',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0
              )
          ),
          SizedBox(height: 30),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ChefCard(chefList: chefList),
          ),
          SizedBox(height: 30),
          Text(
            'Chef\'s food ',
              style: TextStyle(
                  fontSize: 35,
                  fontFamily: 'koho',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0
              )
          ),
        ]
      ),
    );
  }
}
