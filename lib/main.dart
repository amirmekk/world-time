import 'package:flutter/material.dart';
import 'package:app_01/screens/home.dart';
import 'package:app_01/screens/loading.dart';
import 'package:app_01/screens/change.dart';



void main() => runApp( MaterialApp(
  initialRoute:  '/', 
  routes: {
    '/' : (context)=>Loading() ,
    '/change': (context)=>ChooseLocation() ,
    '/home' :  (context)=>Home() ,
  },
));

