import 'package:clima/services/location.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherManager weatherManager = WeatherManager();

  @override
  void initState() {
    super.initState();
    LocationManager().beginListening(() {
      print(
          "Callback1 (${LocationManager().latitude}, ${LocationManager().longitude})");

      getWeatherInfo();
    });
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  // void getLocation() async {
  // Future<Position> position =
  //     Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  // print(await position);
  // }

  void getWeatherInfo() async {
    await weatherManager.updateWeather(
        LocationManager().latitude, LocationManager().longitude);
    print("Outside Temp F = ${WeatherManager().temperature}");
    print("Outside Icon = ${WeatherManager().weatherIcon}");
    print("Outside Message = ${WeatherManager().message}");
    LocationManager().stopListening();
    Navigator.pushNamed(context, "/location");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Loading"),
      ),
    );
  }
}
