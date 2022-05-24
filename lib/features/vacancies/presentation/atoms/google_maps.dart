import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class GoogleMaps extends StatefulWidget {
  final Function(LocationData) onLocationChange;
  const GoogleMaps({
    required this.onLocationChange,
    Key? key,
  }) : super(key: key);
  @override
  State<GoogleMaps> createState() => GoogleMapsState();
}

class GoogleMapsState extends State<GoogleMaps> {
  GoogleMapController? _controller;
  final Location _location = Location();
  // Object for PolylinePoints
  late PolylinePoints polylinePoints;

// List of coordinates to join
  List<LatLng> polylineCoordinates = [];

// Map storing polylines created by connecting two points
  Map<PolylineId, Polyline> polylines = {};
  static const CameraPosition _intialCameraPosition = CameraPosition(
    target: LatLng(32.085300, 34.781769),
    zoom: 15,
  );

  void _onMapCreated(GoogleMapController _cntlr) {
    _location.onLocationChanged.listen(
      (l) {
        _controller = _cntlr;
        _controller?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(l.latitude ?? 0, l.longitude ?? 0), zoom: 15),
          ),
        );
        widget.onLocationChange(l);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      height: 300,
      child: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: _intialCameraPosition,
        onMapCreated: _onMapCreated,
      ),
    );
  }
}
