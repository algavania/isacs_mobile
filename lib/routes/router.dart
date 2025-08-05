import 'package:auto_route/auto_route.dart';
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
  ];
}
