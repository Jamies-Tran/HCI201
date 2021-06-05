import 'package:flutter/material.dart';
import 'package:hci_201/model/category.dart';

class CategoryCard extends StatefulWidget {

  List<Category> cateList;

  bool isSelected;

  CategoryCard({this.cateList, this.isSelected});

  @override
  _CategoryCardState createState() => _CategoryCardState();

}

class _CategoryCardState extends State<CategoryCard> {

  Color color;

  @override
  Widget build(BuildContext context) {
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

              },
              selectedTileColor: Colors.redAccent,
            ),
          );
        },
    );
  }
}
