import 'package:flutter/material.dart';
import 'package:hci_201/widgets/appbar.dart';


class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController nameController;
  TextEditingController addrController;
  String email;
  String password;
  String name;
  String addr;


  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    addrController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    addrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, "Register"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: Text(
                    'Please fill in a few detail below.',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'koho',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0
                    ),
                  ),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'koho',
                      letterSpacing: 2.0
                    ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      )
                  ),
                  onChanged: (String value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                          fontSize: 20,
                          fontFamily: 'koho',
                          letterSpacing: 2.0
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      )
                  ),
                  onChanged: (String value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(
                          fontSize: 20,
                          fontFamily: 'koho',
                          letterSpacing: 2.0
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      )
                  ),
                  onChanged: (String value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextField(
                  controller: addrController,
                  decoration: InputDecoration(
                      labelText: "Address",
                      labelStyle: TextStyle(
                          fontSize: 20,
                          fontFamily: 'koho',
                          letterSpacing: 2.0
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      )
                  ),
                  onChanged: (String value) {
                    setState(() {
                      addr = value;
                    });
                  },
                ),
                SizedBox(height: 100),
                ButtonTheme(
                  minWidth: 400,
                  height: 50,
                  buttonColor: Colors.black,
                  child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'koho',
                            letterSpacing: 2.0,
                            color: Colors.white
                          ),
                      ),
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          ),
      )
      );
  }
}