// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingsState {
  AsyncValue<bool> get machineMaintenance => throw _privateConstructorUsedError;
  AsyncValue<bool> get electricityLimit => throw _privateConstructorUsedError;
  AsyncValue<bool> get hotTemperature => throw _privateConstructorUsedError;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call(
      {AsyncValue<bool> machineMaintenance,
      AsyncValue<bool> electricityLimit,
      AsyncValue<bool> hotTemperature});

  $AsyncValueCopyWith<bool, $Res> get machineMaintenance;
  $AsyncValueCopyWith<bool, $Res> get electricityLimit;
  $AsyncValueCopyWith<bool, $Res> get hotTemperature;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? machineMaintenance = null,
    Object? electricityLimit = null,
    Object? hotTemperature = null,
  }) {
    return _then(_value.copyWith(
      machineMaintenance: null == machineMaintenance
          ? _value.machineMaintenance
          : machineMaintenance // ignore: cast_nullable_to_non_nullable
              as AsyncValue<bool>,
      electricityLimit: null == electricityLimit
          ? _value.electricityLimit
          : electricityLimit // ignore: cast_nullable_to_non_nullable
              as AsyncValue<bool>,
      hotTemperature: null == hotTemperature
          ? _value.hotTemperature
          : hotTemperature // ignore: cast_nullable_to_non_nullable
              as AsyncValue<bool>,
    ) as $Val);
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<bool, $Res> get machineMaintenance {
    return $AsyncValueCopyWith<bool, $Res>(_value.machineMaintenance, (value) {
      return _then(_value.copyWith(machineMaintenance: value) as $Val);
    });
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<bool, $Res> get electricityLimit {
    return $AsyncValueCopyWith<bool, $Res>(_value.electricityLimit, (value) {
      return _then(_value.copyWith(electricityLimit: value) as $Val);
    });
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<bool, $Res> get hotTemperature {
    return $AsyncValueCopyWith<bool, $Res>(_value.hotTemperature, (value) {
      return _then(_value.copyWith(hotTemperature: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SettingsStateImplCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$SettingsStateImplCopyWith(
          _$SettingsStateImpl value, $Res Function(_$SettingsStateImpl) then) =
      __$$SettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<bool> machineMaintenance,
      AsyncValue<bool> electricityLimit,
      AsyncValue<bool> hotTemperature});

  @override
  $AsyncValueCopyWith<bool, $Res> get machineMaintenance;
  @override
  $AsyncValueCopyWith<bool, $Res> get electricityLimit;
  @override
  $AsyncValueCopyWith<bool, $Res> get hotTemperature;
}

/// @nodoc
class __$$SettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateImpl>
    implements _$$SettingsStateImplCopyWith<$Res> {
  __$$SettingsStateImplCopyWithImpl(
      _$SettingsStateImpl _value, $Res Function(_$SettingsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? machineMaintenance = null,
    Object? electricityLimit = null,
    Object? hotTemperature = null,
  }) {
    return _then(_$SettingsStateImpl(
      machineMaintenance: null == machineMaintenance
          ? _value.machineMaintenance
          : machineMaintenance // ignore: cast_nullable_to_non_nullable
              as AsyncValue<bool>,
      electricityLimit: null == electricityLimit
          ? _value.electricityLimit
          : electricityLimit // ignore: cast_nullable_to_non_nullable
              as AsyncValue<bool>,
      hotTemperature: null == hotTemperature
          ? _value.hotTemperature
          : hotTemperature // ignore: cast_nullable_to_non_nullable
              as AsyncValue<bool>,
    ));
  }
}

/// @nodoc

class _$SettingsStateImpl implements _SettingsState {
  const _$SettingsStateImpl(
      {required this.machineMaintenance,
      required this.electricityLimit,
      required this.hotTemperature});

  @override
  final AsyncValue<bool> machineMaintenance;
  @override
  final AsyncValue<bool> electricityLimit;
  @override
  final AsyncValue<bool> hotTemperature;

  @override
  String toString() {
    return 'SettingsState(machineMaintenance: $machineMaintenance, electricityLimit: $electricityLimit, hotTemperature: $hotTemperature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateImpl &&
            (identical(other.machineMaintenance, machineMaintenance) ||
                other.machineMaintenance == machineMaintenance) &&
            (identical(other.electricityLimit, electricityLimit) ||
                other.electricityLimit == electricityLimit) &&
            (identical(other.hotTemperature, hotTemperature) ||
                other.hotTemperature == hotTemperature));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, machineMaintenance, electricityLimit, hotTemperature);

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      __$$SettingsStateImplCopyWithImpl<_$SettingsStateImpl>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  const factory _SettingsState(
      {required final AsyncValue<bool> machineMaintenance,
      required final AsyncValue<bool> electricityLimit,
      required final AsyncValue<bool> hotTemperature}) = _$SettingsStateImpl;

  @override
  AsyncValue<bool> get machineMaintenance;
  @override
  AsyncValue<bool> get electricityLimit;
  @override
  AsyncValue<bool> get hotTemperature;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
