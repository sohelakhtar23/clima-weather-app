import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'cc886e4386fa9b859af796bd68cdd5fe';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper data = NetworkHelper(
        url:
            'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$apiKey');
    dynamic weatherData = await data.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(var cityName) async {
    NetworkHelper data = NetworkHelper(
        url:
            'http://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$apiKey');
    dynamic weatherData = await data.getData();
    return weatherData;
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
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
