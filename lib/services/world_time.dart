import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

//https://pub.dev/packages/http
//https://pub.dev/packages/intl#-installing-tab-

class WorldTime {

  String location; // location name for ui
  String time; // time in that location
  String flagUrl; // url to the flag of that location
  String relativeUrl; // relative url of the api endpoint
  bool isDayTime; // true = daytime

  WorldTime({this.location, this.flagUrl, this.relativeUrl});

  Future<void> getTime() async {
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$relativeUrl');
      Map data = jsonDecode(response.body);
      //print(data);
      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3); // gives 01 instead of +01.00

      //create Datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      // set the time property of the class
      time = DateFormat.jm().format(now); //https://pub.dev/packages/intl#-installing-tab-
    }catch(e){
      print('caught error $e');
      time = 'Could not get the time data';
    }
  }
}