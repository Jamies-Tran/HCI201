import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_201/model/account.dart';
import 'package:hci_201/model/category.dart';

class CategoryCard extends StatefulWidget {

  List<Category> cateList;

  bool isSelected;

  CategoryCard({this.cateList, this.isSelected});

  @override
  _CategoryCardState createState() => _CategoryCardState();

}

class _CategoryCardState extends State<CategoryCard> {

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute
        .of(context)
        .settings
        .arguments;
    Account _acc = data['acc'];
    return ListView.builder(
      itemCount: widget.cateList.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                  width: 2.0,
                  color: Colors.black
              )
          ),
          child: ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            leading: Container(
              // child: CircleAvatar(
              //   backgroundImage: AssetImage("${widget.cateList[index].getImage()}"),
              //   radius: 50,
              // ),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    image: AssetImage("${widget.cateList[index].getImage()}"),
                    fit: BoxFit.fitWidth),
              ),
            ),
            onTap: () {
              setState(() {
                widget.isSelected = !widget.isSelected;
              });
              widget.cateList[index].setSelectedChoice(widget.isSelected);
              if (widget.cateList[index].getSelectedChoice() == true) {
                _acc.getCateList().add(widget.cateList[index]);
              } else {
                if (_acc.getCateList().contains(widget.cateList[index])) {
                  _acc.getCateList().remove(widget.cateList[index]);
                }
              }
            },
            title: Text(
              widget.cateList[index].getTitle(),
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'koho',
                  letterSpacing: 2.0
              ),
            ),
            tileColor: widget.cateList[index].setColor(),
          ),
        );
      },
    );
  }
}
