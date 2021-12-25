import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  bool loading = false;

  Completer<GoogleMapController> _controller = Completer();
  late CameraPosition initialCameraPosition;
  late Location location;
  late LocationData currentLocation;

  @override
  void initState() {
    super.initState();
    setInitialLocation();
  }

  @override
  Widget build(BuildContext context) {
    return this.loading? Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("Save"),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    ): Scaffold(body: CircularProgressIndicator(),);
  }

  void setInitialLocation() async {
    location = Location();
    currentLocation = await location.getLocation();
    initialCameraPosition = CameraPosition(
      zoom: 18,
      target: LatLng(
        currentLocation.latitude!,
        currentLocation.longitude!,
      ),
    );
    setState(() {
      this.loading = true;
    });
  }
}
