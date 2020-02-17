import 'package:flutter/material.dart';
import 'package:app_01/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updateTime(index) async {
    WorldTime insta =  locations[index] ;
    await insta.getTime() ; 
    Navigator.pop(context, {
      'location': insta.location , 
      'flag' : insta.flag , 
      'time' : insta.time ,
      'isDayTime' : insta.isDayTime ,
    });
    print(insta.time);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('choose Location') ,
      ),
      body: ListView.builder(
        itemCount: locations.length, 
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              onTap :(){
                
                updateTime(index) ;

              } , 
              title : Text(locations[index].location), 
            ),
          );
        } , 
        
      ),
    );
  }
}