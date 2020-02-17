import 'package:flutter/material.dart';
import 'package:app_01/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setup() async{
    WorldTime insta = WorldTime( location : 'algiers' , url : 'Africa/algiers' , flag: 'algeria.png') ; 
    await insta.getTime();
    await Navigator.pushReplacementNamed(context, '/home' , arguments: {
      'location': insta.location , 
      'flag' : insta.flag , 
      'time' : insta.time ,
      'isDayTime' : insta.isDayTime ,
    });

  }
  @override 
  void initState() {
    super.initState();
    setup();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:SpinKitThreeBounce(
              color: Colors.black,
              size: 50.0,
            )
      ),
    );
  }
}