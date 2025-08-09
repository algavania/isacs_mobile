import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isacs_mobile/core/async_value.dart';
import 'package:isacs_mobile/core/database.dart';
import 'package:isacs_mobile/features/chopper/data/machine_activity_model.dart';
import 'package:isacs_mobile/util/logger.dart';

part 'chopper_state.dart';

part 'chopper_cubit.freezed.dart';

class ChopperCubit extends Cubit<ChopperState> {
  ChopperCubit()
      : super(
          const ChopperState(
            chopperStatus: AsyncValue.loading(),
            activities: AsyncValue.loading(),
            allActivities: AsyncValue.loading(),
            totalUsage: AsyncValue.loading(),
            thisMonthElectricity: AsyncValue.loading(),
          ),
        ) {
    Database.realtimeDb.ref('relay_1_status').get().then((snapshot) {
      if (snapshot.exists) {
        final status = snapshot.value as bool?;
        if (status != null) {
          setChopperStatus(status: status);
        }
      }
    });
    Database.realtimeDb.ref('relay_1_status').onValue.listen((event) {
      final status = event.snapshot.value as bool?;
      if (status != null) {
        setChopperStatus(status: status);
      }
    });
    refreshData();
  }

  void refreshData() {
    setElectricity();
    getActivities();
  }

  void resetTotalUsage() {
    final now = DateTime.now().millisecondsSinceEpoch;
    Database.realtimeDb.ref('setting').update({
      'last_total_usage': now,
    });
    setTotalUsage(now);
  }

  void getActivities() {
    emit(state.copyWith(activities: const AsyncValue.loading()));
    Database.firestore
        .collection('machines')
        .orderBy('start_time', descending: true)
        .limit(50)
        .get()
        .then(_setActivities);
    Database.firestore
        .collection('machines')
        .orderBy('start_time', descending: true)
        .limit(50)
        .snapshots()
        .listen(_setActivities);
  }

  void _setActivities(QuerySnapshot<Map<String, dynamic>> res) {
    final activities = <MachineActivityModel>[];
    for (final doc in res.docs) {
      final data = MachineActivityModel.fromJson(doc.data());
      activities.add(data);
    }
    emit(
      state.copyWith(
        activities: AsyncValue.data(activities),
      ),
    );
  }

  void setElectricity() {
    var thisMonthStart = DateTime.now();
    thisMonthStart = DateTime(thisMonthStart.year, thisMonthStart.month, 1);
    Database.firestore
        .collection('machines')
        .where(
          'start_time',
          isGreaterThanOrEqualTo: thisMonthStart.millisecondsSinceEpoch,
        )
        .get()
        .then(_setElectricity);
    Database.firestore
        .collection('machines')
        .where(
          'start_time',
          isGreaterThanOrEqualTo: thisMonthStart.millisecondsSinceEpoch,
        )
        .snapshots()
        .listen(_setElectricity);
  }

  void _setElectricity(QuerySnapshot<Map<String, dynamic>> res) {
    num kwh = 0;
    for (final doc in res.docs) {
      final data = MachineActivityModel.fromJson(doc.data());
      kwh += data.kwh;
    }
    // Total usage in hours
    final totalUsage = kwh.toStringAsFixed(2);
    emit(
      state.copyWith(
        thisMonthElectricity: AsyncValue.data(num.parse(totalUsage)),
      ),
    );
  }

  void setTotalUsage(num lastTotalUsage) {
    logger.d('Setting total usage with lastTotalUsage: $lastTotalUsage');
    Database.firestore
        .collection('machines')
        .where('start_time', isGreaterThan: lastTotalUsage.toInt())
        .get()
        .then(_setTotalUsage);
    Database.firestore
        .collection('machines')
        .where('start_time', isGreaterThan: lastTotalUsage.toInt())
        .snapshots()
        .listen(_setTotalUsage);
  }

  void _setTotalUsage(QuerySnapshot<Map<String, dynamic>> res) {
    num duration = 0;
    for (final doc in res.docs) {
      final data = MachineActivityModel.fromJson(doc.data());
      duration += data.secondsDuration;
    }
    // Total usage in hours
    final totalUsage = (duration / 3600).toStringAsFixed(2);
    emit(state.copyWith(totalUsage: AsyncValue.data(num.parse(totalUsage))));
  }

  void setChopperStatus({required bool status}) {
    emit(state.copyWith(chopperStatus: const AsyncValue.loading()));
    Database.realtimeDb.ref('/').update({
      'relay_1_status': status,
      'relay_2_status': false,
    });
    emit(state.copyWith(chopperStatus: AsyncValue.data(status)));
  }
}
