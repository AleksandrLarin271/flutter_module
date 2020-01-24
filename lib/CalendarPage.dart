
import 'package:flutter/material.dart';
import 'package:flutter_module/CalculatorPage.dart';
import 'package:flutter_module/Work.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'ResultPage.dart';

class CalendarPage extends StatefulWidget{
   Map<DateTime,List<dynamic>> events_map;
   SharedPreferences prefs;

   CalendarPage();
   CalendarPage.events(this.events_map,this.prefs);

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
                title: Text(
                      event.contains("Work")?convert(event.toString()):event.toString()
                  ),
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
