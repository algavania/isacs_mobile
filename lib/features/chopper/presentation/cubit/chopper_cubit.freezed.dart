// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chopper_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChopperState {
  AsyncValue<num> get totalUsage => throw _privateConstructorUsedError;
  AsyncValue<num> get thisMonthElectricity =>
      throw _privateConstructorUsedError;
  AsyncValue<bool> get chopperStatus => throw _privateConstructorUsedError;
  AsyncValue<List<MachineActivityModel>> get activities =>
      throw _privateConstructorUsedError;
  AsyncValue<List<MachineActivityModel>> get allActivities =>
      throw _privateConstructorUsedError;

  /// Create a copy of ChopperState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChopperStateCopyWith<ChopperState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChopperStateCopyWith<$Res> {
  factory $ChopperStateCopyWith(
          ChopperState value, $Res Function(ChopperState) then) =
      _$ChopperStateCopyWithImpl<$Res, ChopperState>;
  @useResult
  $Res call(
      {AsyncValue<num> totalUsage,
      AsyncValue<num> thisMonthElectricity,
      AsyncValue<bool> chopperStatus,
      AsyncValue<List<MachineActivityModel>> activities,
      AsyncValue<List<MachineActivityModel>> allActivities});

  $AsyncValueCopyWith<num, $Res> get totalUsage;
  $AsyncValueCopyWith<num, $Res> get thisMonthElectricity;
  $AsyncValueCopyWith<bool, $Res> get chopperStatus;
  $AsyncValueCopyWith<List<MachineActivityModel>, $Res> get activities;
  $AsyncValueCopyWith<List<MachineActivityModel>, $Res> get allActivities;
}

