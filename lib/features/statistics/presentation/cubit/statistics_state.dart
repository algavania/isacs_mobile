part of 'statistics_cubit.dart';

@freezed
class StatisticsState with _$StatisticsState {
  const factory StatisticsState({
    required AsyncValue<bool> isChopperSelected,
    required AsyncValue<String?> machineAnalysis,
    required AsyncValue<String?> barnAnalysis,
    required AsyncValue<DropdownTimeEnum> machineTimeDropdown,
    required AsyncValue<DropdownTimeEnum> barnTimeDropdown,
    required AsyncValue<List<MachineActivityModel>> machineActivities,
    required AsyncValue<List<BarnActivityModel>> barnActivities,
  }) = _StatisticsState;
}
