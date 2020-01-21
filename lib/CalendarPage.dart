import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_module/FourthPage.dart';

class CalendarPage extends MaterialPageRoute<Null>{
  CalendarPage() :super(builder: (BuildContext ctx) {
  return Scaffold(
        body: Column(
          children: <Widget>[
            Container(
                width: Device.width,
              padding: const EdgeInsets.only(top: 30, left: 10),
              child:Row(
                children: <Widget>[
                  Image.asset('assets/images/Group.png',width: 18.58,height: 26.0,),

                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Puantör",
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal
                        ),
                      )
                  ),
                  Container(padding: const EdgeInsets.only(left: 200),
                    child: Image.asset("assets/images/stats.png",width: 30,height: 30)),
                  Container(padding: const EdgeInsets.only(left: 10),
                    child: Image.asset("assets/images/settings.png",width: 30,height: 30)),
              ],
            )
            ),
            Container(
              width: Device.screenWidth,
              height: Device.screenHeight-100,
              padding: const EdgeInsets.only(top: 20),
              child:   GridView.count(
              crossAxisCount: 7,
              primary: false,
              padding: const EdgeInsets.all(2),
                  children: <Widget>[
                            //weekday
                            Container(
                              color: hexToColor("#4A98F7"),
                             width: Device.screenWidth/7,
                             child: Center(child:Text("Pzt")),
                             padding: const EdgeInsets.only(left: 10),

                            ),
                            Container(
                              color: hexToColor("#4A98F7"),

                              width: Device.screenWidth/7,
                              child: Center(child:Text("Sal")),
                            ),
                            Container(
                              color: hexToColor("#4A98F7"),

                              width: Device.screenWidth/7,
                              child: Center(child:Text("Çrb")),
                            ),
                            Container(
                              color: hexToColor("#4A98F7"),

                              width: Device.screenWidth/7,
                              child: Center(child:Text("Prş")),
                            ),
                            Container(
                              color: hexToColor("#4A98F7"),

                              width: Device.screenWidth/7,
                              child: Center(child:Text("Cum")),
                            ),
                            Container(
                              color: hexToColor("#4A98F7"),

                              width: Device.screenWidth/7,
                              child:Center(child: Text("Cmt")),
                            ),
                            Container(
                              color: hexToColor("#4A98F7"),

                              width: Device.screenWidth/7,
                              child: Center(child:Text("Pzr")),
                            ),
                            //month days



                      ],
                    ),


                
            )




          ],
        )
      );
    }
  );


}
