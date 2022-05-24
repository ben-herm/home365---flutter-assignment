import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/services.dart';
import 'package:home_365_assignment/features/vacancies/model/property/property_model.dart';

import '../../domain/property_repository.dart';

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
  Future<List<Location>> getPropertiesLanLon(
      List<PropertyModel> properties) async {
    final propertiesLanLonList = List<Location>.generate(
      0,
      (i) => Location.fromMap(
        {},
      ),
    );

    for (PropertyModel property in properties) {
      final location = await locationFromAddress(property.address);
      if (location.isNotEmpty) {
        propertiesLanLonList.add(location[0]);
      } else {
        // fill location with 0 values - locations not found by the geo locator.
        propertiesLanLonList.add(
          Location(
            latitude: 0,
            longitude: 0,
            timestamp: DateTime.now(),
          ),
        );
      }
    }
    print('lalalalalalalalalala' + propertiesLanLonList.toString());
    return Future.value(propertiesLanLonList);
  }
}
