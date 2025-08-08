
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:isacs_mobile/core/app_theme_data.dart';
import 'package:isacs_mobile/core/color_values.dart';
import 'package:isacs_mobile/features/barn/presentation/cubit/barn_cubit.dart';
import 'package:isacs_mobile/features/chopper/presentation/cubit/chopper_cubit.dart';
import 'package:isacs_mobile/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:isacs_mobile/features/statistics/presentation/cubit/statistics_cubit.dart';
import 'package:isacs_mobile/injector/injector.dart';
import 'package:isacs_mobile/l10n/l10n.dart';
import 'package:isacs_mobile/routes/router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';

final appRouter = AppRouter();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, __, ___) {
        return GlobalLoaderOverlay(
          overlayWidgetBuilder: (_) => const Center(
            child: SpinKitChasingDots(
              color: ColorValues.primary50,
            ),
          ),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => Injector.instance<ChopperCubit>(),
              ),
              BlocProvider(
                create: (_) => Injector.instance<BarnCubit>(),
              ),
              BlocProvider(
                create: (_) => Injector.instance<StatisticsCubit>(),
              ),
              BlocProvider(
                create: (_) => Injector.instance<SettingsCubit>(),
              ),
            ],
            child: MaterialApp.router(
              theme: AppThemeData.getTheme(context),
              routerDelegate: appRouter.delegate(),
              routeInformationParser: appRouter.defaultRouteParser(),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              debugShowCheckedModeBanner: false,
            ),
          ),
        );
      },
    );
  }
}
