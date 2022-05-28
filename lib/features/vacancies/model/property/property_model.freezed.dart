// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'property_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PropertyModel _$PropertyModelFromJson(Map<String, dynamic> json) {
  return _PropertyModel.fromJson(json);
}

/// @nodoc
class _$PropertyModelTearOff {
  const _$PropertyModelTearOff();

  _PropertyModel call(
      {String propertyId = '',
      String createdOn = '',
      String address = '',
      String occupiedStats = '',
      String owner = '',
      String ownerStatus = '',
      String plan = '',
      TenantModel tenant = const TenantModel(),
      List<double?>? coordinates}) {
    return _PropertyModel(
      propertyId: propertyId,
      createdOn: createdOn,
      address: address,
      occupiedStats: occupiedStats,
      owner: owner,
      ownerStatus: ownerStatus,
      plan: plan,
      tenant: tenant,
      coordinates: coordinates,
    );
  }

  PropertyModel fromJson(Map<String, Object?> json) {
    return PropertyModel.fromJson(json);
  }
}

/// @nodoc
const $PropertyModel = _$PropertyModelTearOff();

/// @nodoc
mixin _$PropertyModel {
  String get propertyId => throw _privateConstructorUsedError;
  String get createdOn => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get occupiedStats => throw _privateConstructorUsedError;
  String get owner => throw _privateConstructorUsedError;
  String get ownerStatus => throw _privateConstructorUsedError;
  String get plan => throw _privateConstructorUsedError;
  TenantModel get tenant => throw _privateConstructorUsedError;
  List<double?>? get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PropertyModelCopyWith<PropertyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyModelCopyWith<$Res> {
  factory $PropertyModelCopyWith(
          PropertyModel value, $Res Function(PropertyModel) then) =
      _$PropertyModelCopyWithImpl<$Res>;
  $Res call(
      {String propertyId,
      String createdOn,
      String address,
      String occupiedStats,
      String owner,
      String ownerStatus,
      String plan,
      TenantModel tenant,
      List<double?>? coordinates});

  $TenantModelCopyWith<$Res> get tenant;
}

/// @nodoc
class _$PropertyModelCopyWithImpl<$Res>
    implements $PropertyModelCopyWith<$Res> {
  _$PropertyModelCopyWithImpl(this._value, this._then);

  final PropertyModel _value;
  // ignore: unused_field
  final $Res Function(PropertyModel) _then;

  @override
  $Res call({
    Object? propertyId = freezed,
    Object? createdOn = freezed,
    Object? address = freezed,
    Object? occupiedStats = freezed,
    Object? owner = freezed,
    Object? ownerStatus = freezed,
    Object? plan = freezed,
    Object? tenant = freezed,
    Object? coordinates = freezed,
  }) {
    return _then(_value.copyWith(
      propertyId: propertyId == freezed
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
      createdOn: createdOn == freezed
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      occupiedStats: occupiedStats == freezed
          ? _value.occupiedStats
          : occupiedStats // ignore: cast_nullable_to_non_nullable
              as String,
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      ownerStatus: ownerStatus == freezed
          ? _value.ownerStatus
          : ownerStatus // ignore: cast_nullable_to_non_nullable
              as String,
      plan: plan == freezed
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as String,
      tenant: tenant == freezed
          ? _value.tenant
          : tenant // ignore: cast_nullable_to_non_nullable
              as TenantModel,
      coordinates: coordinates == freezed
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
    ));
  }

  @override
  $TenantModelCopyWith<$Res> get tenant {
    return $TenantModelCopyWith<$Res>(_value.tenant, (value) {
      return _then(_value.copyWith(tenant: value));
    });
  }
}

/// @nodoc
abstract class _$PropertyModelCopyWith<$Res>
    implements $PropertyModelCopyWith<$Res> {
  factory _$PropertyModelCopyWith(
          _PropertyModel value, $Res Function(_PropertyModel) then) =
      __$PropertyModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String propertyId,
      String createdOn,
      String address,
      String occupiedStats,
      String owner,
      String ownerStatus,
      String plan,
      TenantModel tenant,
      List<double?>? coordinates});

  @override
  $TenantModelCopyWith<$Res> get tenant;
}

