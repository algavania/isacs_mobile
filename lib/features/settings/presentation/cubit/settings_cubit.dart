import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isacs_mobile/core/async_value.dart';
import 'package:isacs_mobile/core/database.dart';

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
            telegramUsername: AsyncValue.data(''),
          ),
        ) {
    getSettingInfo();
    getNotificationsInfo();
    getTemperatureLimits();
  }

  Future<void> getTemperatureLimits() async {
    final res =
        await Database.firestore.collection('settings').doc('barn').get();
    _setTemperatureLimits(res);
    Database.firestore
        .collection('settings')
        .doc('barn')
        .snapshots()
        .listen(_setTemperatureLimits);
  }

  void _setTemperatureLimits(DocumentSnapshot<Map<String, dynamic>> res) {
    final data = res.data();
    final coolLimit = data?['cool'] as num;
    final idealLimit = data?['ideal'] as num;
    final hotLimit = data?['hot'] as num;
    emit(
      state.copyWith(
        coolLimit: AsyncValue.data(coolLimit),
        idealLimit: AsyncValue.data(idealLimit),
        hotLimit: AsyncValue.data(hotLimit),
      ),
    );
  }

  Future<void> getSettingInfo() async {
    final res =
        await Database.firestore.collection('settings').doc('setting').get();
    _setSetting(res);
    Database.firestore
        .collection('settings')
        .doc('setting')
        .snapshots()
        .listen(_setSetting);
  }

  Future<void> getNotificationsInfo() async {
    final res = await Database.firestore
        .collection('settings')
        .doc('notification')
        .get();
    _setNotifications(res);
    Database.firestore
        .collection('settings')
        .doc('notification')
        .snapshots()
        .listen(_setNotifications);
  }

  void _setNotifications(DocumentSnapshot<Map<String, dynamic>> res) {
    final data = res.data();
    final electricityLimit = data?['electricity_limit'] as bool;
    final hotTemperature = data?['hot_temperature'] as bool;
    final machineMaintenance = data?['machine_maintenance'] as bool;
    final telegramUsername = data?['telegram_username'] as String;
    emit(
      state.copyWith(
        electricityLimit: AsyncValue.data(electricityLimit),
        hotTemperature: AsyncValue.data(hotTemperature),
        machineMaintenance: AsyncValue.data(machineMaintenance),
        telegramUsername: AsyncValue.data(telegramUsername),
      ),
    );
  }

  void setTelegramUsername(String username) {
    Database.firestore.collection('settings').doc('notification').update({
      'telegram_username': username,
    });
  }

  void setTemperatureLimits({
    required num coolLimit,
    required num idealLimit,
    required num hotLimit,
  }) {
    Database.firestore.collection('settings').doc('barn').update({
      'cool': coolLimit,
      'ideal': idealLimit,
      'hot': hotLimit,
    });
  }

  void setElectricityPrice(num price) {
    Database.firestore.collection('settings').doc('setting').update({
      'electricity_price': price,
    });
  }

  void setMachineInterval(num interval) {
    Database.firestore.collection('settings').doc('setting').update({
      'machine_interval': interval,
    });
  }

  void setMaxKwh(num maxKwh) {
    Database.firestore.collection('settings').doc('setting').update({
      'max_kwh': maxKwh,
    });
  }

  void _setSetting(DocumentSnapshot<Map<String, dynamic>> res) {
    final data = res.data();
    final electricityPrice = data?['electricity_price'] as num;
    final machineInterval = data?['machine_interval'] as num;
    final maxKwh = data?['max_kwh'] as num;
    emit(
      state.copyWith(
        electricityPrice: AsyncValue.data(electricityPrice),
        machineInterval: AsyncValue.data(machineInterval),
        maxKwh: AsyncValue.data(maxKwh),
      ),
    );
  }

  void setMachineMaintenance({required bool value}) {
    Database.firestore.collection('settings').doc('notification').update({
      'machine_maintenance': value,
    });
  }

  void setElectricityLimit({required bool value}) {
    Database.firestore.collection('settings').doc('notification').update({
      'electricity_limit': value,
    });
  }

  void setHotTemperature({required bool value}) {
    Database.firestore.collection('settings').doc('notification').update({
      'hot_temperature': value,
    });
  }
}
