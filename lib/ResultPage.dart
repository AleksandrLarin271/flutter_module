import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_module/FourthPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultPage extends StatefulWidget {
  SharedPreferences prefs;
  ResultPage(this.prefs);
  @override
  State createState()=>_ResultPageState(this.prefs);
}

class _ResultPageState extends State<ResultPage> {

  SharedPreferences prefs;
  Map<DateTime,List<dynamic>> _events;
  _ResultPageState(this.prefs);
  @override
  void initState() {
    super.initState();
    _events = Map<DateTime,List<dynamic>>.from(decodeMap(json.decode(prefs.getString("events") ?? "{}")));

  }

  Map<DateTime,dynamic> decodeMap(Map<String,dynamic> map) {
    Map<DateTime,dynamic> newMap = {};
    map.forEach((key,value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }
  List<Widget> er(){
    List<Container> list_res=new List<Container>();
    _events.forEach((var key,var value){
      list_res.add(Container(
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(5)
            ),
          boxShadow: [
          new BoxShadow(
          color: hexToColor("#e9e9ef"),
          offset: new Offset(20.0, 10.0),
              )
           ]),
        child: Center(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
                 Text(value.toString().split("{")[1].split("}")[0].split(",")[0].split(":")[1]),
                 Text("2"),
                 Text("3")
              ],
            ),
          )
        )
      );
      print('${key}  ${value.toString()} ');
    });
    return list_res;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
          child: Column(
              children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top:20),
                          child:FlatButton(
                                child: Image.asset("assets/images/arrow_back.png"),
                                onPressed: (){

                                },
                            )
                        ),
                        Center(
                            child:Container(
                                child:Text("Earnings",
                                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal,fontWeight: FontWeight.normal))
                          )
                        )
                      ]
                    ),
                    Container(
                      height: 158,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: <Widget>[
                           Column(
                             children: <Widget>[
                                Text(
                                    "total hours",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color:hexToColor("#6B7897")
                                    )
                                ),
                                Text(
                                    "45",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                        color:hexToColor("#FF7052")
                                    )
                                ),
                                Text(
                                    "son ay",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.normal,
                                        color:hexToColor("#34485E")
                                    )
                                )
                             ],
                           ),
                           Column(
                             children: <Widget>[
                               Text(
                                   "total earnings",
                                   style: TextStyle(
                                       fontSize: 15,
                                       fontWeight: FontWeight.w500,
                                       fontStyle: FontStyle.normal,
                                       color:hexToColor("#6B7897")
                                   )
                               ),
                               Text(
                                   "\$450",
                                   style: TextStyle(
                                       fontSize: 40,
                                       fontWeight: FontWeight.normal,
                                       fontStyle: FontStyle.normal,
                                       color:hexToColor("#1F3F66")
                                   )
                               ),
                               Text(
                                   "(United States Dollar - USD)",
                                   style: TextStyle(
                                       fontSize: 9,
                                       fontWeight: FontWeight.normal,
                                       fontStyle: FontStyle.normal,
                                       color:hexToColor("#1F3F66")
                                   )
                               )
                             ],
                           )
                         ],
                        )
                      ),

                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: er()

                    )
                ]
            )
        )
    );

  }


}

