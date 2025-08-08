import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isacs_mobile/core/async_value.dart';
import 'package:isacs_mobile/core/database.dart';
import 'package:isacs_mobile/features/chopper/data/machine_activity_model.dart';

part 'chopper_state.dart';

part 'chopper_cubit.freezed.dart';

class ChopperCubit extends Cubit<ChopperState> {
  ChopperCubit()
      : super(
          const ChopperState(
            chopperStatus: AsyncValue.loading(),
            activities: AsyncValue.loading(),
            allActivities: AsyncValue.loading(),
          ),
        ) {
    Database.realtimeDb.ref('relay_status').get().then((snapshot) {
      if (snapshot.exists) {
        final status = snapshot.value as bool?;
        if (status != null) {
          setChopperStatus(status: status);
        }
      }
    });
    Database.realtimeDb.ref('relay_status').onValue.listen((event) {
      final status = event.snapshot.value as bool?;
      if (status != null) {
        setChopperStatus(status: status);
      }
    });
  }

  void setChopperStatus({required bool status}) {
    emit(state.copyWith(chopperStatus: const AsyncValue.loading()));
    Database.realtimeDb.ref('/').update({
      'relay_status': status,
    });
    emit(state.copyWith(chopperStatus: AsyncValue.data(status)));
  }
}