/// @nodoc
class _$ChopperStateCopyWithImpl<$Res, $Val extends ChopperState>
    implements $ChopperStateCopyWith<$Res> {
  _$ChopperStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChopperState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalUsage = null,
    Object? thisMonthElectricity = null,
    Object? chopperStatus = null,
    Object? activities = null,
    Object? allActivities = null,
  }) {
    return _then(_value.copyWith(
      totalUsage: null == totalUsage
          ? _value.totalUsage
          : totalUsage // ignore: cast_nullable_to_non_nullable
              as AsyncValue<num>,
      thisMonthElectricity: null == thisMonthElectricity
          ? _value.thisMonthElectricity
          : thisMonthElectricity // ignore: cast_nullable_to_non_nullable
              as AsyncValue<num>,
      chopperStatus: null == chopperStatus
          ? _value.chopperStatus
          : chopperStatus // ignore: cast_nullable_to_non_nullable
              as AsyncValue<bool>,
      activities: null == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<MachineActivityModel>>,
      allActivities: null == allActivities
          ? _value.allActivities
          : allActivities // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<MachineActivityModel>>,
    ) as $Val);
  }

  /// Create a copy of ChopperState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<num, $Res> get totalUsage {
    return $AsyncValueCopyWith<num, $Res>(_value.totalUsage, (value) {
      return _then(_value.copyWith(totalUsage: value) as $Val);
    });
  }

  /// Create a copy of ChopperState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<num, $Res> get thisMonthElectricity {
    return $AsyncValueCopyWith<num, $Res>(_value.thisMonthElectricity, (value) {
      return _then(_value.copyWith(thisMonthElectricity: value) as $Val);
    });
  }

  /// Create a copy of ChopperState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<bool, $Res> get chopperStatus {
    return $AsyncValueCopyWith<bool, $Res>(_value.chopperStatus, (value) {
      return _then(_value.copyWith(chopperStatus: value) as $Val);
    });
  }

  /// Create a copy of ChopperState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<List<MachineActivityModel>, $Res> get activities {
    return $AsyncValueCopyWith<List<MachineActivityModel>, $Res>(
        _value.activities, (value) {
      return _then(_value.copyWith(activities: value) as $Val);
    });
  }

  /// Create a copy of ChopperState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<List<MachineActivityModel>, $Res> get allActivities {
    return $AsyncValueCopyWith<List<MachineActivityModel>, $Res>(
        _value.allActivities, (value) {
      return _then(_value.copyWith(allActivities: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChopperStateImplCopyWith<$Res>
    implements $ChopperStateCopyWith<$Res> {
  factory _$$ChopperStateImplCopyWith(
          _$ChopperStateImpl value, $Res Function(_$ChopperStateImpl) then) =
      __$$ChopperStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<num> totalUsage,
      AsyncValue<num> thisMonthElectricity,
      AsyncValue<bool> chopperStatus,
      AsyncValue<List<MachineActivityModel>> activities,
      AsyncValue<List<MachineActivityModel>> allActivities});

  @override
  $AsyncValueCopyWith<num, $Res> get totalUsage;
  @override
  $AsyncValueCopyWith<num, $Res> get thisMonthElectricity;
  @override
  $AsyncValueCopyWith<bool, $Res> get chopperStatus;
  @override
  $AsyncValueCopyWith<List<MachineActivityModel>, $Res> get activities;
  @override
  $AsyncValueCopyWith<List<MachineActivityModel>, $Res> get allActivities;
}

/// @nodoc
class __$$ChopperStateImplCopyWithImpl<$Res>
    extends _$ChopperStateCopyWithImpl<$Res, _$ChopperStateImpl>
    implements _$$ChopperStateImplCopyWith<$Res> {
  __$$ChopperStateImplCopyWithImpl(
      _$ChopperStateImpl _value, $Res Function(_$ChopperStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChopperState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalUsage = null,
    Object? thisMonthElectricity = null,
    Object? chopperStatus = null,
    Object? activities = null,
    Object? allActivities = null,
  }) {
    return _then(_$ChopperStateImpl(
      totalUsage: null == totalUsage
          ? _value.totalUsage
          : totalUsage // ignore: cast_nullable_to_non_nullable
              as AsyncValue<num>,
      thisMonthElectricity: null == thisMonthElectricity
          ? _value.thisMonthElectricity
          : thisMonthElectricity // ignore: cast_nullable_to_non_nullable
              as AsyncValue<num>,
      chopperStatus: null == chopperStatus
          ? _value.chopperStatus
          : chopperStatus // ignore: cast_nullable_to_non_nullable
              as AsyncValue<bool>,
      activities: null == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<MachineActivityModel>>,
      allActivities: null == allActivities
          ? _value.allActivities
          : allActivities // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<MachineActivityModel>>,
    ));
  }
}

/// @nodoc

class _$ChopperStateImpl implements _ChopperState {
  const _$ChopperStateImpl(
      {required this.totalUsage,
      required this.thisMonthElectricity,
      required this.chopperStatus,
      required this.activities,
      required this.allActivities});

  @override
  final AsyncValue<num> totalUsage;
  @override
  final AsyncValue<num> thisMonthElectricity;
  @override
  final AsyncValue<bool> chopperStatus;
  @override
  final AsyncValue<List<MachineActivityModel>> activities;
  @override
  final AsyncValue<List<MachineActivityModel>> allActivities;

  @override
  String toString() {
    return 'ChopperState(totalUsage: $totalUsage, thisMonthElectricity: $thisMonthElectricity, chopperStatus: $chopperStatus, activities: $activities, allActivities: $allActivities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChopperStateImpl &&
            (identical(other.totalUsage, totalUsage) ||
                other.totalUsage == totalUsage) &&
            (identical(other.thisMonthElectricity, thisMonthElectricity) ||
                other.thisMonthElectricity == thisMonthElectricity) &&
            (identical(other.chopperStatus, chopperStatus) ||
                other.chopperStatus == chopperStatus) &&
            (identical(other.activities, activities) ||
                other.activities == activities) &&
            (identical(other.allActivities, allActivities) ||
                other.allActivities == allActivities));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalUsage, thisMonthElectricity,
      chopperStatus, activities, allActivities);

  /// Create a copy of ChopperState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChopperStateImplCopyWith<_$ChopperStateImpl> get copyWith =>
      __$$ChopperStateImplCopyWithImpl<_$ChopperStateImpl>(this, _$identity);
}

abstract class _ChopperState implements ChopperState {
  const factory _ChopperState(
      {required final AsyncValue<num> totalUsage,
      required final AsyncValue<num> thisMonthElectricity,
      required final AsyncValue<bool> chopperStatus,
      required final AsyncValue<List<MachineActivityModel>> activities,
      required final AsyncValue<List<MachineActivityModel>>
          allActivities}) = _$ChopperStateImpl;

  @override
  AsyncValue<num> get totalUsage;
  @override
  AsyncValue<num> get thisMonthElectricity;
  @override
  AsyncValue<bool> get chopperStatus;
  @override
  AsyncValue<List<MachineActivityModel>> get activities;
  @override
  AsyncValue<List<MachineActivityModel>> get allActivities;

  /// Create a copy of ChopperState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChopperStateImplCopyWith<_$ChopperStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
