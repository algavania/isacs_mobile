part of 'chopper_cubit.dart';

@freezed
class ChopperState with _$ChopperState {
  const factory ChopperState({
    required AsyncValue<num> totalUsage,
    required AsyncValue<num> thisMonthElectricity,
    required AsyncValue<bool> chopperStatus,
    required AsyncValue<List<MachineActivityModel>> activities,
    required AsyncValue<List<MachineActivityModel>> allActivities,
  }) = _ChopperState;
}
