import 'package:flutter/material.dart';

import 'FourthPage.dart';

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
