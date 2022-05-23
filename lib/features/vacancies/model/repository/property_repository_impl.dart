import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:home_365_assignment/features/vacancies/model/property/property_model.dart';

import '../domain/property_repository.dart';

class PropertyModelImpl extends PropertyRepository {
  @override
  Future<List<PropertyModel>> getMockedProperties() async {
    final propertiesJsonString =
        await rootBundle.loadString('assets/json/properties_mock.json');
    final decodedPropertiesjson = json.decode(propertiesJsonString);
    final properties = (decodedPropertiesjson as List)
        .map(
          (property) => PropertyModel.fromJson(property),
        )
        .toList();
    return Future.value(properties);
  }
}
