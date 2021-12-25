import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_order_pj/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class UserLocation extends StatefulWidget {

  double lat;
  double log;

  UserLocation(this.lat,this.log);

  @override
  _UserLocationState createState() => _UserLocationState();
}

class _UserLocationState extends State<UserLocation> {

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
    initialCameraPosition = CameraPosition(
      zoom: 18,
      target: LatLng(widget.lat, widget.log),
    );
    setState(() {
      this.loading = true;
    });
  }
}
