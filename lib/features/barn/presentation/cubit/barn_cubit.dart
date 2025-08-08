import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isacs_mobile/core/async_value.dart';
import 'package:isacs_mobile/core/database.dart';
import 'package:isacs_mobile/features/barn/data/barn_activity_model.dart';
import 'package:isacs_mobile/util/enum.dart';

part 'barn_state.dart';

part 'barn_cubit.freezed.dart';

class BarnCubit extends Cubit<BarnState> {
  BarnCubit()
      : super(
          const BarnState(
            temperature: AsyncValue.loading(),
            lastUpdated: AsyncValue.loading(),
            humidity: AsyncValue.loading(),
            statistics: AsyncValue.loading(),
            selectedTime: AsyncValue.data(DropdownTimeEnum.today),
            coolLimit: AsyncValue.data(0),
            idealLimit: AsyncValue.data(0),
            hotLimit: AsyncValue.data(0),
          ),
        ) {
    final tempRef = Database.firestore
        .collection('sensors')
        .orderBy('datetime', descending: true)
        .limit(1);
    tempRef.get().then(_setSensorData);
    tempRef.snapshots().listen(_setSensorData);

    final tempLimitRef = Database.firestore.collection('settings').doc('barn');
    tempLimitRef.get().then(_setTempLimit);
    tempLimitRef.snapshots().listen(_setTempLimit);

    applyStatistics();
  }

  void changeDropdownTime(DropdownTimeEnum time) {
    final currentTime = state.selectedTime.maybeMap(
      orElse: () => null,
      data: (s) => s.data,
    );
    if (currentTime != time) {
      emit(state.copyWith(selectedTime: AsyncValue.data(time)));
      applyStatistics();
    }
  }

  void applyStatistics() {
    emit(state.copyWith(statistics: const AsyncValue.loading()));
    final selectedTime =
        state.selectedTime.maybeMap(orElse: () => null, data: (s) => s.data);
    if (selectedTime == null) {
      return;
    }
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final statisticRef = Database.firestore.collection('sensors');
    late Query<Map<String, dynamic>> queryRef;
    switch (selectedTime) {
      case DropdownTimeEnum.today:
        queryRef = statisticRef
            .where(
              'datetime',
              isGreaterThanOrEqualTo: today.millisecondsSinceEpoch,
            )
            .orderBy('datetime', descending: true);
      case DropdownTimeEnum.yesterday:
        queryRef = statisticRef
            .where(
              'datetime',
              isGreaterThanOrEqualTo: today
                  .subtract(const Duration(days: 1))
                  .millisecondsSinceEpoch,
              isLessThan: today.millisecondsSinceEpoch,
            )
            .orderBy('datetime', descending: true);
      case DropdownTimeEnum.thisWeek:
        final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
        queryRef = statisticRef
            .where(
              'datetime',
              isGreaterThanOrEqualTo: startOfWeek.millisecondsSinceEpoch,
            )
            .where('sample_index', isEqualTo: 0)
            .orderBy('datetime', descending: true);
    }
    queryRef.get().then(_setStatistics);
    queryRef.snapshots().listen(_setStatistics);
  }

  void _setStatistics(QuerySnapshot<Map<String, dynamic>> value) {
    final activities = value.docs.map((doc) {
      final data = doc.data();
      return BarnActivityModel.fromJson(data);
    }).toList();
    _setActivities(activities);
    debugPrint('Activities count: ${activities.length}');
  }

  void _setActivities(List<BarnActivityModel> activities) {
    emit(
      state.copyWith(
        statistics: AsyncValue.data(activities),
      ),
    );
  }

  void _setTempLimit(DocumentSnapshot<Map<String, dynamic>> value) {
    if (value.exists) {
      final data = value.data()!;
      emit(
        state.copyWith(
          coolLimit: AsyncValue.data(data['cool'] as num),
          idealLimit: AsyncValue.data(data['ideal'] as num),
          hotLimit: AsyncValue.data(data['hot'] as num),
        ),
      );
    }
  }

  void _setSensorData(QuerySnapshot<Map<String, dynamic>> value) {
    if (value.docs.isNotEmpty) {
      final data = value.docs.first.data();
      final temperature = data['temperature'] as num;
      final humidity = data['humidity'] as num;
      final date = DateTime.fromMillisecondsSinceEpoch(data['datetime'] as int);
      emit(
        state.copyWith(
          temperature: AsyncValue.data(temperature),
          humidity: AsyncValue.data(humidity),
          lastUpdated: AsyncValue.data(date),
        ),
      );
    }
  }
}
