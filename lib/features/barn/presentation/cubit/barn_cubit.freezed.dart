// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barn_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BarnState {
  AsyncValue<num> get temperature => throw _privateConstructorUsedError;
  AsyncValue<num> get humidity => throw _privateConstructorUsedError;
  AsyncValue<num> get coolLimit => throw _privateConstructorUsedError;
  AsyncValue<num> get idealLimit => throw _privateConstructorUsedError;
  AsyncValue<num> get hotLimit => throw _privateConstructorUsedError;
  AsyncValue<List<BarnActivityModel>> get statistics =>
      throw _privateConstructorUsedError;
  AsyncValue<DropdownTimeEnum> get selectedTime =>
      throw _privateConstructorUsedError;

  /// Create a copy of BarnState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BarnStateCopyWith<BarnState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarnStateCopyWith<$Res> {
  factory $BarnStateCopyWith(BarnState value, $Res Function(BarnState) then) =
      _$BarnStateCopyWithImpl<$Res, BarnState>;
  @useResult
  $Res call(
      {AsyncValue<num> temperature,
      AsyncValue<num> humidity,
      AsyncValue<num> coolLimit,
      AsyncValue<num> idealLimit,
      AsyncValue<num> hotLimit,
      AsyncValue<List<BarnActivityModel>> statistics,
      AsyncValue<DropdownTimeEnum> selectedTime});

  $AsyncValueCopyWith<num, $Res> get temperature;
  $AsyncValueCopyWith<num, $Res> get humidity;
  $AsyncValueCopyWith<num, $Res> get coolLimit;
  $AsyncValueCopyWith<num, $Res> get idealLimit;
  $AsyncValueCopyWith<num, $Res> get hotLimit;
  $AsyncValueCopyWith<List<BarnActivityModel>, $Res> get statistics;
  $AsyncValueCopyWith<DropdownTimeEnum, $Res> get selectedTime;
}

