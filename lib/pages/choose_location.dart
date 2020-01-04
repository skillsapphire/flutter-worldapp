import 'package:flutter/material.dart';
import 'package:worldapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(relativeUrl: 'Asia/Kolkata', location: 'Kolkata', flagUrl: 'india.png'),
    WorldTime(relativeUrl: 'Europe/London', location: 'London', flagUrl: 'uk.png'),
    WorldTime(relativeUrl: 'Europe/Berlin', location: 'Athens', flagUrl: 'greece.png'),
    WorldTime(relativeUrl: 'Africa/Cairo', location: 'Cairo', flagUrl: 'egypt.png'),
    WorldTime(relativeUrl: 'Africa/Nairobi', location: 'Nairobi', flagUrl: 'kenya.png'),
    WorldTime(relativeUrl: 'America/Chicago', location: 'Chicago', flagUrl: 'usa.png'),
    WorldTime(relativeUrl: 'America/New_York', location: 'New York', flagUrl: 'usa.png'),
    WorldTime(relativeUrl: 'Asia/Seoul', location: 'Seoul', flagUrl: 'south_korea.png'),
    WorldTime(relativeUrl: 'Asia/Jakarta', location: 'Jakarta', flagUrl: 'indonesia.png'),
  ];

  void updateTime(index) async {
      WorldTime instance = locations[index];
      await instance.getTime();
      // navigate to home screen by pop becz its just below choose location
      Navigator.pop(context, {
        'location': instance.location, 'flag': instance.flagUrl, 'time': instance.time,
        'isDayTime': instance.isDayTime
      });
  }

  @override
  Widget build(BuildContext context) {
    print('build state called');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flagUrl}'),
                  ),
                ), //https://api.flutter.dev/flutter/material/ListTile-class.html
              ),
            );
          }
      )
    );
  }
}
