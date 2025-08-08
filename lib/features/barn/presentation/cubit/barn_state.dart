part of 'barn_cubit.dart';

@freezed
class BarnState with _$BarnState {
  const factory BarnState({
    required AsyncValue<num> temperature,
    required AsyncValue<num> humidity,
    required AsyncValue<DateTime> lastUpdated,
    required AsyncValue<num> coolLimit,
    required AsyncValue<num> idealLimit,
    required AsyncValue<num> hotLimit,
    required AsyncValue<List<BarnActivityModel>> statistics,
    required AsyncValue<DropdownTimeEnum> selectedTime,
  }) = _BarnState;
}
