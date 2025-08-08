// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barn_activity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BarnActivityModel _$BarnActivityModelFromJson(Map<String, dynamic> json) {
  return _BarnActivityModel.fromJson(json);
}

/// @nodoc
mixin _$BarnActivityModel {
  @JsonKey(name: 'datetime')
  @MillisecondsSinceEpochConverter()
  DateTime get dateTime => throw _privateConstructorUsedError;
  num get temperature => throw _privateConstructorUsedError;
  num get humidity => throw _privateConstructorUsedError;

  /// Serializes this BarnActivityModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BarnActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BarnActivityModelCopyWith<BarnActivityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarnActivityModelCopyWith<$Res> {
  factory $BarnActivityModelCopyWith(
          BarnActivityModel value, $Res Function(BarnActivityModel) then) =
      _$BarnActivityModelCopyWithImpl<$Res, BarnActivityModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'datetime')
      @MillisecondsSinceEpochConverter()
      DateTime dateTime,
      num temperature,
      num humidity});
}

/// @nodoc
class _$BarnActivityModelCopyWithImpl<$Res, $Val extends BarnActivityModel>
    implements $BarnActivityModelCopyWith<$Res> {
  _$BarnActivityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BarnActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? temperature = null,
    Object? humidity = null,
  }) {
    return _then(_value.copyWith(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as num,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BarnActivityModelImplCopyWith<$Res>
    implements $BarnActivityModelCopyWith<$Res> {
  factory _$$BarnActivityModelImplCopyWith(_$BarnActivityModelImpl value,
          $Res Function(_$BarnActivityModelImpl) then) =
      __$$BarnActivityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'datetime')
      @MillisecondsSinceEpochConverter()
      DateTime dateTime,
      num temperature,
      num humidity});
}

/// @nodoc
class __$$BarnActivityModelImplCopyWithImpl<$Res>
    extends _$BarnActivityModelCopyWithImpl<$Res, _$BarnActivityModelImpl>
    implements _$$BarnActivityModelImplCopyWith<$Res> {
  __$$BarnActivityModelImplCopyWithImpl(_$BarnActivityModelImpl _value,
      $Res Function(_$BarnActivityModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BarnActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? temperature = null,
    Object? humidity = null,
  }) {
    return _then(_$BarnActivityModelImpl(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as num,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BarnActivityModelImpl implements _BarnActivityModel {
  const _$BarnActivityModelImpl(
      {@JsonKey(name: 'datetime')
      @MillisecondsSinceEpochConverter()
      required this.dateTime,
      required this.temperature,
      required this.humidity});

  factory _$BarnActivityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BarnActivityModelImplFromJson(json);

  @override
  @JsonKey(name: 'datetime')
  @MillisecondsSinceEpochConverter()
  final DateTime dateTime;
  @override
  final num temperature;
  @override
  final num humidity;

  @override
  String toString() {
    return 'BarnActivityModel(dateTime: $dateTime, temperature: $temperature, humidity: $humidity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BarnActivityModelImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dateTime, temperature, humidity);

  /// Create a copy of BarnActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BarnActivityModelImplCopyWith<_$BarnActivityModelImpl> get copyWith =>
      __$$BarnActivityModelImplCopyWithImpl<_$BarnActivityModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BarnActivityModelImplToJson(
      this,
    );
  }
}

abstract class _BarnActivityModel implements BarnActivityModel {
  const factory _BarnActivityModel(
      {@JsonKey(name: 'datetime')
      @MillisecondsSinceEpochConverter()
      required final DateTime dateTime,
      required final num temperature,
      required final num humidity}) = _$BarnActivityModelImpl;

  factory _BarnActivityModel.fromJson(Map<String, dynamic> json) =
      _$BarnActivityModelImpl.fromJson;

  @override
  @JsonKey(name: 'datetime')
  @MillisecondsSinceEpochConverter()
  DateTime get dateTime;
  @override
  num get temperature;
  @override
  num get humidity;

  /// Create a copy of BarnActivityModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BarnActivityModelImplCopyWith<_$BarnActivityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
