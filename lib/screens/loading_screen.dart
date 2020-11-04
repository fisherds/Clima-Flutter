import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  LocationManager locationManager = LocationManager();
  @override
  void initState() {
    super.initState();
    locationManager.beginListening(() {
      print("Unusued callback for now.");
      print(locationManager.latitude);
      print(locationManager.longitude);
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

  void getLocation() {
    print(locationManager.latitude);
    print(locationManager.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
