// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'tenant_model.freezed.dart';
part 'tenant_model.g.dart';

@freezed
class TenantModel with _$TenantModel {
  const TenantModel._();
  const factory TenantModel({
    @Default('') final String contactId,
    @Default('') final String firstName,
    @Default('') final String lastName,
    @Default('') final String tenantStatus,
  }) = _TenantModel;

  factory TenantModel.fromJson(Map<String, dynamic> json) =>
      _$TenantModelFromJson(json);
}
