

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'SecondPage.dart';


void main() {
  runApp(MaterialApp(
    home:SalaryApp(),
    theme: themeData,
  ));
}

final ThemeData themeData = new ThemeData(
  canvasColor: Colors.white,
  accentColor: Colors.redAccent,

);
//
class SalaryApp extends StatelessWidget {
    @override
    Widget build(BuildContext ctx){
      return Scaffold(
          body: new Center(
            child:new Container(
              child: new Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children:<Widget>[
                    new Container(
                      padding: const EdgeInsets.only(top:300,bottom:20.0 ),
                      child:new FlatButton(
                        onPressed: (){
                          Navigator.push(ctx, PageTwo());
                        },
                        child: Image.asset('assets/images/Group.png')
                    ),
                  ),
                    Container(
                      padding: const EdgeInsets.only(top:200, bottom: 47.0),
                      child: Image.asset('assets/images/image.png'),
                    ),


            ]
            ),
            ),
        ),
      );
    }
}




