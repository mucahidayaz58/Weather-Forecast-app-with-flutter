import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:newproject/main.dart';
import 'package:newproject/mainFile.dart';
import 'package:newproject/weather.dart';
import 'location.dart';

void main(){
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home:LoadingScreen()
  )
  );
}

class LoadingScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreen();

  }
}

class _LoadingScreen extends State<LoadingScreen>{
  LocationHelper locationData=LocationHelper();
  Future<void> getDataLocation() async{
    LocationHelper location=LocationHelper();
    Weather weatherData=Weather();
    await location.getLocationData();
    var resp=weatherData.getWeatherData().then((value){
      int resultTemp=value[0]["main"]["temp"].round();
      String resultCity=value[0]["name"];
      if(value[1]==200){
        print("Request Successful");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherScreen(temp: resultTemp,city: resultCity,)));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getDataLocation();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.grey,Colors.black]
    ),
            ),
            child: Center(
              child: SpinKitRipple(
                color: Colors.white,
                size: 100,
                duration: Duration(milliseconds: 1200),
              ),
            ),
          )
      );

  }

}