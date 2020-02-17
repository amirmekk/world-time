import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data =data.isNotEmpty? data : ModalRoute.of(context).settings.arguments;
    String bg = data['isDayTime'] ? 'day.jpeg' : 'night.jpg';
    Color bgColor =
        data['isDayTime'] ? Colors.lightGreen : Colors.blueGrey[600];
    print(data);
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/change');
                  setState(() {
                    data = result ; 
                  });
                },
                icon: Icon(Icons.call_split, color: Colors.white),
                label: Text(
                  'change location',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(fontSize: 30, color: Colors.white , fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                data['time'],
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
