// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TenantModel _$$_TenantModelFromJson(Map<String, dynamic> json) =>
    _$_TenantModel(
      contactId: json['contactId'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      tenantStatus: json['tenantStatus'] as String? ?? '',
    );

Map<String, dynamic> _$$_TenantModelToJson(_$_TenantModel instance) =>
    <String, dynamic>{
      'contactId': instance.contactId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'tenantStatus': instance.tenantStatus,
    };
