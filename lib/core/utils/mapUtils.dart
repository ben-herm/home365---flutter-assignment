// ignore_for_file: constant_identifier_names

import 'dart:math';
import 'package:location/location.dart' hide Location;

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

  static List<PropertyModel> sortPropertiesByType(
      List<PropertyModel> properties,
      SortBy sortPropertiesType,
      LocationData userLocation) {
    switch (sortPropertiesType) {
      case SortBy.normal:
        return properties;
      case SortBy.distance:
        return sortPropertiesByDistance(properties, userLocation);
      case SortBy.name:
        return sortPropertiesByName(properties, userLocation);
      default:
        return properties;
    }
  }

  static Future<List<PropertyModel>> addCoordinatesToProperties(
      List<PropertyModel> properties,
      SortBy sortPropertiesType,
      userLocation) async {
    final propertiesLanLon =
        await PropertyModelImpl().getPropertiesLanLon(properties);
    List<PropertyModel> _propertiesWithCoordinates = List.from(properties);
    _propertiesWithCoordinates = MapUtils.sortPropertiesByType(
      _propertiesWithCoordinates,
      sortPropertiesType,
      userLocation,
    );
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
