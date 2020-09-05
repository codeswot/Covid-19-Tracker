import 'dart:async';
import 'package:geolocator/geolocator.dart';

Geolocator _geolocator = Geolocator();
Position myPosition = Position();
LocationOptions locationOptions = LocationOptions(
    accuracy: LocationAccuracy.high, distanceFilter: 1, timeInterval: 1000);

class LocationServices {
  //check permison
  void checkPermission() {
    _geolocator.checkGeolocationPermissionStatus().then((status) {
      print('status: $status');
    });
    _geolocator
        .checkGeolocationPermissionStatus(
            locationPermission: GeolocationPermission.locationAlways)
        .then((status) {
      print('always status: $status');
    });
    _geolocator.checkGeolocationPermissionStatus(
        locationPermission: GeolocationPermission.locationWhenInUse)
      ..then((status) {
        print('whenInUse status: $status');
      });
  }

//get location update
  getPosition() {
    StreamSubscription positionStream = _geolocator
        .getPositionStream(locationOptions)
        .listen((Position position) {
      myPosition = position;
      print('long ${myPosition.longitude} and lat ${myPosition.latitude}');
    });
  }

  void showCheck() {
    getPosition();
    print(
      ' my long is ${myPosition.longitude} my lat is ${myPosition.latitude}',
    );
    checkPermission();
  }
}
