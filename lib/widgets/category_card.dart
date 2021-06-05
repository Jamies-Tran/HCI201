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
    Map data = ModalRoute.of(context).settings.arguments;
    Account _acc = data['acc'];
    return ListView.builder(
        itemCount: widget.cateList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("${widget.cateList[index].getImage()}"),
              ),
              onTap: () {
                widget.isSelected = !widget.isSelected;
                setState(() {
                  if(widget.isSelected == true) {
                    _acc.getCateList().add(widget.cateList[index]);
                  }else {
                    _acc.getCateList().remove(widget.cateList[index]);
                  }
                });
              },
              selectedTileColor: Colors.redAccent,
            ),
          );
        },
    );
  }
}
