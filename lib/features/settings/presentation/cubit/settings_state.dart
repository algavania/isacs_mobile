part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required AsyncValue<bool> machineMaintenance,
    required AsyncValue<bool> electricityLimit,
    required AsyncValue<bool> hotTemperature,
    required AsyncValue<num> machineInterval,
    required AsyncValue<num> electricityPrice,
    required AsyncValue<num> maxKwh,
    required AsyncValue<num> coolLimit,
    required AsyncValue<num> idealLimit,
    required AsyncValue<num> hotLimit,
    required AsyncValue<num> lastTotalUsage,
    required AsyncValue<String> telegramUsername,
  }) = _SettingsState;
}
