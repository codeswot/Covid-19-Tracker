// import 'dart:async';
// import 'package:covid_new_19/helpers/location_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:covid_new_19/widgets/screensize.dart';
// import 'package:icon_shadow/icon_shadow.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';
// import '../../models/datamodels/user_location.dart';

// class HomeScreen extends StatefulWidget {
//   static const String id = 'HomeScreen';
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<UserLocation>(
//       create: (context) => LocationService().locationStream,
//       child: MaterialApp(
//         title: 'Covid-19 Maps',
//         home: HomeApp(),
//       ),
//     );
//   }
// }

// class HomeApp extends StatefulWidget {
//   @override
//   _HomeAppState createState() => _HomeAppState();
// }

// class _HomeAppState extends State<HomeApp> {
//   Completer<GoogleMapController> _controller = Completer();

//   void _onMapCreated(GoogleMapController controller) {
//     _controller.complete(controller);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // App width
//     var appWidth = screenWidth(context);
//     // User location
//     var userLocation = Provider.of<UserLocation>(context);
//     // Latitude & Longitude
//     double lat = userLocation.latitude;
//     double lng = userLocation.longitude;
//     double custLat = 10.5060441;
//     double custLng = 7.4073828;
//     bool isSafe;
//     String getDistance() {
//       var distanceBetween = coordinateDistance(lat, lng, custLat, custLng);
//       print('Distance is $distanceBetween');
//       if (distanceBetween <= 6) {
//         print('Alert!!');
//         isSafe = false;
//         return 'Alert';
//       } else {
//         print('Safe');
//         isSafe = true;
//         return 'Safe';
//       }
//     }

//     // Set Marker
//     Set<Marker> markers = {};
//     // my Marker
//     Marker myMarker = Marker(
//       markerId: MarkerId('$userLocation'),
//       position: LatLng(lat, lng),
//       infoWindow: InfoWindow(title: 'Me'),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//     );
//     Marker hisMarker = Marker(
//       markerId: MarkerId('someone'),
//       position: LatLng(custLat, custLng),
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//     );
//     // Location center target
//     LatLng _center = LatLng(lat, lng);
//     // Add markers
//     markers.add(myMarker);
//     markers.add(hisMarker);
//     print('$lat, $lng');

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('COVID-19 DISTANCING ',
//             style: TextStyle(
//                 color: Color(0xff0DA766),
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold)),
//         iconTheme: new IconThemeData(color: Colors.black),
//         elevation: 0.0,
//         backgroundColor: Colors.white,
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             myLocationEnabled: true,
//             onMapCreated: _onMapCreated,
//             initialCameraPosition: CameraPosition(
//               target: _center,
//               zoom: 18.4,
//               tilt: 10,
//             ),
//             markers: markers != null ? Set<Marker>.from(markers) : null,
//           ),
//           Positioned(
//             bottom: 0,
//             child: Container(
//               width: appWidth,
//               padding: EdgeInsets.only(top: 7, bottom: 7, left: 10, right: 10),
//               color: Color(0xff0DA766),
//               child: Row(
//                 children: [
//                   Container(
//                       // color : Colors.orange,
//                       padding: EdgeInsets.only(right: 5),
//                       child: IconShadowWidget(
//                         Icon(
//                           Icons.notifications_none,
//                           color: Colors.white,
//                         ),
//                         shadowColor: Colors.black,
//                       )),
//                   Container(
//                       // color : Colors.blue,
//                       child: Column(
//                     children: <Widget>[
//                       Container(
//                           width: 210,
//                           //color : Colors.red,
//                           child: Text(
//                             "Social Distance Alert is ON!",
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold),
//                           )),
//                       Container(
//                           width: 210,
//                           // color: Colors.blue,
//                           child: Text(
//                             "Switch off alert when indoors",
//                             style: TextStyle(
//                                 fontSize: 13,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w200),
//                           ))
//                     ],
//                   )),
//                   Spacer(),
//                   Container(
//                     // color: Colors.grey,
//                     child: Align(
//                       alignment: Alignment.centerRight,
//                       child: Switch(
//                         value: true,
//                         activeTrackColor: Colors.lightGreenAccent,
//                         activeColor: Colors.green,
//                         onChanged: (bool value) {},
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//               bottom: 105,
//               right: 100,
//               child: GestureDetector(
//                 onTap: () {
//                   getDistance();
//                 },
//                 child: Container(
//                   child: Text('test'),
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }
