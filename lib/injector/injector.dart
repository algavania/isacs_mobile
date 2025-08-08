import 'package:get_it/get_it.dart';
import 'package:isacs_mobile/injector/modules/bloc_module.dart';

class Injector {
  Injector._();

  static GetIt instance = GetIt.instance;

  static void init() {
    BlocModule.init();
  }

  static void reset() {
    instance.reset();
  }

  static void resetLazySingleton() {
    instance.resetLazySingleton();
  }
}
