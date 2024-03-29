import 'package:covid_new_19/helpers/auth_provider.dart';
import 'package:covid_new_19/services/location_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';
  State createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  LocationServices locationService = LocationServices();

  @override
  void initState() {
    super.initState();
  }

  GoogleMapController mapController;
  Location location = new Location();
  LocationServices locationServices = LocationServices();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Geoflutterfire geo = Geoflutterfire();

  //Stateful Data
  BehaviorSubject<double> radius = BehaviorSubject.seeded(100.0);
  Stream<dynamic> query;

  //Subscription
  StreamSubscription subscription;

  Set<Marker> _markers = {};

  Completer<GoogleMapController> _controller = Completer();




  build(context) {
    return Stack(children: [
      GoogleMap(
        markers: _markers,
        initialCameraPosition:
            CameraPosition(target: LatLng(24.142, -110.321), zoom: 19),
        zoomGesturesEnabled: true,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
          _animateToUser();

          setState(() {
            _markers.add(
              Marker(
                markerId: MarkerId('Me'),
                position: LatLng(myPosition.latitude, myPosition.longitude),
              )
            );
            _startQuery();
          });

        },
        myLocationEnabled: true,
        mapType: MapType.normal,
        compassEnabled: true,
      ),
      Positioned(
        bottom: 50,
        right: 10,
        child: FlatButton(
          child: Icon(
            Icons.pin_drop,
            color: Colors.blue,
          ),
          color: Colors.white,
          onPressed: _addGeoPoint,
        ),
      ),
      Positioned(
        bottom: 50,
        left: 10,
        child: Slider(
            min: 100.0,
            max: 500.0,
            value: radius.value,
            label: 'Radius ${radius.value}km',
            activeColor: Colors.blue,
            inactiveColor: Colors.blue.withOpacity(0.2),
            onChanged: _updateQuery,
        ),
      ),
    ]);
  }


  void _animateToUser() async {
    const twoSec = const Duration(seconds: 2);
    int _start = 5;

    location.onLocationChanged();
    var postn = await location.getLocation();

     Timer.periodic(twoSec,
        (Timer timer) => setState((){
          if(_start < 2){
            timer.cancel();
          }else{
            mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(postn.latitude, postn.longitude),
              zoom: 17.0,
            )));
          }
        })
    );


  }

  Future<DocumentReference> _addGeoPoint() async {
    var pos = await location.getLocation();
    final  uid = await _firebaseAuth.currentUser.uid;
    GeoFirePoint point =
        geo.point(latitude: pos.latitude, longitude: pos.longitude);
    return firestore.collection('userData').doc(uid).collection('locations').add({
      'position': point.data,
    });
  }

  void _updateMarkers(List<DocumentSnapshot> documentList){
    print(documentList);

    documentList.forEach((DocumentSnapshot document) {
      GeoFirePoint pos = document.data()['position']['geopoint'];
      double distance = document.data()['distance'];
      var marker = Marker(
        markerId: MarkerId('$myPosition'),
        position: LatLng(pos.latitude, pos.longitude),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          title: 'nearest user is $distance km from you.'
        ),
      );

      _markers.add(marker);
    });
  }

  _startQuery() async {
    final  uid = await _firebaseAuth.currentUser.uid;
    //Get users location
    var position = await location.getLocation();
    double lat = position.latitude;
    double lng = position.longitude;

    //reference to location
    var ref = firestore.collection('userData').doc(uid).collection('locations');
    GeoFirePoint center = geo.point(latitude: lat, longitude: lng);

    //subscribe to query
    subscription = radius.switchMap((rad) {
      return geo.collection(collectionRef: ref).within(
          center: center,
          radius: rad,
          field: 'position',
        strictMode: true,
      );
    }).listen(_updateMarkers);
  }

  _updateQuery(value) {
    final zoomMap = {
      100.0: 12.0,
      200.0: 10.0,
      300.0: 7.0,
      400.0: 6.0,
      500.0: 5.0
    };

    final zoom = zoomMap[value];
    mapController.moveCamera(CameraUpdate.zoomTo(zoom),
    );
    setState(() {
      radius.add(value);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subscription.cancel();
    super.dispose();
  }
}


//   // Stateful Data
//   BehaviorSubject<double> radius = BehaviorSubject();
//   Stream<dynamic> query;
//   //markerset

//   // Subscription
//   StreamSubscription subscription;
//   Set<Marker> markers = {};
// // my Marker
//   Marker myMarker = Marker(
//     markerId: MarkerId('$myPosition'),
//     position: LatLng(myPosition.latitude, myPosition.longitude),
//     infoWindow: InfoWindow(title: 'Me'),
//     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//   );
//   build(context) {
//     markers.add(myMarker);
//     _animateToUser();
//     _startQuery();
//     return Stack(children: [
//       GoogleMap(
//         initialCameraPosition:
//             CameraPosition(target: LatLng(24.142, -110.321), zoom: 19),
//         onMapCreated: _onMapCreated,
//         myLocationEnabled: true,
//         mapType: MapType.normal,
//         markers: markers != null ? Set<Marker>.from(markers) : null,
//         compassEnabled: true,
//       ),
//       Positioned(
//         bottom: 50,
//         right: 10,
//         child: FlatButton(
//           child: Icon(Icons.pin_drop, color: Colors.white),
//           color: Colors.green,
//           onPressed: () {
//             _addGeoPoint();
//           },
//         ),
//       ),
//     ]);
//   }

//   // Map Created Lifecycle Hook
//   _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       _startQuery();
//       _addGeoPoint(); //use in a duration

//       mapController = controller;
//     });
//   }

//   _animateToUser() async {
//     // var pos = await _locationServices.getPosition();
//     mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//       target: LatLng(myPosition.latitude, myPosition.longitude),
//       zoom: 20.0,
//     )));
//   }

//   // Set GeoLocation Data
//   Future<DocumentReference> _addGeoPoint() async {
//     //AuthProvider authProvider = await Provider.of(context);
//     AuthProvider authProvider = context.watch<AuthProvider>();

//     GeoFirePoint point = geo.point(
//       latitude: myPosition.latitude,
//       longitude: myPosition.longitude,
//     );
//     return firestore.collection('locations').add({
//       'position': point.data,
//       'name': 'test',
//     });
//   }

//   void _updateMarkers(List<DocumentSnapshot> documentList) {
//     print(documentList);
//     documentList.forEach((DocumentSnapshot document) {
//       GeoPoint pos = document.data()['position']['geopoint'];
//       double distance = document.data()['distance'] * 1000;
//       print('my distance is $distance m');
//       if (distance < 6) {
//         print('alert!!');
//       } else {
//         print('safe!');
//       }
//       Marker userMarker = Marker(
//         markerId: MarkerId('$pos'),
//         position: LatLng(pos.latitude, pos.longitude),
//         infoWindow: InfoWindow(title: 'Me distance is $distance m'),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//       );
//       markers.add(userMarker);
//     });
//   }

//   _startQuery() async {
//     // Get users location
//     double lat = myPosition.latitude;
//     double lng = myPosition.longitude;

//     // Make a referece to firestore
//     var ref = firestore.collection('locations');
//     GeoFirePoint center = geo.point(latitude: lat, longitude: lng);

//     // subscribe to query
//     subscription = radius.switchMap((rad) {
//       return geo.collection(collectionRef: ref).within(
//           center: center, radius: rad, field: 'position', strictMode: true);
//     }).listen(_updateMarkers);
//   }

//   _updateQuery(value) {
//     final zoomMap = {
//       100.0: 12.0,
//       200.0: 10.0,
//       300.0: 7.0,
//       400.0: 6.0,
//       500.0: 5.0
//     };
//     final zoom = zoomMap[value];
//     mapController.moveCamera(CameraUpdate.zoomTo(zoom));

//     setState(() {
//       radius.add(value);
//     });
//   }

//   @override
//   dispose() {
//     subscription.cancel();
//     super.dispose();
//   }
// }
