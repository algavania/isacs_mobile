import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isacs_mobile/core/async_value.dart';
import 'package:isacs_mobile/core/database.dart';
import 'package:isacs_mobile/features/chopper/presentation/cubit/chopper_cubit.dart';
import 'package:isacs_mobile/injector/injector.dart';

part 'settings_state.dart';

part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(
          const SettingsState(
            machineMaintenance: AsyncValue.initial(),
            electricityLimit: AsyncValue.initial(),
            hotTemperature: AsyncValue.initial(),
            machineInterval: AsyncValue.initial(),
            electricityPrice: AsyncValue.initial(),
            maxKwh: AsyncValue.initial(),
            coolLimit: AsyncValue.initial(),
            idealLimit: AsyncValue.initial(),
            hotLimit: AsyncValue.initial(),
            lastTotalUsage: AsyncValue.initial(),
            telegramUsername: AsyncValue.data(''),
          ),
        ) {
    getSettingInfo();
    getNotificationsInfo();
    getTemperatureLimits();
  }

  var hasFetchedFirst = false;

  Future<void> getTemperatureLimits() async {
    final res = await Database.realtimeDb.ref('barn').get();
    _setTemperatureLimits(res);
    Database.realtimeDb.ref('barn').onValue.listen((event) {
      _setTemperatureLimits(event.snapshot);
    });
  }

  void _setTemperatureLimits(DataSnapshot res) {
    if (res.exists) {
      final data = res.value! as Map;
      final coolLimit = data['cool'] as num;
      final idealLimit = data['ideal'] as num;
      final hotLimit = data['hot'] as num;
      emit(
        state.copyWith(
          coolLimit: AsyncValue.data(coolLimit),
          idealLimit: AsyncValue.data(idealLimit),
          hotLimit: AsyncValue.data(hotLimit),
        ),
      );
    }
  }

  Future<void> getSettingInfo() async {
    final res = await Database.realtimeDb.ref('setting').get();
    _setSetting(res);
    Database.realtimeDb.ref('setting').onValue.listen((event) {
      _setSetting(event.snapshot);
    });
  }

  void _setSetting(DataSnapshot res) {
    if (res.exists) {
      final data = res.value! as Map;
      final electricityPrice = data['electricity_price'] as num;
      final machineInterval = data['machine_interval'] as num;
      final maxKwh = data['max_kwh'] as num;
      final lastTotalUsage = data['last_total_usage'] as num? ?? 0;
      if (!hasFetchedFirst) {
        hasFetchedFirst = true;
        debugPrint('get total usage with $lastTotalUsage');
        Injector.instance<ChopperCubit>().setTotalUsage(lastTotalUsage);
      }
      emit(
        state.copyWith(
          electricityPrice: AsyncValue.data(electricityPrice),
          machineInterval: AsyncValue.data(machineInterval),
          maxKwh: AsyncValue.data(maxKwh),
          lastTotalUsage: AsyncValue.data(lastTotalUsage),
        ),
      );
    }
  }

  Future<void> getNotificationsInfo() async {
    final res = await Database.realtimeDb.ref('notification').get();
    _setNotification(res);
    Database.realtimeDb.ref('notification').onValue.listen((event) {
      _setNotification(event.snapshot);
    });
  }

  void _setNotification(DataSnapshot res) {
    if (res.exists) {
      final data = res.value! as Map;
      final electricityLimit = data['electricity_limit'] as bool? ?? false;
      final hotTemperature = data['hot_temperature'] as bool? ?? false;
      final machineMaintenance = data['machine_maintenance'] as bool? ?? false;
      final telegramUsername = data['telegram_username'] as String? ?? '';
      emit(
        state.copyWith(
          electricityLimit: AsyncValue.data(electricityLimit),
          hotTemperature: AsyncValue.data(hotTemperature),
          machineMaintenance: AsyncValue.data(machineMaintenance),
          telegramUsername: AsyncValue.data(telegramUsername),
        ),
      );
    }
  }

  void setTelegramUsername(String username) {
    Database.realtimeDb.ref('notification').update({
      'telegram_username': username,
    });
  }

  void setTemperatureLimits({
    required num coolLimit,
    required num idealLimit,
    required num hotLimit,
  }) {
    Database.realtimeDb.ref('barn').update({
      'cool': coolLimit,
      'ideal': idealLimit,
      'hot': hotLimit,
    });
  }

  void setElectricityPrice(num price) {
    Database.realtimeDb.ref('setting').update({
      'electricity_price': price,
    });
  }

  void setMachineInterval(num interval) {
    Database.realtimeDb.ref('setting').update({
      'machine_interval': interval,
    });
  }

  void setMaxKwh(num maxKwh) {
    Database.realtimeDb.ref('setting').update({
      'max_kwh': maxKwh,
    });
  }

  void setMachineMaintenance({required bool value}) {
    Database.realtimeDb.ref('notification').update({
      'machine_maintenance': value,
    });
  }

  void setElectricityLimit({required bool value}) {
    Database.realtimeDb.ref('notification').update({
      'electricity_limit': value,
    });
  }

  void setHotTemperature({required bool value}) {
    Database.realtimeDb.ref('notification').update({
      'hot_temperature': value,
    });
  }
}
