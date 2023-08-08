import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //!
  Completer<GoogleMapController> _controller = Completer();

  //! cameraPosition in initial
  static final CameraPosition _kCameraPosition = CameraPosition(
    target: LatLng(33.6844, 73.0479),
    zoom: 12,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        mapType: MapType.normal,
        compassEnabled: true,
        myLocationEnabled: true,
        markers: Set<Marker>.from(
          [
             Marker(
              markerId: MarkerId('1'),
              position: LatLng(33.6844, 73.084488),
              infoWindow: InfoWindow(title: 'My current location')
            ),

            Marker(
              markerId: MarkerId('2'),
              position: LatLng(33.738045, 73.0479),
              infoWindow: InfoWindow(title: 'e-11 Sector')
            ),

          ],
        ),
      ),
    );
  }
}
