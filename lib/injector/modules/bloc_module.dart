import 'package:isacs_mobile/features/barn/presentation/cubit/barn_cubit.dart';
import 'package:isacs_mobile/features/chopper/presentation/cubit/chopper_cubit.dart';
import 'package:isacs_mobile/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:isacs_mobile/features/statistics/presentation/cubit/statistics_cubit.dart';
import 'package:isacs_mobile/injector/injector.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    Injector.instance.registerLazySingleton<ChopperCubit>(
      ChopperCubit.new,
    );
    Injector.instance.registerLazySingleton<BarnCubit>(
      BarnCubit.new,
    );
    Injector.instance.registerLazySingleton<StatisticsCubit>(
      StatisticsCubit.new,
    );
    Injector.instance.registerLazySingleton<SettingsCubit>(
      SettingsCubit.new,
    );
  }
}
