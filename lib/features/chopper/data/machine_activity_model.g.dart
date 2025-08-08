// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MachineActivityModelImpl _$$MachineActivityModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MachineActivityModelImpl(
      dateTime: DateTime.parse(json['date_time'] as String),
      status: json['status'] as String,
      totalUsage: json['total_usage'] as num?,
      electricityUsage: json['electricity_usage'] as num?,
    );

Map<String, dynamic> _$$MachineActivityModelImplToJson(
        _$MachineActivityModelImpl instance) =>
    <String, dynamic>{
      'date_time': instance.dateTime.toIso8601String(),
      'status': instance.status,
      'total_usage': instance.totalUsage,
      'electricity_usage': instance.electricityUsage,
    };
