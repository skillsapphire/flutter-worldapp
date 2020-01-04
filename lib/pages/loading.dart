import 'package:flutter/material.dart';
import 'package:worldapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//https://pub.dev/packages/flutter_spinkit

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Amsterdam', flagUrl: 'germany.png', relativeUrl: 'Europe/Amsterdam');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location, 'flag': instance.flagUrl, 'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube( //https://pub.dev/packages/flutter_spinkit
          color: Colors.white,
          size: 80.0,
        ),
      )
    );
  }
}
