import 'package:geolocator/geolocator.dart';

class LocationManager {
  Position _position;

  static final LocationManager _instance =
      LocationManager._privateConstructor();
  LocationManager._privateConstructor();
  factory LocationManager() {
    return _instance;
  }

  beginListening(Function callbackFcn) {
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
        if (callbackFcn != null) {
          callbackFcn();
        }
      });
    } catch (e) {
      print("Error getting location");
      print(e);
    }
  }

  stopListening() {}

  double get latitude {
    return _position?.latitude;
  }

  double get longitude {
    return _position?.longitude;
  }
}
