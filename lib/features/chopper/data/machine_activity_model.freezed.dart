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
  @MillisecondsSinceEpochConverter()
  DateTime get startTime => throw _privateConstructorUsedError;
  @MillisecondsSinceEpochConverter()
  DateTime get endTime => throw _privateConstructorUsedError;
  num get averageCurrent => throw _privateConstructorUsedError;
  num get kwh => throw _privateConstructorUsedError;
  num get secondsDuration => throw _privateConstructorUsedError;

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
      {@MillisecondsSinceEpochConverter() DateTime startTime,
      @MillisecondsSinceEpochConverter() DateTime endTime,
      num averageCurrent,
      num kwh,
      num secondsDuration});
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
    Object? startTime = null,
    Object? endTime = null,
    Object? averageCurrent = null,
    Object? kwh = null,
    Object? secondsDuration = null,
  }) {
    return _then(_value.copyWith(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      averageCurrent: null == averageCurrent
          ? _value.averageCurrent
          : averageCurrent // ignore: cast_nullable_to_non_nullable
              as num,
      kwh: null == kwh
          ? _value.kwh
          : kwh // ignore: cast_nullable_to_non_nullable
              as num,
      secondsDuration: null == secondsDuration
          ? _value.secondsDuration
          : secondsDuration // ignore: cast_nullable_to_non_nullable
              as num,
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
      {@MillisecondsSinceEpochConverter() DateTime startTime,
      @MillisecondsSinceEpochConverter() DateTime endTime,
      num averageCurrent,
      num kwh,
      num secondsDuration});
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
    Object? startTime = null,
    Object? endTime = null,
    Object? averageCurrent = null,
    Object? kwh = null,
    Object? secondsDuration = null,
  }) {
    return _then(_$MachineActivityModelImpl(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      averageCurrent: null == averageCurrent
          ? _value.averageCurrent
          : averageCurrent // ignore: cast_nullable_to_non_nullable
              as num,
      kwh: null == kwh
          ? _value.kwh
          : kwh // ignore: cast_nullable_to_non_nullable
              as num,
      secondsDuration: null == secondsDuration
          ? _value.secondsDuration
          : secondsDuration // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MachineActivityModelImpl implements _MachineActivityModel {
  const _$MachineActivityModelImpl(
      {@MillisecondsSinceEpochConverter() required this.startTime,
      @MillisecondsSinceEpochConverter() required this.endTime,
      required this.averageCurrent,
      required this.kwh,
      required this.secondsDuration});

  factory _$MachineActivityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MachineActivityModelImplFromJson(json);

  @override
  @MillisecondsSinceEpochConverter()
  final DateTime startTime;
  @override
  @MillisecondsSinceEpochConverter()
  final DateTime endTime;
  @override
  final num averageCurrent;
  @override
  final num kwh;
  @override
  final num secondsDuration;

  @override
  String toString() {
    return 'MachineActivityModel(startTime: $startTime, endTime: $endTime, averageCurrent: $averageCurrent, kwh: $kwh, secondsDuration: $secondsDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MachineActivityModelImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.averageCurrent, averageCurrent) ||
                other.averageCurrent == averageCurrent) &&
            (identical(other.kwh, kwh) || other.kwh == kwh) &&
            (identical(other.secondsDuration, secondsDuration) ||
                other.secondsDuration == secondsDuration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, startTime, endTime, averageCurrent, kwh, secondsDuration);

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
      {@MillisecondsSinceEpochConverter() required final DateTime startTime,
      @MillisecondsSinceEpochConverter() required final DateTime endTime,
      required final num averageCurrent,
      required final num kwh,
      required final num secondsDuration}) = _$MachineActivityModelImpl;

  factory _MachineActivityModel.fromJson(Map<String, dynamic> json) =
      _$MachineActivityModelImpl.fromJson;

  @override
  @MillisecondsSinceEpochConverter()
  DateTime get startTime;
  @override
  @MillisecondsSinceEpochConverter()
  DateTime get endTime;
  @override
  num get averageCurrent;
  @override
  num get kwh;
  @override
  num get secondsDuration;

  /// Create a copy of MachineActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MachineActivityModelImplCopyWith<_$MachineActivityModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
