import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:isacs_mobile/features/pages.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    CustomRoute<void>(
      page: SplashRoute.page,
      path: '/splash',
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute<void>(
      page: DashboardRoute.page,
      path: '/',
      transitionsBuilder: TransitionsBuilders.fadeIn,
      children: [
        CustomRoute<void>(
          page: ChopperRoute.page,
          path: 'chopper',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute<void>(
          page: StatisticsRoute.page,
          path: 'statistics',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute<void>(
          page: BarnRoute.page,
          path: 'barn',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute<void>(
          page: SettingsRoute.page,
          path: 'settings',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ],
    ),
  ];
}
