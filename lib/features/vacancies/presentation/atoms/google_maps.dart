import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({
    Key? key,
  }) : super(key: key);
  @override
  State<GoogleMaps> createState() => GoogleMapsState();
}

class GoogleMapsState extends State<GoogleMaps> {
  late final GoogleMapController _controller;
  final Location _location = Location();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void _onMapCreated(GoogleMapController _cntlr) {
    _location.onLocationChanged.listen((l) {
      _controller = _cntlr;
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(l.latitude ?? 0, l.longitude ?? 0), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      height: 300,
      child: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: _onMapCreated,
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final Completer<GoogleMapController> _controller = Completer();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}