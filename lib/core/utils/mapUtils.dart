import 'package:flutter_geocoder/geocoder.dart';
import 'dart:math';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/UI/theme/theme.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:location/location.dart' hide Location;
import 'package:flutter_geocoder/geocoder.dart';

import '../../features/vacancies/model/property/property_model.dart';
import '../../features/vacancies/model/repository/property_repository_impl.dart';
import '../../features/vacancies/presentation/organism/properties_grid.dart';

enum ResponseStatus { ZERO_RESULTS, OK }

class MapUtils {
  static double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  static List<PropertyModel> sortPropertiesByDistance(
    List<PropertyModel> properties,
    LocationData userLocation,
  ) {
// sort coordinates list
    properties.sort(
      (a, b) => calculateDistance(a.coordinates![0], a.coordinates![1],
              userLocation.latitude, userLocation.longitude)
          .compareTo(
        calculateDistance(b.coordinates![0], b.coordinates![1],
            userLocation.latitude, userLocation.longitude),
      ),
    );

    return properties;
  }

  static List<PropertyModel> sortPropertiesByName(
    List<PropertyModel> properties,
    LocationData userLocation,
  ) {
// sort coordinates list
    properties.sort(
      (a, b) => a.address.compareTo(
        (b.address),
      ),
    );

    return properties;
  }

  static List<PropertyModel> sortCoordinatesByType(
      List<PropertyModel> propertyies,
      SortBy sortPropertiesType,
      LocationData userLocation) {
    switch (sortPropertiesType) {
      case SortBy.normal:
        return propertyies;
      case SortBy.distance:
        return sortPropertiesByDistance(propertyies, userLocation);
      case SortBy.name:
        return sortPropertiesByName(propertyies, userLocation);
      default:
        return propertyies;
    }
  }

  static Future<List<PropertyModel>> addCoordinatesToProperties(
      List<PropertyModel> properties,
      SortBy sortPropertiesType,
      userLocation) async {
    final propertiesLanLon =
        await PropertyModelImpl().getPropertiesLanLon(properties);
    List<PropertyModel> _propertiesWithCoordinates = List.from(properties);
    _propertiesWithCoordinates = MapUtils.sortCoordinatesByType(
        _propertiesWithCoordinates, sortPropertiesType, userLocation);
    _propertiesWithCoordinates.asMap().forEach(
      (index, value) {
        _propertiesWithCoordinates[index] =
            _propertiesWithCoordinates[index].copyWith(
          coordinates: [
            propertiesLanLon[index].latitude,
            propertiesLanLon[index].longitude
          ],
        );
      },
    );

    return Future.value(_propertiesWithCoordinates);
  }
}