/// @nodoc
class _$BarnStateCopyWithImpl<$Res, $Val extends BarnState>
    implements $BarnStateCopyWith<$Res> {
  _$BarnStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BarnState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? humidity = null,
    Object? coolLimit = null,
    Object? idealLimit = null,
    Object? hotLimit = null,
    Object? statistics = null,
    Object? selectedTime = null,
  }) {
    return _then(_value.copyWith(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as AsyncValue<num>,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as AsyncValue<num>,
      coolLimit: null == coolLimit
          ? _value.coolLimit
          : coolLimit // ignore: cast_nullable_to_non_nullable
              as AsyncValue<num>,
      idealLimit: null == idealLimit
          ? _value.idealLimit
          : idealLimit // ignore: cast_nullable_to_non_nullable
              as AsyncValue<num>,
      hotLimit: null == hotLimit
          ? _value.hotLimit
          : hotLimit // ignore: cast_nullable_to_non_nullable
              as AsyncValue<num>,
      statistics: null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<BarnActivityModel>>,
      selectedTime: null == selectedTime
          ? _value.selectedTime
          : selectedTime // ignore: cast_nullable_to_non_nullable
              as AsyncValue<DropdownTimeEnum>,
    ) as $Val);
  }

  /// Create a copy of BarnState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<num, $Res> get temperature {
    return $AsyncValueCopyWith<num, $Res>(_value.temperature, (value) {
      return _then(_value.copyWith(temperature: value) as $Val);
    });
  }

  /// Create a copy of BarnState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<num, $Res> get humidity {
    return $AsyncValueCopyWith<num, $Res>(_value.humidity, (value) {
      return _then(_value.copyWith(humidity: value) as $Val);
    });
  }

  /// Create a copy of BarnState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<num, $Res> get coolLimit {
    return $AsyncValueCopyWith<num, $Res>(_value.coolLimit, (value) {
      return _then(_value.copyWith(coolLimit: value) as $Val);
    });
  }

  /// Create a copy of BarnState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<num, $Res> get idealLimit {
    return $AsyncValueCopyWith<num, $Res>(_value.idealLimit, (value) {
      return _then(_value.copyWith(idealLimit: value) as $Val);
    });
  }

  /// Create a copy of BarnState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<num, $Res> get hotLimit {
    return $AsyncValueCopyWith<num, $Res>(_value.hotLimit, (value) {
      return _then(_value.copyWith(hotLimit: value) as $Val);
    });
  }

  /// Create a copy of BarnState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<List<BarnActivityModel>, $Res> get statistics {
    return $AsyncValueCopyWith<List<BarnActivityModel>, $Res>(_value.statistics,
        (value) {
      return _then(_value.copyWith(statistics: value) as $Val);
    });
  }

  /// Create a copy of BarnState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AsyncValueCopyWith<DropdownTimeEnum, $Res> get selectedTime {
    return $AsyncValueCopyWith<DropdownTimeEnum, $Res>(_value.selectedTime,
        (value) {
      return _then(_value.copyWith(selectedTime: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BarnStateImplCopyWith<$Res>
    implements $BarnStateCopyWith<$Res> {
  factory _$$BarnStateImplCopyWith(
          _$BarnStateImpl value, $Res Function(_$BarnStateImpl) then) =
      __$$BarnStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<num> temperature,
      AsyncValue<num> humidity,
      AsyncValue<num> coolLimit,
      AsyncValue<num> idealLimit,
      AsyncValue<num> hotLimit,
      AsyncValue<List<BarnActivityModel>> statistics,
      AsyncValue<DropdownTimeEnum> selectedTime});

  @override
  $AsyncValueCopyWith<num, $Res> get temperature;
  @override
  $AsyncValueCopyWith<num, $Res> get humidity;
  @override
  $AsyncValueCopyWith<num, $Res> get coolLimit;
  @override
  $AsyncValueCopyWith<num, $Res> get idealLimit;
  @override
  $AsyncValueCopyWith<num, $Res> get hotLimit;
  @override
  $AsyncValueCopyWith<List<BarnActivityModel>, $Res> get statistics;
  @override
  $AsyncValueCopyWith<DropdownTimeEnum, $Res> get selectedTime;
}

/// @nodoc
class __$$BarnStateImplCopyWithImpl<$Res>
    extends _$BarnStateCopyWithImpl<$Res, _$BarnStateImpl>
    implements _$$BarnStateImplCopyWith<$Res> {
  __$$BarnStateImplCopyWithImpl(
      _$BarnStateImpl _value, $Res Function(_$BarnStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BarnState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = null,
    Object? humidity = null,
    Object? coolLimit = null,
    Object? idealLimit = null,
    Object? hotLimit = null,
    Object? statistics = null,
    Object? selectedTime = null,
  }) {
    return _then(_$BarnStateImpl(
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as AsyncValue<num>,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as AsyncValue<num>,
      coolLimit: null == coolLimit
          ? _value.coolLimit
          : coolLimit // ignore: cast_nullable_to_non_nullable
              as AsyncValue<num>,
      idealLimit: null == idealLimit
          ? _value.idealLimit
          : idealLimit // ignore: cast_nullable_to_non_nullable
              as AsyncValue<num>,
      hotLimit: null == hotLimit
          ? _value.hotLimit
          : hotLimit // ignore: cast_nullable_to_non_nullable
              as AsyncValue<num>,
      statistics: null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<BarnActivityModel>>,
      selectedTime: null == selectedTime
          ? _value.selectedTime
          : selectedTime // ignore: cast_nullable_to_non_nullable
              as AsyncValue<DropdownTimeEnum>,
    ));
  }
}

/// @nodoc

class _$BarnStateImpl implements _BarnState {
  const _$BarnStateImpl(
      {required this.temperature,
      required this.humidity,
      required this.coolLimit,
      required this.idealLimit,
      required this.hotLimit,
      required this.statistics,
      required this.selectedTime});

  @override
  final AsyncValue<num> temperature;
  @override
  final AsyncValue<num> humidity;
  @override
  final AsyncValue<num> coolLimit;
  @override
  final AsyncValue<num> idealLimit;
  @override
  final AsyncValue<num> hotLimit;
  @override
  final AsyncValue<List<BarnActivityModel>> statistics;
  @override
  final AsyncValue<DropdownTimeEnum> selectedTime;

  @override
  String toString() {
    return 'BarnState(temperature: $temperature, humidity: $humidity, coolLimit: $coolLimit, idealLimit: $idealLimit, hotLimit: $hotLimit, statistics: $statistics, selectedTime: $selectedTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarnStateImpl &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.coolLimit, coolLimit) ||
                other.coolLimit == coolLimit) &&
            (identical(other.idealLimit, idealLimit) ||
                other.idealLimit == idealLimit) &&
            (identical(other.hotLimit, hotLimit) ||
                other.hotLimit == hotLimit) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            (identical(other.selectedTime, selectedTime) ||
                other.selectedTime == selectedTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, temperature, humidity, coolLimit,
      idealLimit, hotLimit, statistics, selectedTime);

  /// Create a copy of BarnState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BarnStateImplCopyWith<_$BarnStateImpl> get copyWith =>
      __$$BarnStateImplCopyWithImpl<_$BarnStateImpl>(this, _$identity);
}

abstract class _BarnState implements BarnState {
  const factory _BarnState(
          {required final AsyncValue<num> temperature,
          required final AsyncValue<num> humidity,
          required final AsyncValue<num> coolLimit,
          required final AsyncValue<num> idealLimit,
          required final AsyncValue<num> hotLimit,
          required final AsyncValue<List<BarnActivityModel>> statistics,
          required final AsyncValue<DropdownTimeEnum> selectedTime}) =
      _$BarnStateImpl;

  @override
  AsyncValue<num> get temperature;
  @override
  AsyncValue<num> get humidity;
  @override
  AsyncValue<num> get coolLimit;
  @override
  AsyncValue<num> get idealLimit;
  @override
  AsyncValue<num> get hotLimit;
  @override
  AsyncValue<List<BarnActivityModel>> get statistics;
  @override
  AsyncValue<DropdownTimeEnum> get selectedTime;

  /// Create a copy of BarnState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BarnStateImplCopyWith<_$BarnStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
