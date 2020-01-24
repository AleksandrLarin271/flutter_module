
import 'package:flutter/material.dart';
import 'package:flutter_module/CalculatorPage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_module/FourthPage.dart';

import 'ResultPage.dart';

class CalendarPage extends StatefulWidget{
   Map<DateTime,List<dynamic>> events_map;
   SharedPreferences prefs;

   CalendarPage();
   CalendarPage.events(this.events_map,this.prefs);
   CalendarPage.prefs(this.prefs);
  @override
  State createState()=>_CalendarPageState.events(events_map,prefs);
}

class _CalendarPageState extends State<CalendarPage>
{
   Map<DateTime,List<dynamic>> events_map=null;
   SharedPreferences prefs_calculator=null;

   _CalendarPageState.events(this.events_map,this.prefs_calculator);
  _CalendarPageState();
  CalendarController _controller;
    Map<DateTime,List<dynamic>> _events;
    List<dynamic> _selectedEvents;
   SharedPreferences prefs=null;


    @override
    void initState(){
      // TODO: implement initState
      super.initState();
      _controller = CalendarController();
      if(events_map!=null)
        {
          _events=events_map;
          print("hello");
        }else {
        _events = {};
        print("null");
      }
      _selectedEvents = [];
      if(prefs_calculator!=null){
        prefs=prefs_calculator;
        setState(() {
          prefs.setString("events", json.encode((encodeMap(_events))));
        });
      }else {
        initPrefs();
      }
      print(_events);

    }

     initPrefs() async{
      prefs = await SharedPreferences.getInstance();
      setState(() {
        _events = Map<DateTime,List<dynamic>>.from(decodeMap(json.decode(prefs.getString("events") ?? "{}")));
      });
    }

    Map<String,dynamic> encodeMap(Map<DateTime,dynamic> map) {
      Map<String,dynamic> newMap = {};
      map.forEach((key,value) {
        newMap[key.toString()] = map[key];
      });
      return newMap;
    }
    Map<DateTime,dynamic> decodeMap(Map<String,dynamic> map) {
      Map<DateTime,dynamic> newMap = {};
      map.forEach((key,value) {
        newMap[DateTime.parse(key)] = map[key];
      });
      return newMap;
    }
   String convert(String work){
     work=work.split("{")[1];
     work=work.split("}")[0];
     List<String> arr=work.split(",");
     String result="";
     arr.forEach((String a)=>{
       if(a.contains("hours")){
         result+=a+" "
       }
        else if (a.contains("minute"))
         {
           result+=a+" "
         }
       else if(a.contains("daily_earnings"))
         {
           result+=a+" "
         }
       else if(a.contains("note"))
         {
           result+=a+" "
         }

     });
     return result;
   }

        @override
      Widget build(BuildContext context) {

       return Scaffold(

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

                      Container(
                          padding: const EdgeInsets.only(left:170),
                          child: Container( width: 60,
                              child: FlatButton(
                                child: Image.asset("assets/images/stats.png"),
                                onPressed:(){
                                  Navigator.of(context).push(new MaterialPageRoute(builder:
                                      (BuildContext context) => ResultPage(prefs)));
                                } ,
                            )
                          )
                      ),
                      Container(
                        width: 60,
                        child:  FlatButton(
                          child: Image.asset("assets/images/settings.png"),
                          onPressed:(){
                          } ,
                        )
                      )
                    ],
                  )
              ),
              TableCalendar(
                events: _events,
                initialCalendarFormat: CalendarFormat.month,
                calendarStyle: CalendarStyle(
                    todayColor: Colors.orange,
                    selectedColor: Theme.of(context).primaryColor,
                    todayStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.white)),
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  formatButtonTextStyle: TextStyle(color: Colors.white),
                  formatButtonShowsNext: false,
                ),
                onDaySelected: (date, events) {
                  print(_controller.selectedDay);
                  setState(() {
                    _selectedEvents = events;
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.monday,
                builders: CalendarBuilders(
                  selectedDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                  todayDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                calendarController: _controller,
              ),
              ..._selectedEvents.map((event) => ListTile(
                title: Container(
                  margin: const EdgeInsets.all(5),
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20.0, // has the effect of softening the shadow
                      spreadRadius: 5.0, // has the effect of extending the shadow
                      offset: Offset(
                        10.0, // horizontal, move right 10
                        10.0, // vertical, move down 10
                      ),
                    )
                    ],
                    borderRadius: BorderRadius.all(
                        Radius.circular(5)
                    ),
                  ),
                  child:Row(
                    children: <Widget>[
                      Container(
                          width: 80,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                  topLeft:Radius.circular(5),
                                  bottomLeft:Radius.circular(5)

                              )
                          ),
                          child:Center(
                            child:Text(
                                event.toString()
                                    .split("{")[1]
                                    .split("}")[0]
                                    .split(",")[0]
                                    .split(":")[1],
                                style:TextStyle(
                                  fontSize: 36,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white,
                                )
                            ),
                          )
                      ),
                      Container(
                          width: 200,
                          margin: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(event.toString()
                                  .split("{")[1]
                                  .split("}")[0]
                                  .split(",")[4]
                                  .split(":")[1].trim().split(" ")[0]
                                //.split(" ")[0]
                                ,
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              ),
                              Text(event.toString()
                                  .split("{")[1]
                                  .split("}")[0]
                                  .split(",")[3]
                                  .split(":")[1],
                                style: TextStyle(
                                    color: hexToColor("#8A9199"),
                                    fontSize: 14
                                ),
                              )
                            ],
                          )
                      ),
                      Text("\$"+event.toString()
                          .split("{")[1]
                          .split("}")[0]
                          .split(",")[2]
                          .split(":")[1],
                        style: TextStyle(
                            fontSize: 16
                        ),
                      )
                    ],
                  ),
                )
                )
              ),
            ],
          ),

        ),
        floatingActionButton: FloatingActionButton(

          child: Icon(Icons.add),
          onPressed: (){
            setState(() {
              prefs.setString("events", json.encode((encodeMap(_events))));
            });

            print("CalculatorPage");
            Navigator.of(context).push(new MaterialPageRoute(builder:
                (BuildContext context) => CalculatorPage(
                _controller.selectedDay,
                _events,
                prefs
            )));

           },
        )
      );
    }

  }
