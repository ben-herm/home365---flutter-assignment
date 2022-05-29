import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:home_365_assignment/features/vacancies/model/property/property_model.dart';
import 'package:flutter_geocoder/geocoder.dart';
import '../../../../core/utils/mapUtils.dart';
import '../../domain/property_repository.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/UI/theme/theme.dart';
import 'package:enum_to_string/enum_to_string.dart';

class PropertyModelImpl extends PropertyRepository {
  @override
  Future<List<PropertyModel>> getMockedProperties() async {
    final propertiesJsonString =
        await rootBundle.loadString('assets/json/properties_mock.json');
    final decodedPropertiesjson = json.decode(propertiesJsonString);
    final properties = (decodedPropertiesjson["properties"] as List)
        .map(
          (property) => PropertyModel.fromJson(property),
        )
        .toList();
    return Future.value(properties);
  }

  @override
  Future<List<Coordinates>> getPropertiesLanLon(
      List<PropertyModel> properties) async {
    final propertiesLanLonList = List<Coordinates>.generate(
      0,
      (i) => Coordinates.fromMap(
        const {},
      ),
    );

    for (PropertyModel property in properties) {
      try {
        final query = property.address;
        List<Address> addresses = await Geocoder.local
            .findAddressesFromQuery(query)
            .timeout(const Duration(milliseconds: 500));
        if (addresses.isNotEmpty) {
          Coordinates coordinates = addresses.first.coordinates;
          propertiesLanLonList.add(coordinates);
        } else {
          // fill location with default values - locations not found by the geo locator or timed out..
          propertiesLanLonList.add(
            Coordinates(32.077714, 34.604068),
          );
        }
      } on Exception catch (e) {
        // fill location with default values - locations not found by the geo locator or timed out..
        propertiesLanLonList.add(
          Coordinates(32.077714, 34.604068),
        );
      }
    }
    return Future.value(propertiesLanLonList);
  }

  @override
  Future<Map<PolylineId, Polyline>> createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    // Object for PolylinePoints
    final PolylinePoints polylinePoints = PolylinePoints();

// List of coordinates to join
    List<LatLng> polylineCoordinates = [];

// Map storing polylines created by connecting two points
    Map<PolylineId, Polyline> polylines = {};
    // Initializing PolylinePoints
    final googleApiKey = dotenv.env['GOOGLE_API_KEY'] ?? '';
    // Generating the list of coordinates to be used for
    // drawing the polylines

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey, // Google Maps API Key
      PointLatLng(startLatitude, startLongitude), // origin coords
      PointLatLng(
          destinationLatitude, destinationLongitude), // destination coords
      travelMode: TravelMode.transit,
    );

    // Adding the coordinates to the list
    //
    if (result.status == EnumToString.convertToString(ResponseStatus.OK)) {
      if (result.points.isNotEmpty) {
        for (var point in result.points) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        }
      }
    } else if (result.status ==
        EnumToString.convertToString(ResponseStatus.ZERO_RESULTS)) {
      // return empty polyline if response is bad
      // in a real app we will alert the user of a bad request..
      return polylines;
    }

    // Defining an ID
    PolylineId id = const PolylineId('poly');

    // Initializing Polyline
    Polyline polyline = Polyline(
      polylineId: id,
      color: T.colors.red,
      points: polylineCoordinates,
      width: 3,
    );

    // Adding the polyline to the map
    polylines[id] = polyline;

    return polylines;
  }
}
