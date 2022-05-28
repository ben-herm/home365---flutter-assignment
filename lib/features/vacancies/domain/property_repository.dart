import '../model/property/property_model.dart';
import 'package:flutter_geocoder/geocoder.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: one_member_abstracts
abstract class PropertyRepository {
  Future<List<PropertyModel>> getMockedProperties();

  Future<List<Coordinates>> getPropertiesLanLon(List<PropertyModel> properties);
  Future<Map<PolylineId, Polyline>> createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  );
}
