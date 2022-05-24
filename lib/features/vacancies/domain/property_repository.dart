import '../model/property/property_model.dart';
import 'package:geocoding/geocoding.dart';

// ignore: one_member_abstracts
abstract class PropertyRepository {
  Future<List<PropertyModel>> getMockedProperties();

  Future<List<Location>> getPropertiesLanLon(List<PropertyModel> properties);
}
