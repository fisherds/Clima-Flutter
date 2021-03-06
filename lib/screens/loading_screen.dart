import 'package:clima/services/location.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    print("initState on the loading screen called.");
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
    await WeatherManager()
        .updateWeather(LocationManager().latitude, LocationManager().longitude);
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
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
