import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hci_201/model/chef.dart';

class ChefCard extends StatefulWidget {

  List<Chef> chefList = [];

  ChefCard({this.chefList});

  @override
  _ChefCardState createState() => _ChefCardState();
}

class _ChefCardState extends State<ChefCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.chefList.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(14, 20, 10, 0),
                // cac widget duoc tao boi ListView.builder se phai duoc dat trong container de
                // tranh truong hop height cua widget bang infinite
                width: MediaQuery.of(context).size.width * 0.98,
                // day la height container chua image avatar
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: AssetImage("${widget.chefList[index].avatar}"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(width: 30),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                // cac widget duoc tao boi ListView.builder se phai duoc dat trong container de
                // tranh truong hop height cua widget bang infinite
                width: MediaQuery.of(context).size.width * 1.0,
                // day la height container chua cac listile
                height: MediaQuery.of(context).size.height * 0.3,
                child: Card(
                  child: ListTile(
                    title: Text(
                      '${widget.chefList[index].name}',
                      style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'flower',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0
                      ),
                    ),
                    subtitle: Text(
                      '${widget.chefList[index].email} \n ${widget.chefList[index].price} VND/hours , ${widget.chefList[index].star} star \n ${widget.chefList[index].addr} - 4.3km \n',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'koho',
                          letterSpacing: 1.0
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/chef_profile");
                    },
                  ),
                ),
              ),
              SizedBox(width: 30),
            ]
          );
        }
    );
  }
}
