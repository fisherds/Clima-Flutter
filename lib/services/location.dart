import 'package:geolocator/geolocator.dart';

class LocationManager {
  Function _callbackFcn;
  Position _position;

// Boilerplate code that make a singleton (don't delete)
  static final LocationManager _instance =
      LocationManager._privateConstructor();
  LocationManager._privateConstructor();
  factory LocationManager() {
    return _instance;
  }

  beginListening(Function callbackFcn) {
    _callbackFcn = callbackFcn;
    try {
      Geolocator.getPositionStream(desiredAccuracy: LocationAccuracy.low)
          .listen((Position position) {
        _position = position;
        String positionString = position == null
            ? 'Unknown'
            : position.latitude.toString() +
                ', ' +
                position.longitude.toString();
        print("New Position: " + positionString);
        if (_callbackFcn != null) {
          _callbackFcn();
        }
      });
    } catch (e) {
      print("Error getting location");
      print(e);
    }
  }

  void stopListening() {
    _callbackFcn = null;
  }

  double get latitude {
    return _position?.latitude;
  }

  double get longitude {
    return _position?.longitude;
  }
}
