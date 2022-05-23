import '../model/property/property_model.dart';

// ignore: one_member_abstracts
abstract class PropertyRepository {
  Future<List<PropertyModel>> getMockedProperties();
}
