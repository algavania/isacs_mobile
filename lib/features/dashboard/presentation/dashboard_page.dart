import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:isacs_mobile/l10n/l10n.dart';
import 'package:isacs_mobile/routes/router.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        ChopperRoute(),
        BarnRoute(),
        StatisticsRoute(),
        SettingsRoute(),
      ],
      transitionBuilder: (context,child,animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(IconsaxPlusBold.home),
                label: context.l10n.home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Symbols.gite),
                label: context.l10n.barn,
              ),
              BottomNavigationBarItem(
                icon: const Icon(IconsaxPlusBold.chart_1),
                label: context.l10n.statistics,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: context.l10n.settings,
              ),
            ],
          ),
        );
      },
    );
  }
}
