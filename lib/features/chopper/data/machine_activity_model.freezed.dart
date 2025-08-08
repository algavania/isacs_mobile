// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'machine_activity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MachineActivityModel _$MachineActivityModelFromJson(Map<String, dynamic> json) {
  return _MachineActivityModel.fromJson(json);
}

/// @nodoc
mixin _$MachineActivityModel {
  DateTime get dateTime => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  num? get totalUsage => throw _privateConstructorUsedError;
  num? get electricityUsage => throw _privateConstructorUsedError;

  /// Serializes this MachineActivityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MachineActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MachineActivityModelCopyWith<MachineActivityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachineActivityModelCopyWith<$Res> {
  factory $MachineActivityModelCopyWith(MachineActivityModel value,
          $Res Function(MachineActivityModel) then) =
      _$MachineActivityModelCopyWithImpl<$Res, MachineActivityModel>;
  @useResult
  $Res call(
      {DateTime dateTime,
      String status,
      num? totalUsage,
      num? electricityUsage});
}

/// @nodoc
class _$MachineActivityModelCopyWithImpl<$Res,
        $Val extends MachineActivityModel>
    implements $MachineActivityModelCopyWith<$Res> {
  _$MachineActivityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MachineActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? status = null,
    Object? totalUsage = freezed,
    Object? electricityUsage = freezed,
  }) {
    return _then(_value.copyWith(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalUsage: freezed == totalUsage
          ? _value.totalUsage
          : totalUsage // ignore: cast_nullable_to_non_nullable
              as num?,
      electricityUsage: freezed == electricityUsage
          ? _value.electricityUsage
          : electricityUsage // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MachineActivityModelImplCopyWith<$Res>
    implements $MachineActivityModelCopyWith<$Res> {
  factory _$$MachineActivityModelImplCopyWith(_$MachineActivityModelImpl value,
          $Res Function(_$MachineActivityModelImpl) then) =
      __$$MachineActivityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime dateTime,
      String status,
      num? totalUsage,
      num? electricityUsage});
}

/// @nodoc
class __$$MachineActivityModelImplCopyWithImpl<$Res>
    extends _$MachineActivityModelCopyWithImpl<$Res, _$MachineActivityModelImpl>
    implements _$$MachineActivityModelImplCopyWith<$Res> {
  __$$MachineActivityModelImplCopyWithImpl(_$MachineActivityModelImpl _value,
      $Res Function(_$MachineActivityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MachineActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? status = null,
    Object? totalUsage = freezed,
    Object? electricityUsage = freezed,
  }) {
    return _then(_$MachineActivityModelImpl(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      totalUsage: freezed == totalUsage
          ? _value.totalUsage
          : totalUsage // ignore: cast_nullable_to_non_nullable
              as num?,
      electricityUsage: freezed == electricityUsage
          ? _value.electricityUsage
          : electricityUsage // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MachineActivityModelImpl implements _MachineActivityModel {
  const _$MachineActivityModelImpl(
      {required this.dateTime,
      required this.status,
      this.totalUsage,
      this.electricityUsage});

  factory _$MachineActivityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MachineActivityModelImplFromJson(json);

  @override
  final DateTime dateTime;
  @override
  final String status;
  @override
  final num? totalUsage;
  @override
  final num? electricityUsage;

  @override
  String toString() {
    return 'MachineActivityModel(dateTime: $dateTime, status: $status, totalUsage: $totalUsage, electricityUsage: $electricityUsage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MachineActivityModelImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalUsage, totalUsage) ||
                other.totalUsage == totalUsage) &&
            (identical(other.electricityUsage, electricityUsage) ||
                other.electricityUsage == electricityUsage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, dateTime, status, totalUsage, electricityUsage);

  /// Create a copy of MachineActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MachineActivityModelImplCopyWith<_$MachineActivityModelImpl>
      get copyWith =>
          __$$MachineActivityModelImplCopyWithImpl<_$MachineActivityModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MachineActivityModelImplToJson(
      this,
    );
  }
}

abstract class _MachineActivityModel implements MachineActivityModel {
  const factory _MachineActivityModel(
      {required final DateTime dateTime,
      required final String status,
      final num? totalUsage,
      final num? electricityUsage}) = _$MachineActivityModelImpl;

  factory _MachineActivityModel.fromJson(Map<String, dynamic> json) =
      _$MachineActivityModelImpl.fromJson;

  @override
  DateTime get dateTime;
  @override
  String get status;
  @override
  num? get totalUsage;
  @override
  num? get electricityUsage;

  /// Create a copy of MachineActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MachineActivityModelImplCopyWith<_$MachineActivityModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
