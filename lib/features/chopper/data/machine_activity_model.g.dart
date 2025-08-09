// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MachineActivityModelImpl _$$MachineActivityModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MachineActivityModelImpl(
      startTime: const MillisecondsSinceEpochConverter()
          .fromJson((json['start_time'] as num).toInt()),
      endTime: const MillisecondsSinceEpochConverter()
          .fromJson((json['end_time'] as num).toInt()),
      averageCurrent: json['average_current'] as num,
      kwh: json['kwh'] as num,
      secondsDuration: json['seconds_duration'] as num,
    );

Map<String, dynamic> _$$MachineActivityModelImplToJson(
        _$MachineActivityModelImpl instance) =>
    <String, dynamic>{
      'start_time':
          const MillisecondsSinceEpochConverter().toJson(instance.startTime),
      'end_time':
          const MillisecondsSinceEpochConverter().toJson(instance.endTime),
      'average_current': instance.averageCurrent,
      'kwh': instance.kwh,
      'seconds_duration': instance.secondsDuration,
    };
