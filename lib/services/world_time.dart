import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime{
   
   String location ; // location name for ui
   bool isDayTime ; // used for backgound image
   String time ; // time in priv location
   String flag ; 
   String url; // ending part of the url , this represents the location
   WorldTime({this.location , this.flag , this.url}); 
   Future<void> getTime() async {
    try {
    Response response = await get ('http://worldtimeapi.org/api/timezone/$url');
    Map responseUsable = jsonDecode(response.body);
    String datetime = responseUsable['datetime'];
    String offset = (responseUsable['utc_offset']).substring(1 ,3);
  
    DateTime now = DateTime.parse(datetime) ; 
    now = now.add(Duration(hours : int.parse(offset))); 
    time = DateFormat.jm().format(now);
    isDayTime = now.hour > 6 && now.hour < 20 ? true : false ;
    } catch (e) {
      print('you have got an error which is $e');
          }
    
  }
  
}
