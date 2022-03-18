import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const APIkey = '7501217fc96bc2d2927e2204a1540ba6';
const APIurl ='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  //method2
 Future  getcitylocation (cityname)async{

    Networking networkhelper = Networking('$APIurl?q=$cityname&appid=$APIkey&units=metric');

    var weatherdata = await networkhelper.getData();

    return   weatherdata;
  }

  Future<dynamic> getlocationdata()async{
    Location locations = Location();
    await locations.getcurrentlocation();

    Networking networkhelper = Networking('$APIurl?lat=${locations.latitude}&lon=${locations.longitude}&appid=$APIkey&units=metric');

    var weatherdata = await networkhelper.getData();

    return   weatherdata;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 28) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 16) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
