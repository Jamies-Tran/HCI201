import 'package:flutter/material.dart';

class Visitor extends StatelessWidget {
  const Visitor({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/index.png"),
          fit: BoxFit.cover
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 170,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text(
                  'LOG IN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: Colors.red
                  ),
                ),
                color: Colors.white,

              ),
            ),
            SizedBox(width: 50,),
            ButtonTheme(
                minWidth: 170,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/reg');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.red
                    ),
                  ),
                  color: Colors.white,
                )
            )
          ],
        ),
      ),
    );
  }
}
