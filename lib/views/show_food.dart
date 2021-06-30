import 'package:flutter/material.dart';
import 'package:hci_201/model/category.dart';
import 'package:hci_201/model/food.dart';
import 'package:hci_201/service/iservice.dart';
import 'package:hci_201/service/serviceimpl.dart';
import 'package:hci_201/widgets/appbar.dart';

class ShowFood extends StatelessWidget {
  const ShowFood({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    String cateId = data['cateId'];
    String conEmail = data['conEmail'];
    IService service = ServiceImpl();
    Category _cate = service.getCategoryById(cateId);
    List<Food> _foodList = _cate.foodList;

    void onTapFunc(int index) {
      Navigator.pushNamed(context, '/food_info', arguments: {
        'food' : _foodList[index].id,
        'conEmail' : conEmail
      });
    }

    return Scaffold(
      appBar: MyAppBar(context, "${_cate.title}"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 5,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _foodList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      onTapFunc(index);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      padding: EdgeInsets.fromLTRB(0, 125, 0, 0),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("${_foodList[index].avatar}"),
                              fit: BoxFit.cover
                          ),
                          border: Border.all(width: 3.0, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text(
                        "${_foodList[index].name}",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'robo',
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
        ),
        // child: SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        //   child: Container(
        //     width: MediaQuery.of(context).size.width,
        //     height: MediaQuery.of(context).size.height,
        //     child: ListView.builder(
        //         itemCount: _foodList.length,
        //         itemBuilder: (context, index) {
        //           return Column(
        //             children: [
        //               GestureDetector(
        //                 onTap: () {
        //                   onTapFunc(index);
        //                 },
        //                 child: Container(
        //                   width: MediaQuery.of(context).size.width,
        //                   height: 200,
        //                   padding: EdgeInsets.fromLTRB(0, 125, 0, 0),
        //                   margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        //                   decoration: BoxDecoration(
        //                     image: DecorationImage(
        //                       image: AssetImage("${_foodList[index].avatar}"),
        //                       fit: BoxFit.cover
        //                     ),
        //                     border: Border.all(width: 3.0, color: Colors.redAccent),
        //                     borderRadius: BorderRadius.circular(15)
        //                   ),
        //                   child: Text(
        //                       "${_foodList[index].name}",
        //                       style: TextStyle(
        //                         fontSize: 25,
        //                         fontWeight: FontWeight.bold,
        //                         fontFamily: 'robo',
        //                         color: Colors.white
        //                       ),
        //                   ),
        //                 ),
        //               )
        //             ],
        //           );
        //         }
        //     ),
        //   ),
        // ),
      )
    );
  }
}
