

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
      body: new Column(

              children:<Widget>[

                 new Row(
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.only(top: 40,left:20),
                        child:new Text("Add Job"),
                      ),
                  ]),
                new Row(
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.only(top:20 ,left:20),
                          child:new Text("First, add a business to indicate "+
                              "your boiler type.")),
                    ]),

                new Container(

                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child:new TextField(
                  decoration: new InputDecoration(
                    hintText: "Hey Larin Chyhka"
                  ),

                  )),
                  new Row(
                    children: <Widget>[
                      Container(
                       child:new Text("Select Earnings Type"),
                        padding: const EdgeInsets.only(left: 20, top : 10),

                     ),

                   ]
                   ),
                new Row(
                    children: <Widget>[
                      Container(
                        width: 200,
                        child:new Text("per diem"),
                        padding: const EdgeInsets.only(left: 20, top : 10),
                      ),
                      Container (
                        padding: const EdgeInsets.only(right: 20),
                        width: 200.0,
                          child: TextField(
                        decoration: const InputDecoration(hintText: "50 \$"),

                      )),

                    ]
                ),
                new Row(
                    children: <Widget>[
                      Container(
                        width: 200,
                        child:new Text("hourly wages"),
                        padding: const EdgeInsets.only(left: 20, top : 10),
                      ),
                      Container (
                          padding: const EdgeInsets.only(right: 20),
                          width: 200.0,
                          child: TextField(
                            decoration: const InputDecoration(hintText: "5 \$"),

                          )),

                    ]
                ),
                new Row(
                    children: <Widget>[
                      Container(
                        width: 200,
                        child:new Text("manual entry"),
                        padding: const EdgeInsets.only(left: 20, top : 10),
                      ),
                      Container (
                          padding: const EdgeInsets.only(right: 20),
                          width: 200.0,
                          child: TextField(
                            decoration: const InputDecoration(hintText: "0"),

                          )),

                    ]
                ),
                new Row(
                  children: <Widget>[
                    new Container(
                      child: FlatButton(
                        child: Text('Saved',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0, color: Color.fromRGBO(255, 112, 82, 1))),
                         shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromRGBO(255, 112, 82, 1),width: 2),
                    borderRadius: BorderRadius.circular(23)),
                    ),
                  ),
                ]
                )
              ]
      )


    );
  });
}

