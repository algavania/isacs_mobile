import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isacs_mobile/features/barn/data/barn_activity_model.dart';

part 'machine_activity_model.freezed.dart';
part 'machine_activity_model.g.dart';

@freezed
class MachineActivityModel with _$MachineActivityModel {
  const factory MachineActivityModel({
    @MillisecondsSinceEpochConverter()
    required DateTime startTime,
    @MillisecondsSinceEpochConverter()
    required DateTime endTime,
    required num averageCurrent,
    required num kwh,
    required num secondsDuration,
  }) = _MachineActivityModel;

  factory MachineActivityModel.fromJson(Map<String, Object?> json) =>
      _$MachineActivityModelFromJson(json);
}
