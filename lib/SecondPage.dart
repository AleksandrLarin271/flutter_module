import 'package:flutter/material.dart';

import 'ThreePage.dart';

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
