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
          body:new Container(
            child: new Center(
              child: new Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children:<Widget>[
                    new FlatButton(
                        onPressed: (){
                        Navigator.push(ctx, PageTwo());
                     },
                     child: Image.asset('assets/images/Group.png')
                      ),
                    new Image.asset('assets/images/image.png')

                  ]
              ),
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
            Navigator.push(ctx, PageFour());
          },
          child: Text("Register!"),
        ),
      ),
    );
  });
}

class PageFour extends MaterialPageRoute<Null>{
  PageFour() :super(builder: (BuildContext ctx) {
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
      body:new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children:<Widget>[
                new TextField(
                  decoration: new InputDecoration(
                    hintText: "Hey Larin Chyhka"
                  ),

                  ),
                  new Text("")

              ]
            ),
          ),
      )


    );
  });
}

