import 'package:flutter/material.dart';
import 'package:flutter_module/FourthPage.dart';

import 'ThreePage.dart';

class PageTwo extends MaterialPageRoute<Null> {
  PageTwo() : super(builder:(BuildContext ctx) {
    return Scaffold(
      body: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.only(top: 80.0, left: 23.0),
                  child: Image.asset('assets/images/Group.png', height: 60.0, width: 60.0)
              ),
              new Container(
                  padding: EdgeInsets.only(top: 80.0, left:7.73),
                  child: Text("Puantör", style: TextStyle(fontFamily: 'Robotico', fontSize: 25.0))
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.only(top:53.0, left: 32.0),
                  child: Text("Hello!", style: TextStyle(fontFamily: 'Robotico', fontSize: 28.0, fontWeight: FontWeight.bold))
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.only(top: 10.0, left: 32.0),
                  child: Text("Welcome to salary calculation app!", style: TextStyle(fontFamily: 'Robotico', fontSize: 20.0))
              )
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(left: 32.0, top: 10.0),
                width: 350.0,
                child: TextField(
                  decoration: const InputDecoration(hintText: 'e-mail'),
                ),
              )
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.only(left: 32.0),
                  width: 350.0,
                  child: TextField(
                    decoration: const InputDecoration(hintText: 'password'),
                  )
              )
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.only(left: 32.0, top: 20.0),
                  child: FlatButton(
                      onPressed: (){

                      },
                      color: Color.fromRGBO(117, 64, 238, 0.3),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Color.fromRGBO(117, 64, 238, 1),width: 2),
                          borderRadius: BorderRadius.circular(23)),
                      child: Text('Login', textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0, fontFamily: 'Robotico', color:Color.fromRGBO(117, 64, 238, 1)))
                  )
              ),
              new Container(
                  child: FlatButton(
                    padding: EdgeInsets.only(left: 110.0, top: 25.0),
                    child: Text('Forget password?', style: TextStyle(decoration: TextDecoration.underline, fontSize: 16.0, fontFamily: 'Robotico', color:Color.fromRGBO(117, 64, 238, 1))),

                  onPressed: (){
                    Navigator.of(ctx).push(new MaterialPageRoute(builder:
                        (BuildContext context) =>FourPage()));
                  },)
              )
            ],
          ),
          new Row(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(top: 182.0, left: 56.5),
                child: Text('Still without account?',
                  style: TextStyle(fontSize: 20.0, fontFamily: 'Robotico', fontWeight: FontWeight.bold, color: Color.fromRGBO(120, 121, 147, 1)),
                ),
              ),
              new Container(
                  child: FlatButton(
                    onPressed: (){
                      Navigator.push(ctx, PageThree());
                    },
                    padding: EdgeInsets.only(top: 182.0),
                    child: Text('Create one!', style: TextStyle(decoration: TextDecoration.underline, fontSize: 20.0, fontFamily: 'Robotico', color:Color.fromRGBO(255, 112, 82, 1))),
                  )
              )
            ],
          )
        ],
      ),
    );
  });
}
