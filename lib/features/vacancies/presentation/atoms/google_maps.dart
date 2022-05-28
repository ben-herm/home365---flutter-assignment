import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_365_assignment/core/UI/widgets/loaders/main_circular_loader.dart';
import 'package:location/location.dart';

class GoogleMaps extends StatefulWidget {
  final Function(LocationData) onLocationChange;
  final Map<PolylineId, Polyline> polyLineFromPropertyToUser;
  final ValueNotifier<bool> isCalculating;
  const GoogleMaps({
    required this.onLocationChange,
    required this.polyLineFromPropertyToUser,
    required this.isCalculating,
    Key? key,
  }) : super(key: key);
  @override
  State<GoogleMaps> createState() => GoogleMapsState();
}

class GoogleMapsState extends State<GoogleMaps> {
  GoogleMapController? _controller;
  final Location _location = Location();
  late LocationData currentLocation;
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
              target: LatLng(l.latitude ?? 0, l.longitude ?? 0),
              zoom: 15,
            ),
          ),
        );
        widget.onLocationChange(l);
        currentLocation = l;
        if (widget.isCalculating.value && currentLocation.latitude != null) {
          widget.isCalculating.value = false;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      height: 250,
      child: !widget.isCalculating.value
          ? GoogleMap(
              polylines:
                  Set<Polyline>.of(widget.polyLineFromPropertyToUser.values),
              myLocationEnabled: true,
              mapType: MapType.normal,
              initialCameraPosition: _intialCameraPosition,
              onMapCreated: _onMapCreated,
            )
          : const MainCircularLoader(),
    );
  }
}
