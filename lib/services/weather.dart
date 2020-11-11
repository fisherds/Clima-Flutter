import "package:http/http.dart" as http;
import "dart:convert" as convert;

class WeatherManager {
  // Boilerplate code to make a Singleton
  static final WeatherManager _instance = WeatherManager._privateConstructor();
  WeatherManager._privateConstructor();
  factory WeatherManager() {
    return _instance;
  }

  static final OPEN_WEATHER_API_KEY = "264c519865aaf19d42cbc39987ae6123";
  var jsonResponse;

  Future<void> updateWeather(latitude, longitude) async {
    var url =
        "http://api.openweathermap.org/data/2.5/weather?units=imperial&lat=$latitude&lon=$longitude&appid=$OPEN_WEATHER_API_KEY";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      jsonResponse = convert.jsonDecode(response.body);
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }

// var example = {
  //   "coord": {"lon": -87.4, "lat": 39.46},
  //   "weather": [
  //     {
  //       "id": 800,
  //       "main": "Clear",
  //       "description": "clear sky",
  //       "icon": "01d"
  //     }
  //   ],
  //   "base": "stations",
  //   "main": {
  //     "temp": 59.77,
  //     "feels_like": 52.81,
  //     "temp_min": 57.2,
  //     "temp_max": 62.01,
  //     "pressure": 1025,
  //     "humidity": 58
  //   },
  //   "visibility": 10000,
  //   "wind": {"speed": 10.29, "deg": 180},
  //   "clouds": {"all": 1},
  //   "dt": 1604505328,
  //   "sys": {
  //     "type": 1,
  //     "id": 4442,
  //     "country": "US",
  //     "sunrise": 1604492501,
  //     "sunset": 1604529879
  //   },
  //   "timezone": -18000,
  //   "id": 4265737,
  //   "name": "Terre Haute",
  //   "cod": 200
  // };

  double get temperature {
    if (jsonResponse != null) {
      return jsonResponse["main"]["temp"];
    }
    print("No temp!!!!");
    return 0.0;
  }

  double get cityName {
    return jsonResponse["name"];
  }

  int get condition {
    // return jsonResponse["cod"];
    return jsonResponse["weather"][0]["id"];
  }

  String get weatherIcon {
    if (condition < 300) {
      return "🌩";
    } else if (condition < 400) {
      return "🌧";
    } else if (condition < 600) {
      return "☔️";
    } else if (condition < 700) {
      return "☃️";
    } else if (condition < 800) {
      return "🌫";
    } else if (condition == 800) {
      return "☀️";
    } else if (condition <= 804) {
      return "☁️";
    } else {
      return "🤷‍";
    }
  }

  String get message {
    if (temperature > 85) {
      return "It\"s 🍦 time";
    } else if (temperature > 68) {
      return "Time for shorts and 👕";
    } else if (temperature < 50) {
      return "You\"ll need 🧣 and 🧤";
    } else {
      return "Bring a 🧥 just in case";
    }
  }
}
