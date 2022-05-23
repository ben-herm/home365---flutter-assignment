// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PropertyModel _$$_PropertyModelFromJson(Map<String, dynamic> json) =>
    _$_PropertyModel(
      propertyId: json['propertyId'] as String? ?? '',
      createdOn: json['createdOn'] as String? ?? '',
      address: json['address'] as String? ?? '',
      occupiedStats: json['occupiedStats'] as String? ?? '',
      owner: json['owner'] as String? ?? '',
      ownerStatus: json['ownerStatus'] as String? ?? '',
      plan: json['plan'] as String? ?? '',
      tenant: json['tenant'] == null
          ? const TenantModel()
          : TenantModel.fromJson(json['tenant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PropertyModelToJson(_$_PropertyModel instance) =>
    <String, dynamic>{
      'propertyId': instance.propertyId,
      'createdOn': instance.createdOn,
      'address': instance.address,
      'occupiedStats': instance.occupiedStats,
      'owner': instance.owner,
      'ownerStatus': instance.ownerStatus,
      'plan': instance.plan,
      'tenant': instance.tenant,
    };
