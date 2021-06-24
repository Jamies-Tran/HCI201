import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hci_201/model/consumer.dart';
import 'package:hci_201/service/iservice.dart';
import 'package:hci_201/service/serviceimpl.dart';
import 'package:hci_201/widgets/appbar.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key key}) : super(key: key);

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  String email;
  TextEditingController _email;
  GlobalKey<FormState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  void _saveForm() {
    bool isValid = _key.currentState.validate();
    print(email);
    if(isValid == true) {
      Navigator.pushNamed(context, "/change_password", arguments: {
        'email' : email
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    IService service = ServiceImpl();
    return Scaffold(
      appBar: MyAppBar(context, "Forgot password"),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/logintheme.png"),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              child: SingleChildScrollView(
                child: Form(
                    key: _key,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          padding: EdgeInsets.fromLTRB(0, 200, 0, 100),
                          child: TextFormField(
                            controller: _email,
                            validator: (String value) {
                              setState(() {
                                email = value;
                              });
                              Consumer _acc = service.getConsumerByEmail(email);
                              if(_acc == null) {
                                return "We can't find your account.";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: 'Input your email',
                                labelStyle: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'koho',
                                    letterSpacing: 2.0
                                ),
                                suffixIcon: IconButton(
                                  onPressed: _saveForm,
                                  icon: Icon(Icons.forward, color: Colors.redAccent)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2, color: Colors.pinkAccent),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                filled: true,
                                fillColor: Colors.white
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