/// @nodoc
class __$PropertyModelCopyWithImpl<$Res>
    extends _$PropertyModelCopyWithImpl<$Res>
    implements _$PropertyModelCopyWith<$Res> {
  __$PropertyModelCopyWithImpl(
      _PropertyModel _value, $Res Function(_PropertyModel) _then)
      : super(_value, (v) => _then(v as _PropertyModel));

  @override
  _PropertyModel get _value => super._value as _PropertyModel;

  @override
  $Res call({
    Object? propertyId = freezed,
    Object? createdOn = freezed,
    Object? address = freezed,
    Object? occupiedStats = freezed,
    Object? owner = freezed,
    Object? ownerStatus = freezed,
    Object? plan = freezed,
    Object? tenant = freezed,
    Object? coordinates = freezed,
  }) {
    return _then(_PropertyModel(
      propertyId: propertyId == freezed
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as String,
      createdOn: createdOn == freezed
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      occupiedStats: occupiedStats == freezed
          ? _value.occupiedStats
          : occupiedStats // ignore: cast_nullable_to_non_nullable
              as String,
      owner: owner == freezed
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      ownerStatus: ownerStatus == freezed
          ? _value.ownerStatus
          : ownerStatus // ignore: cast_nullable_to_non_nullable
              as String,
      plan: plan == freezed
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as String,
      tenant: tenant == freezed
          ? _value.tenant
          : tenant // ignore: cast_nullable_to_non_nullable
              as TenantModel,
      coordinates: coordinates == freezed
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PropertyModel extends _PropertyModel {
  const _$_PropertyModel(
      {this.propertyId = '',
      this.createdOn = '',
      this.address = '',
      this.occupiedStats = '',
      this.owner = '',
      this.ownerStatus = '',
      this.plan = '',
      this.tenant = const TenantModel(),
      this.coordinates})
      : super._();

  factory _$_PropertyModel.fromJson(Map<String, dynamic> json) =>
      _$$_PropertyModelFromJson(json);

  @JsonKey()
  @override
  final String propertyId;
  @JsonKey()
  @override
  final String createdOn;
  @JsonKey()
  @override
  final String address;
  @JsonKey()
  @override
  final String occupiedStats;
  @JsonKey()
  @override
  final String owner;
  @JsonKey()
  @override
  final String ownerStatus;
  @JsonKey()
  @override
  final String plan;
  @JsonKey()
  @override
  final TenantModel tenant;
  @override
  final List<double?>? coordinates;

  @override
  String toString() {
    return 'PropertyModel(propertyId: $propertyId, createdOn: $createdOn, address: $address, occupiedStats: $occupiedStats, owner: $owner, ownerStatus: $ownerStatus, plan: $plan, tenant: $tenant, coordinates: $coordinates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PropertyModel &&
            const DeepCollectionEquality()
                .equals(other.propertyId, propertyId) &&
            const DeepCollectionEquality().equals(other.createdOn, createdOn) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.occupiedStats, occupiedStats) &&
            const DeepCollectionEquality().equals(other.owner, owner) &&
            const DeepCollectionEquality()
                .equals(other.ownerStatus, ownerStatus) &&
            const DeepCollectionEquality().equals(other.plan, plan) &&
            const DeepCollectionEquality().equals(other.tenant, tenant) &&
            const DeepCollectionEquality()
                .equals(other.coordinates, coordinates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(propertyId),
      const DeepCollectionEquality().hash(createdOn),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(occupiedStats),
      const DeepCollectionEquality().hash(owner),
      const DeepCollectionEquality().hash(ownerStatus),
      const DeepCollectionEquality().hash(plan),
      const DeepCollectionEquality().hash(tenant),
      const DeepCollectionEquality().hash(coordinates));

  @JsonKey(ignore: true)
  @override
  _$PropertyModelCopyWith<_PropertyModel> get copyWith =>
      __$PropertyModelCopyWithImpl<_PropertyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PropertyModelToJson(this);
  }
}

abstract class _PropertyModel extends PropertyModel {
  const factory _PropertyModel(
      {String propertyId,
      String createdOn,
      String address,
      String occupiedStats,
      String owner,
      String ownerStatus,
      String plan,
      TenantModel tenant,
      List<double?>? coordinates}) = _$_PropertyModel;
  const _PropertyModel._() : super._();

  factory _PropertyModel.fromJson(Map<String, dynamic> json) =
      _$_PropertyModel.fromJson;

  @override
  String get propertyId;
  @override
  String get createdOn;
  @override
  String get address;
  @override
  String get occupiedStats;
  @override
  String get owner;
  @override
  String get ownerStatus;
  @override
  String get plan;
  @override
  TenantModel get tenant;
  @override
  List<double?>? get coordinates;
  @override
  @JsonKey(ignore: true)
  _$PropertyModelCopyWith<_PropertyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
