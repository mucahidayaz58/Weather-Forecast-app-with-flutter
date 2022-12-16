import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherScreen extends StatefulWidget {
  int? temp;
  String? city;
  WeatherScreen({@required this.temp,this.city});
  @override
  State<StatefulWidget> createState() {
    return _WeatherScreen(temp: temp,city: city);
  }
}

class _WeatherScreen extends State {
  int? temp;
  String? city;
  _WeatherScreen({@required this.temp,this.city});

  @override
  Widget build(BuildContext context) {
    String? imageName;
    if(DateTime.now().hour>19 || DateTime.now().hour<7){
      setState(() {
        imageName="gece";
      });
    }
    else{
      setState(() {
        imageName="güneşli";
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Forecast"),
      ),
      body:Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/$imageName.jpg"),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            Container(
              child: Icon(
                FontAwesomeIcons.cloud,
                size: 100.0,
                color: Colors.white,
              ),
            ),
            Container(
                child: Text("$temp°",style: TextStyle(fontSize: 55.0,color: Colors.white),textAlign: TextAlign.center,)
            ),
            Container(
                child: Text("$city",style: TextStyle(fontSize: 30.0,color: Colors.white),textAlign: TextAlign.center,)
            )
          ],
        ),

      ),
    );

  }
}
