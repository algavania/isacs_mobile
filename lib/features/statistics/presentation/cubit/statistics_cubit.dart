import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isacs_mobile/core/async_value.dart';
import 'package:isacs_mobile/core/database.dart';
import 'package:isacs_mobile/features/barn/data/barn_activity_model.dart';
import 'package:isacs_mobile/features/chopper/data/machine_activity_model.dart';
import 'package:isacs_mobile/util/enum.dart';

part 'statistics_state.dart';

part 'statistics_cubit.freezed.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit()
      : super(
    const StatisticsState(
      isChopperSelected: AsyncValue.data(true),
      machineAnalysis: AsyncValue.data(null),
      barnAnalysis: AsyncValue.data(null),
      machineTimeDropdown: AsyncValue.data(DropdownTimeEnum.today),
      barnTimeDropdown: AsyncValue.data(DropdownTimeEnum.today),
      machineActivities: AsyncValue.data([]),
      barnActivities: AsyncValue.data([]),
    ),
  ) {
    applyBarnStatistics();
  }

  void applyBarnStatistics() {
    emit(state.copyWith(barnActivities: const AsyncValue.loading()));
    final selectedTime = state.barnTimeDropdown
        .maybeMap(orElse: () => null, data: (s) => s.data);
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
    queryRef.get().then(_setBarnStatistics);
    queryRef.snapshots().listen(_setBarnStatistics);
  }

  void _setBarnStatistics(QuerySnapshot<Map<String, dynamic>> value) {
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
        barnActivities: AsyncValue.data(activities),
      ),
    );
  }

  void setIsChopperSelected({required bool isChopperSelected}) {
    emit(
      state.copyWith(
        isChopperSelected: AsyncValue.data(isChopperSelected),
      ),
    );
  }

  void setMachineTimeDropdown({
    required DropdownTimeEnum machineTimeDropdown,
  }) {
    final selectedTime = state.machineTimeDropdown.maybeMap(
      orElse: () => null,
      data: (s) => s.data,
    );
    if (selectedTime != machineTimeDropdown) {
      emit(
        state.copyWith(
          machineTimeDropdown: AsyncValue.data(machineTimeDropdown),
          machineAnalysis: const AsyncValue.data(null),
        ),
      );
    }
  }

  void setBarnTimeDropdown({
    required DropdownTimeEnum barnTimeDropdown,
  }) {
    final selectedTime = state.barnTimeDropdown.maybeMap(
      orElse: () => null,
      data: (s) => s.data,
    );
    if (selectedTime != barnTimeDropdown) {
      emit(
        state.copyWith(
          barnTimeDropdown: AsyncValue.data(barnTimeDropdown),
          barnAnalysis: const AsyncValue.data(null),
        ),
      );
      applyBarnStatistics();
    }
  }

  Future<void> generateBarnAnalysis() async {
    emit(state.copyWith(barnAnalysis: const AsyncValue.loading()));
    try {
      final selectedTime = state.barnTimeDropdown.maybeMap(
        orElse: () => DropdownTimeEnum.today,
        data: (s) => s.data,
      );
      final activities = state.barnActivities.maybeMap(
        orElse: () => <BarnActivityModel>[],
        data: (s) => s.data,
      );
      if (activities.isEmpty) {
        emit(state.copyWith(
          barnAnalysis: const AsyncValue.data(
            'Tidak ada aktivitas yang tersedia untuk dianalisis.',
          ),
        ));
        return;
      }
      var barnData = '';
      for (final activity in activities) {
        barnData += '${activity.toJson()}\n';
      }
      final prompt = 'Saya adalah pemilik peternakan di Pangalengan, Bandung, Desa Margamukti. '
          'Saya ingin menganalisis aktivitas di kandang saya pada waktu $selectedTime. '
          'Berikut adalah data aktivitas yang saya miliki:\n$barnData\n'
          'Berdasarkan data tersebut, berikan analisis tentang aktivitas di kandang saya. '
          'Sertakan rekomendasi untuk meningkatkan efisiensi dan produktivitas kandang saya. '
          'Jangan lupa untuk memberikan saran yang relevan dengan kondisi kandang saya di Pangalengan, Bandung. '
          'Berikan analisis singkat namun informatif dalam beberapa kalimat saja dan hanya dalam teks biasa, jangan poin-poin, dan jangan dalam format md. Hanya teks biasa. Kamu bisa menambahkan \n agar lebih mudah dibaca. Pisahkan informasi dan rekomendasi.';
      final res = await Gemini.instance.chat([
        Content(parts: [
          Part.text(prompt),
        ],
          role: 'user',),
      ]);
      final output = res?.output;
      emit(state.copyWith(
        barnAnalysis: AsyncValue.data(
          output ?? 'Tidak ada analisis yang tersedia.',
        ),
      ),);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      debugPrint('error: $e');
      emit(state.copyWith(
        barnAnalysis: const AsyncValue.data(
          'Terjadi kesalahan saat menghasilkan analisis',),
      ),);
    }
  }
}
