// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tenant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TenantModel _$TenantModelFromJson(Map<String, dynamic> json) {
  return _TenantModel.fromJson(json);
}

/// @nodoc
class _$TenantModelTearOff {
  const _$TenantModelTearOff();

  _TenantModel call(
      {String contactId = '',
      String firstName = '',
      String lastName = '',
      String tenantStatus = ''}) {
    return _TenantModel(
      contactId: contactId,
      firstName: firstName,
      lastName: lastName,
      tenantStatus: tenantStatus,
    );
  }

  TenantModel fromJson(Map<String, Object?> json) {
    return TenantModel.fromJson(json);
  }
}

/// @nodoc
const $TenantModel = _$TenantModelTearOff();

/// @nodoc
mixin _$TenantModel {
  String get contactId => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get tenantStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TenantModelCopyWith<TenantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TenantModelCopyWith<$Res> {
  factory $TenantModelCopyWith(
          TenantModel value, $Res Function(TenantModel) then) =
      _$TenantModelCopyWithImpl<$Res>;
  $Res call(
      {String contactId,
      String firstName,
      String lastName,
      String tenantStatus});
}

/// @nodoc
class _$TenantModelCopyWithImpl<$Res> implements $TenantModelCopyWith<$Res> {
  _$TenantModelCopyWithImpl(this._value, this._then);

  final TenantModel _value;
  // ignore: unused_field
  final $Res Function(TenantModel) _then;

  @override
  $Res call({
    Object? contactId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? tenantStatus = freezed,
  }) {
    return _then(_value.copyWith(
      contactId: contactId == freezed
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      tenantStatus: tenantStatus == freezed
          ? _value.tenantStatus
          : tenantStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TenantModelCopyWith<$Res>
    implements $TenantModelCopyWith<$Res> {
  factory _$TenantModelCopyWith(
          _TenantModel value, $Res Function(_TenantModel) then) =
      __$TenantModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String contactId,
      String firstName,
      String lastName,
      String tenantStatus});
}

/// @nodoc
class __$TenantModelCopyWithImpl<$Res> extends _$TenantModelCopyWithImpl<$Res>
    implements _$TenantModelCopyWith<$Res> {
  __$TenantModelCopyWithImpl(
      _TenantModel _value, $Res Function(_TenantModel) _then)
      : super(_value, (v) => _then(v as _TenantModel));

  @override
  _TenantModel get _value => super._value as _TenantModel;

  @override
  $Res call({
    Object? contactId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? tenantStatus = freezed,
  }) {
    return _then(_TenantModel(
      contactId: contactId == freezed
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      tenantStatus: tenantStatus == freezed
          ? _value.tenantStatus
          : tenantStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TenantModel extends _TenantModel {
  const _$_TenantModel(
      {this.contactId = '',
      this.firstName = '',
      this.lastName = '',
      this.tenantStatus = ''})
      : super._();

  factory _$_TenantModel.fromJson(Map<String, dynamic> json) =>
      _$$_TenantModelFromJson(json);

  @JsonKey()
  @override
  final String contactId;
  @JsonKey()
  @override
  final String firstName;
  @JsonKey()
  @override
  final String lastName;
  @JsonKey()
  @override
  final String tenantStatus;

  @override
  String toString() {
    return 'TenantModel(contactId: $contactId, firstName: $firstName, lastName: $lastName, tenantStatus: $tenantStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TenantModel &&
            const DeepCollectionEquality().equals(other.contactId, contactId) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality()
                .equals(other.tenantStatus, tenantStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(contactId),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(tenantStatus));

  @JsonKey(ignore: true)
  @override
  _$TenantModelCopyWith<_TenantModel> get copyWith =>
      __$TenantModelCopyWithImpl<_TenantModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TenantModelToJson(this);
  }
}

abstract class _TenantModel extends TenantModel {
  const factory _TenantModel(
      {String contactId,
      String firstName,
      String lastName,
      String tenantStatus}) = _$_TenantModel;
  const _TenantModel._() : super._();

  factory _TenantModel.fromJson(Map<String, dynamic> json) =
      _$_TenantModel.fromJson;

  @override
  String get contactId;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get tenantStatus;
  @override
  @JsonKey(ignore: true)
  _$TenantModelCopyWith<_TenantModel> get copyWith =>
      throw _privateConstructorUsedError;
}
