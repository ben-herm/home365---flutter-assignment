// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home_365_assignment/features/vacancies/model/tenant/tenant_model.dart';

import 'package:flutter_geocoder/geocoder.dart';
part 'property_model.freezed.dart';
part 'property_model.g.dart';

@freezed
class PropertyModel with _$PropertyModel {
  const PropertyModel._();
  const factory PropertyModel({
    @Default('') final String propertyId,
    @Default('') final String createdOn,
    @Default('') final String address,
    @Default('') final String occupiedStats,
    @Default('') final String owner,
    @Default('') final String ownerStatus,
    @Default('') final String plan,
    @Default(TenantModel()) final TenantModel tenant,
    final List<double?>? coordinates,
  }) = _PropertyModel;

  factory PropertyModel.empty() {
    return const PropertyModel();
  }
  factory PropertyModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyModelFromJson(json);
}
