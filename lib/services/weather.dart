import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = "814c3e4dc8e4be84fb9504089409332f";
const apiURL = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future getCityWeather(String cityName) async {
    Network network = Network(url: '$apiURL?q=$cityName&appid=$apiKey');
    var decodedData = await network.getWeatherFromApi();
    return decodedData;
  }

  Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    Network network = Network(
        url: '$apiURL?lat=${location.lat}&lon=${location.lon}&appid=$apiKey');
    var decodedData = await network.getWeatherFromApi();
    return decodedData;
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
