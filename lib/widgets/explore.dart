// ToDo: explore
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({Key key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Explore view"),
      ),
      color: Colors.grey[400],
    );
  }
}
