import 'package:clima/services/location.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      //Navigator.pushNamed(context, "/loading");

                      await WeatherManager().updateWeather(
                          LocationManager().latitude,
                          LocationManager().longitude);
                      print("Outside Temp F = ${WeatherManager().temperature}");
                      print("Outside Icon = ${WeatherManager().weatherIcon}");
                      print("Outside Message = ${WeatherManager().message}");
                      setState(() {});
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    // onPressed: () {
                    //   Navigator.pushNamed(context, "/city");
                    //   setState(() {});
                    // },
                    onPressed: () async {
                      final result =
                          await Navigator.pushNamed(context, "/city");
                      if (result == kSetState) {
                        setState(() {});
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      // '${WeatherManager().temperature.floor()}°',
                      '${WeatherManager().temperature.toStringAsFixed(1)}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      WeatherManager().weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Text(
                // '${WeatherManager().temperature.floor()}°',
                '${WeatherManager().cityName}',
                style: kMessageTextStyle,
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  WeatherManager().message,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
