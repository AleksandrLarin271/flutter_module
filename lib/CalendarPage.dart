import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
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
           CalendarCarousel(
             height: Device.screenHeight-100,
             width: Device.screenWidth,
             todayTextStyle: TextStyle(color: Colors.green),
             todayButtonColor: Colors.white,
             inactiveWeekendTextStyle: TextStyle(color: Colors.grey),
             weekdayTextStyle: TextStyle(
                 fontStyle: FontStyle.normal,
                 fontWeight: FontWeight.w600,
                 fontSize: 12,
                 color: Colors.white),
             weekDayBackgroundColor: Colors.blue,

           )

          ],
        )
      );
    }
  );


}
