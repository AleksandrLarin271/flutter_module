import 'package:flutter/material.dart';
import 'auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'SecondPage.dart';
//var authHandler = new Auth();
class PageThree extends MaterialPageRoute<Null> {
  PageThree() :super(builder: (BuildContext ctx) {
    return Scaffold(
        body: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                  child: FlatButton(
                    padding: EdgeInsets.only(top:50.0),
                    onPressed: (){
                      Navigator.push(ctx, PageTwo());
                    },
                    child: Image.asset('assets/images/back.png'),
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(left: 32.0, top: 20.0),
                  child: Text('Sign Up', style: TextStyle(fontFamily: 'Robotico', fontWeight: FontWeight.bold, fontSize: 30.0, ),),
                )
              ],
            ),
            new Row(
              children: <Widget>[
                new Container(
                    padding: EdgeInsets.only(left: 32.0),
                    child: Text('Create an account to use Puantor\nwithout limits.\nFor free.', style: TextStyle(fontFamily: 'Robotico', fontSize: 23.0, color: Color.fromRGBO(120, 121, 147, 1)))
                )
              ],
            ),
            new Row(
              children: <Widget>[
                new Container(
                    padding: EdgeInsets.only(top: 10,left: 32.0),
                    width: 350.0,
                    child: TextField(
                      decoration: const InputDecoration(hintText: 'email address'),
                    )
                )
              ],
            ),
            new Row(
              children: <Widget>[
                new Container(
                    padding: EdgeInsets.only(top: 10,left: 32.0),
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
                    padding: EdgeInsets.only(top: 10,left: 32.0),
                    width: 350.0,
                    child: TextField(
                      decoration: const InputDecoration(hintText: 'repeat password'),
                    )
                )
              ],
            ),
            new Row(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(left: 32.0, top:20.0),
                  child: FlatButton(
                    onPressed: (){

                    },
                    color: Color.fromRGBO(255, 112, 82, 0.3),
                    child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0, color: Color.fromRGBO(255, 112, 82, 1))),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23)),
                  ),
                ),
                new Row(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(top: 190.0,),
                      child: Text('I already have one.',
                        style: TextStyle(fontSize: 20.0, fontFamily: 'Robotico', fontWeight: FontWeight.bold, color: Color.fromRGBO(120, 121, 147, 1)),
                      ),
                    ),
                    new Container(
                        child: FlatButton(
                          onPressed: (){
                            Navigator.push(ctx, PageThree());
                          },
                          padding: EdgeInsets.only(top: 190.0),
                          child: Text('Login.', style: TextStyle(decoration: TextDecoration.underline, fontSize: 20.0, fontFamily: 'Robotico', color:Color.fromRGBO(255, 112, 82, 1))),
                        )
                    )
                  ],
                )
              ],
            )
          ],
        )
    );
  });
}
