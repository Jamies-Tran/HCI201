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
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: AssetImage("${widget.chefList[index].getAvatar()}"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Card(
                  child: ListTile(
                    title: Text(
                      '${widget.chefList[index].getName()}',
                      style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'flower',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0
                      ),
                    ),
                    subtitle: Text(
                      '${widget.chefList[index].getEmail()} \n ${widget.chefList[index].getStar()} - Stars \n ${widget.chefList[index].getAddr()} - 4.3km \n'
                          '${widget.chefList[index].getPrice()} VND/hours',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'koho',
                          letterSpacing: 1.0
                      ),
                    ),
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