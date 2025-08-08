// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barn_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BarnActivityModelImpl _$$BarnActivityModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BarnActivityModelImpl(
      dateTime: const MillisecondsSinceEpochConverter()
          .fromJson((json['datetime'] as num).toInt()),
      temperature: json['temperature'] as num,
      humidity: json['humidity'] as num,
    );

Map<String, dynamic> _$$BarnActivityModelImplToJson(
        _$BarnActivityModelImpl instance) =>
    <String, dynamic>{
      'datetime':
          const MillisecondsSinceEpochConverter().toJson(instance.dateTime),
      'temperature': instance.temperature,
      'humidity': instance.humidity,
    };
