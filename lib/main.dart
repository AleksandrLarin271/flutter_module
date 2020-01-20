import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


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

class SalaryApp extends StatelessWidget {
    @override
    Widget build(BuildContext ctx){
      return Scaffold(
        body: Center(
          child: FlatButton(
            onPressed: (){
              Navigator.push(ctx, PageTwo());
            },
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      );
    }
}

class PageTwo extends MaterialPageRoute<Null> {
  PageTwo() : super(builder:(BuildContext ctx) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(ctx).accentColor,
          elevation: 1.0,
        ),
        body: Center(
          child: RaisedButton(
            onPressed: (){
              Navigator.push(ctx, PageThree());
            },
            child: Text("Register"),
          ),
        ),
      );
  });
}

class PageThree extends MaterialPageRoute<Null> {
  PageThree() :super(builder: (BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(ctx)
            .accentColor,
        elevation: 2.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(ctx);
            },
          )
        ],
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.popUntil(
                ctx, ModalRoute.withName(Navigator.defaultRouteName));
          },
          child: Text("Register!"),
        ),
      ),
    );
  });
}

