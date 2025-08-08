import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isacs_mobile/core/async_value.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState(
    machineMaintenance: AsyncValue.initial(),
    electricityLimit: AsyncValue.initial(),
    hotTemperature: AsyncValue.initial(),
  ),);

  void setMachineMaintenance({required bool value}) {
    emit(state.copyWith(machineMaintenance: AsyncValue.data(value)));
  }

  void setElectricityLimit({required bool value}) {
    emit(state.copyWith(electricityLimit: AsyncValue.data(value)));
  }

  void setHotTemperature({required bool value}) {
    emit(state.copyWith(hotTemperature: AsyncValue.data(value)));
  }
}
