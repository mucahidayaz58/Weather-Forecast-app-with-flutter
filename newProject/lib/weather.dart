import 'dart:convert';

import 'package:http/http.dart';
import 'location.dart';

class Weather{
  late double currentTemperature;
  late int currentId;
  String apiKey="f571027bdef1b5d85059cd8e01686caa";
  LocationHelper location=LocationHelper();
  double? latitute;
  double? longitute;

  Future getWeatherData()async{
    var ret=location.getLocationData().then((value)async{
      var val1=value[0];
      var val2=value[1];
      Response response=await get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$val1&lon=$val2&appid=$apiKey&units=metric"));
      var weatherD=jsonDecode(response.body);
      return [weatherD,response.statusCode];
    });
    return ret;

  }

}
