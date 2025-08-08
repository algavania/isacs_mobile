import 'package:freezed_annotation/freezed_annotation.dart';

part 'machine_activity_model.freezed.dart';
part 'machine_activity_model.g.dart';

@freezed
class MachineActivityModel with _$MachineActivityModel {
  const factory MachineActivityModel({
    required DateTime dateTime,
    required String status,
    num? totalUsage,
    num? electricityUsage,
  }) = _MachineActivityModel;

  factory MachineActivityModel.fromJson(Map<String, Object?> json) =>
      _$MachineActivityModelFromJson(json);
}

List<MachineActivityModel> generateDummyMachineActivityModels() {
  return List.generate(
    10,
    (index) => MachineActivityModel(
      dateTime: DateTime.now().subtract(Duration(days: index)),
      status: index % 3 == 0 ? 'on' : index % 3 == 1 ? 'off' : 'overload',
      totalUsage: (index + 1) * 10,
      electricityUsage: (index + 1) * 5,
    ),
  );
}

List<MachineActivityModel> generateOneMonthMachineActivityModels() {
  final now = DateTime.now();
  return List.generate(
    30,
    (index) => MachineActivityModel(
      dateTime: now.subtract(Duration(days: index)),
      status: index % 3 == 0 ? 'on' : index % 3 == 1 ? 'off' : 'overload',
      totalUsage: (index + 1) * 10,
      electricityUsage: (index + 1) * 5,
    ),
  );
}
